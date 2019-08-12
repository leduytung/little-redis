module FilterCommand
  def filter_command(command)
    split_command = command.downcase.split(' ')
    
    if Commands::STRING_CASE.include? split_command[0]
      ExcuteCommand::StringExcute.new(split_command).process

    elsif Commands::LIST_CASE.include? split_command[0]
      ExcuteCommand::ListExcute.new(split_command).process

    elsif Commands::SET_CASE.include? split_command[0]
      ExcuteCommand::SetExcute.new(split_command).process

    elsif Commands::EXPIRE_CASE.include? split_command[0]
      ExcuteCommand::ExpirationExcute.new(split_command).process

    elsif Commands::SNAPSHOT_CASE.include? split_command[0]
      ExcuteCommand::SnapshotExcute.new(split_command).process

    else
      "#{command}: command not found"
    end
  end
end