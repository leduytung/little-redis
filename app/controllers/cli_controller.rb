class CliController < ApplicationController
  layout "cli"
  include FilterCommand
  
  def index
  end

  def excute
    command = params["command"]
    if command.present?
      result = filter_command(command)
    else
      result = ""
    end
    render json: {command: command, result: result}, status: :ok
  end
end