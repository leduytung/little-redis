module ExcuteCommand
  class SnapshotExcute
    def initialize(command_line)
      @command = command_line[0]
    end

    def process()
      case @command
      when Commands::SAVE
        File.open("data_snapshot.yml", "w") { |file| file.write($global_data.to_yaml) }
        return "OK"
      when Commands::RESTORE
        $global_data = YAML.load(File.read("data_snapshot.yml"))
        return "OK"
      end
    end
  end
end