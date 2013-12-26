# hinoki/events.rb

require 'hinoki/connection'

class Hinoki
  module Events

    @conn = Hinoki::Connection.new

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
