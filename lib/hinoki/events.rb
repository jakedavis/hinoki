# hinoki/events.rb

require 'hinoki/connection'

class Hinoki
  module Events

    # Lists all events
    def self.all
      return Hinoki.conn.get('/events')
    end

    # Returns events associated with the given client
    def self.for_client(client)
      return Hinoki.conn.get("/events/#{client}")
    end

    # Clears an event from Sensu
    def self.resolve(client, check)
      return Hinoki.conn.delete("/events/#{client}/#{check}")
    end

  end
end
