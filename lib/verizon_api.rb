require "verizon_api/version"
require 'httparty'
require 'verizon_api/api'

module VerizonApi
  require 'verizon_api/config'

  CONFIG_PATHS = ['./config/verizon.yml', '~/.verizon.yml', ]
  CONFIG_PATHS.each do |file|
    config = File.expand_path(file)
    if File.exist?(config) then
      VerizonApi::Config.load(config)
    end
  end
  %w(api_token account_id).each do |required|
    if !VerizonApi::Config[required] then
      $stderr.puts "No '#{required}' key found in any of #{CONFIG_PATHS}"
      exit(-1)
    end
  end
end
