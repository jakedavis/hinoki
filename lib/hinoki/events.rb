# hinoki/events.rb

class Hinoki
  module Events

    # Lists all events
    def self.all
      return @conn.get('/events')
    end

    # Returns events associated with the given client
    def self.for_client(client)
      return @conn.get("/events/#{client}")
    end

    # Clears an event from Sensu
    def self.resolve(client, check)
      return @conn.delete("/events/#{client}/#{check}")
    end

  end
end
