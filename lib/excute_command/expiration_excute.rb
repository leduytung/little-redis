module ExcuteCommand
  class ExpirationExcute
    def initialize(command_line)
      @command = command_line[0]
      @key = command_line[1]
      @value = command_line[2]
    end

    def process()
      case @command
      when Commands::KEYS
        return $global_data.keys.to_s
      when Commands::DEL
        $global_data.delete(@key)
        return @key
      when Commands::FLUSHDB
        $global_data = {}
        return 'OK'
      when Commands::EXPIRE
        return $expiration_setup[@key] = @value
      when Commands::TTL
        return $expiration_setup[@key]
      end
    end
  end
end