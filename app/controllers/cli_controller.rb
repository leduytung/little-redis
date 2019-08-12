class CliController < ApplicationController
  layout "cli"
  include FilterCommand
  
  def index
  end

  def excute
    command = params["command"]
    result = command.present? ? filter_command(command) : ""
    render json: {command: command, result: result}, status: :ok
  end
end