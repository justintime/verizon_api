class VerizonApi::Config
  def self.load(source)
    @config = {
      :api_host           => 'api.edgecast.com',
      :api_token          => nil,
    }

    if source.is_a?(String)
      raise "Config file #{source} not found" unless File.exist?(source)

      config = YAML.load_file(source)
      @config.merge! config if config

    elsif source.is_a?(Hash)
      @config.merge! source
    end
  end

  def self.include?(key)
    @config.include?(key)
  end

  def self.[](key)
    return nil unless @config
    @config[key]
  end

  def self.to_yaml
    return nil unless @config
    @config.to_yaml
  end
end
