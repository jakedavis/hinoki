# hinoki/events.rb

class Hinoki
  class Events

    def initialize
      @conn = Hinoki::Connection.new
    end

    # Lists all events
    def all
      return @conn.get('/events')
    end

    # Returns events associated with the given client
    def for_client(client)
      return @conn.get("/events/#{client}")
    end

    # Clears an event from Sensu
    def resolve(client, check)
      return @conn.delete("/events/#{client}/#{check}")
    end

  end
end
