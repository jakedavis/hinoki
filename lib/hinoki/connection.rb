# hinoki/connection.rb

require 'json'
require 'net/http'
require 'hinoki/config'

class Hinoki
  class Connection

    def initialize(host=nil, port=nil)
      @config = Hinoki::Config.new
      @http = Net::HTTP.new(host || @config.host, port || @config.port)
    end

    # Wrapper around Net::HTTP.get
    def get(path)
      return interpret_response(@http.get(path))
    end

    # Wrapper around Net::HTTP.post
    def post(path)
      return interpret_response(@http.post(path))
    end
    
    # Wrapper around Net::HTTP.delete
    def delete(path)
      return interpret_response(@http.delete(path))
    end

    def request(req)
      return interpret_response(@http.request(req))
    end
   
    private

    # Helper to basically handle any repsonse we could get.
    def interpret_response(response)
      case response.code.to_i
      when 200
        puts 'OK'
      when 201,202,204
        puts 'OK'
        return
      when 400
        puts 'Bad request'
        return
      when 404
        puts 'Resource not found'
        return
      when 500
        puts 'Sensu encountered an error'
        return
      else
        puts "Unexpected HTTP response code #{response.code}"
        return
      end

      return JSON.parse(response.body)
    end
  end
end
