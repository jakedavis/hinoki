# hinoki/config.rb

require 'json'

class Hinoki
  class Config
    attr_accessor(:host, :port)

    def initialize
      @config = parse_config_file
      @host = @config['host']
      @port = @config['port']
    end

    private

    # Reads the base config file and parses it to a hash
    def parse_config_file(path=File.join(ENV['HOME'], '/etc', '.hinoki'))
      if !File.exists?(path)
        puts 'I was unable to find your Hinoki config file!'
        return defaults 
      end

      begin 
        return JSON.parse(File.read(path))
      rescue JSON::ParserError
        puts 'I was unable to parse your Hinoki config file!'
        return defaults
      end
    end

    # Default values if the config file cannot be located or read
    def defaults
      return {
        host: 'localhost',
        port: 4567
      }
    end

  end
end
