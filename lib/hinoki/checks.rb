# hinoki/checks.rb

class Hinoki
  module Checks

    # Lists all checks
    def self.all
      return @conn.get('/checks')
    end

    # Returns info about a specific check
    def self.by_name(check)
      return @conn.get("/checks/#{check}")
    end

    # Request a check to be run
    def self.request(check)
      # TODO : Payload
      return @conn.post("/checks")
    end

  end
end
