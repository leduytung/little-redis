module ExcuteCommand
  class ListExcute
    def initialize(command_line)
      @command_line = command_line
      # Frist element is command
      @command = command_line.delete_at(0)
      # Second element is key
      @key = command_line.delete_at(0)
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
      if (!$global_data[@key] && @command != Commands::RPUSH) 
        return @error = "Key not found"
      end
        # Key exist but not a SET
      if $global_data[@key] && !$global_data[@key].is_a?(DataStructure::LinkedList)
        return @error = "Key exist but not a List"
      end 
      
      case @command
      when Commands::RPUSH
        if !$global_data[@key]
          $global_data[@key] = DataStructure::LinkedList.new()
        end
        @command_line.each do |value|
          $global_data[@key].add(value)
        end
        $global_data[@key].size
      when Commands::LLEN
        $global_data[@key].size
      when Commands::LPOP
        $global_data[@key].lpop()
      when Commands::RPOP
        $global_data[@key].rpop()
      when Commands::LRANGE
        start = @command_line[0]
        stop = @command_line[1]
        $global_data[@key].lrange(start.to_i, stop.to_i)
      end
    end


  end
end