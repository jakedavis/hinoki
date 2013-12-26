# hinoki/client.rb

require 'hinoki/connection'

class Hinoki
  module Clients
    
    @conn = Hinoki::Connection.new

    # Retrieves list of all clients
    def self.all(limit=nil, offset=nil)
      url = "/clients"
      if limit  then url.append("?limit=#{limit}") end
      if offset then url.append("&offset=#{offset}") end

      return @conn.get(url)
    end

    # Gets info about a specific client
    def self.by_name(client)
      return @conn.get("/clients/#{client}")
    end

    # Deletes a client (and resolves its events)
    def self.delete(client)
      return @conn.delete("/clients/#{client}")
    end

    # Gets recent history of this client's status
    def self.history(client)
      return @conn.get("/clients/#{client}/history")
    end

  end
end
