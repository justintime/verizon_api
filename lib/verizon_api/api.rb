
class VerizonApi::Api
  include HTTParty
  require 'yaml'
  require 'json'

  # Here, we bring in all our subordinate classes
  require 'verizon_api/waf'

  headers 'Host' => 'api.edgecast.com', 'Accept' => 'Application/JSON', 'Content-Type' => 'Application/JSON'
  format :json

  MEDIA_TYPES = {:flash_media_streaming => 2, :http_large_object => 3, :http_small_object => 8, :application_delivery_network => 14}


  def initialize(account_id = VerizonApi::Config['account_id'], api_token = VerizonApi::Config['api_token'])
    self.class.base_uri "https://api.edgecast.com/v2/mcc/customers/#{account_id}"
    self.class.default_options[:headers]['Authorization'] = "TOK:#{api_token}"
  end

end
