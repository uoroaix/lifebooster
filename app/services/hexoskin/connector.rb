require 'digest/sha1'

class Hexoskin::Connector

  BASE_URL        = 'https://api.hexoskin.com'
  PUBLIC_API_KEY  = '6IIkNxGO0xIeHZLh'
  PRIVATE_API_KEY = ENV['HEXOSKIN_PRIVATE_KEY']

  def initialize(basic_auth_user_name, basic_auth_password)
    @basic_auth_user_name, @basic_auth_password = basic_auth_user_name, basic_auth_password
  end

  def get(url, req_body)
    time = (Time.now.getutc.to_i).to_s
    conn.get do |req|
      req.url url
      req.headers['X-HEXOTIMESTAMP']    = time
      req.headers['X-HEXOAPIKEY']       = PUBLIC_API_KEY
      req.headers['X-HEXOAPISIGNATURE'] = Digest::SHA1.hexdigest("#{PRIVATE_API_KEY}#{time}#{BASE_URL}#{url}")
      req.body                          = req_body.to_json
    end
  end

  def conn
    conn = Faraday.new(:url => BASE_URL) do |faraday|
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    conn.basic_auth(@basic_auth_user_name, @basic_auth_password)
    conn
  end

end





