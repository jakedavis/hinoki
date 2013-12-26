# hinoki/checks.rb

require 'hinoki/connection'

class Hinoki
  module Checks

    @conn = Hinoki::Connection.new

    # Lists all checks
    def self.all
      return @conn.get('/checks')
    end

    # Returns info about a specific check
    def self.by_name(check)
      return @conn.get("/checks/#{check}")
    end

    # Request a check to be run
    def self.request(check, subscribers=[])
      payload = JSON.generate({check: check, subscribers: subscribers})

      return @conn.post("/checks", payload)
    end

  end
end
