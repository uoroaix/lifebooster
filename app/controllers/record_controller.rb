class RecordController < ApplicationController

  def index
    @user = params[:user]
    @record_id = params[:record_id]
    @plots_hr = []
    @plots_br = []
    @plots_ca = []
    if @user == 'stacey'
      username = ENV['USER_STACEY']
    else
      username = ENV['USER_BRIAN']
    end
    connector = Hexoskin::Connector.new(username, ENV['HEXOSKIN_PASSWORD'])

    data_hr = connector.get("/api/v1/data/?datatype=19&record=#{@record_id}", {}).body
    if data_hr != "[]"
    data_hr = (JSON.parse(data_hr))[0]["data"]["19"]
      data_hr.each do |array|
        @plots_hr.push [(array[0]/256*1000), array[1]]
      end
    end

    data_br = connector.get("/api/v1/data/?datatype=33&record=#{@record_id}", {}).body
    if data_br != "[]"
      data_br = (JSON.parse(data_br))[0]["data"]["33"]
      data_br.each do |array|
        @plots_br.push [(array[0]/256*1000), array[1]]
      end
    end

    data_ca = connector.get("/api/v1/data/?datatype=53&record=#{@record_id}", {}).body
    if data_br != "[]"
      data_ca = (JSON.parse(data_ca))[0]["data"]["53"]
      data_ca.each do |array|
        @plots_ca.push [(array[0]/256*1000), array[1]]
      end
    end

    flash.now[:alert] = "There are not data for this record" if data_hr == "[]" && data_br == "[]" && data_ca == "[]"

  end


end

