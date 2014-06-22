class HexoDataController < ApplicationController

  def index
    @user = params[:user]
    if @user == 'stacey'
      username = "staceycwallin@gmail.com"
    else
      username = "bstatham85@gmail.com"
    end
    connector = Hexoskin::Connector.new(username, ENV['HEXOSKIN_PASSWORD'])
    @records = (JSON.parse(connector.get('/api/v1/record/', {}).body))["objects"]
  end

  def show

  end

  
end
