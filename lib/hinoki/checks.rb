# hinoki/checks.rb

require 'hinoki/connection'

class Hinoki
  module Checks

    # Lists all checks
    def self.all
      return Hinoki.conn.get('/checks')
    end

    # Returns info about a specific check
    def self.by_name(check)
      return Hinoki.conn.get("/checks/#{check}")
    end

    # Request a check to be run
    def self.request(check, subscribers=[])
      payload = JSON.generate({check: check, subscribers: subscribers})

      return Hinoki.conn.post("/checks", payload)
    end

  end
end
