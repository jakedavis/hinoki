# hinoki/client.rb

require 'hinoki/connection'

class Hinoki
  module Clients
    
    # Retrieves list of all clients
    def self.all(limit=nil, offset=nil)
      url = "/clients"
      if limit  then url.concat("?limit=#{limit}") end
      if offset then url.concat("&offset=#{offset}") end

      return Hinoki.conn.get(url)
    end

    # Gets info about a specific client
    def self.by_name(client)
      return Hinoki.conn.get("/clients/#{client}")
    end

    # Deletes a client (and resolves its events)
    def self.delete(client)
      return Hinoki.conn.delete("/clients/#{client}")
    end

    # Gets recent history of this client's status
    def self.history(client)
      return Hinoki.conn.get("/clients/#{client}/history")
    end

  end
end
