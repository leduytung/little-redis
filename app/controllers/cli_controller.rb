class CliController < ApplicationController
  layout "cli"
  def index
      query = { name: "Stranger" }
      @result = {ans: 'OK'}
  end
end