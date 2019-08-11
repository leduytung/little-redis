class CliController < ApplicationController
  layout "cli"
  def index
  end
  def excute
    command = params["command"]
    if command.present?
      result = "REQUESTED"
    else
      result = ""
    end
    render json: {command: command, result: result}, status: :ok
  end
end