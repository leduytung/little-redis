module ExcuteCommand
  class StringExcute
    def initialize(command_line)
      @command = command_line[0]
      @key = command_line[1]
      @value = command_line[2]
      @error = nil
    end

    def process
      message = excute()
      if @error.blank?
        return message
      else
        return "ERROR: #{@error}" 
      end
    end

    def excute
      # Validate part
        # Action with key does not exist
      if (!$global_data[@key] && @command != Commands::SET)
        return @error = "Key not found"
      end
      #   # Key exist but not a String
      # if $global_data[@key] && !$global_data[@key].is_a?(String)
      #   return @error = "Key exist but not a String"
      # end 

      case @command
      when Commands::SET
        $global_data[@key] = @value
        return 'OK'
      when Commands::GET
        $global_data[@key].to_s
      end
    end
  end
end