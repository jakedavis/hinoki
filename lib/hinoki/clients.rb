# hinoki/client.rb

class Hinoki
  module Clients

    # Retrieves list of all clients
    def self.all(limit=nil, offset=nil)
      # TODO : limit, offset
      return @conn.get('/clients')
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
