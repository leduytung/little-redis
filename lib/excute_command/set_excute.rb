module ExcuteCommand
  class SetExcute
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
        return message.to_s
      else
        return "ERROR: #{@error}" 
      end
    end

    def excute
      # Validate part
        # Action with key does not exist
      if (!$global_data[@key] && @command != Commands::SADD)
        return @error = 'Key not found'
      end
        # Key exist but not a SET
      if $global_data[@key] && !$global_data[@key].is_a?(Set)
        return @error = "Key exist but not a Set"
      end
  
      case @command
      when Commands::SADD
        if $global_data[@key]
          @command_line.each do |value|
            $global_data[@key].add(value)
          end
        else
          $global_data[@key] = Set.new(@command_line)
        end
        return $global_data[@key].to_a
      when Commands::SMEMBERS
        $global_data[@key].to_a
      when Commands::SREM
        @command_line.each do |value|
          $global_data[@key].delete(value)
        end
        return 'OK'
      when Commands::SINTER
        first_set =  $global_data[@key]
        @command_line.each_with_index do |value, index|
          first_set = first_set & $global_data[value]
        end
        return first_set.to_a
      when Commands::SCARD
        return $global_data[@key].length
      end
    end
  end
end