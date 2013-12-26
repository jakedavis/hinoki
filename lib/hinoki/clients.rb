# hinoki/client.rb

class Hinoki
  class Clients

    def initialize
      @conn = Hinoki::Connection.new
    end

    # Retrieves list of all clients
    def all(limit=nil, offset=nil)
      # TODO : limit, offset
      @conn.get('/clients')
    end

    # Gets info about a specific client
    def by_name(client)
      @conn.get("/clients/#{client}")
    end

    # Deletes a client (and resolves its events)
    def delete(client)
      @conn.delete("/clients/#{client}")
    end

    # Gets recent history of this client's status
    def history(client)
      @conn.get("/clients/#{client}/history")
    end

  end
end
