# hinoki/checks.rb

class Hinoki
  class Checks

    def initialize
      @conn = Hinoki::Connection.new
    end

    # Lists all checks
    def all
      return @conn.get('/checks')
    end

    # Returns info about a specific check
    def by_name(check)
      return @conn.get("/checks/#{check}")
    end

    # Request a check to be run
    def request(check)
      # TODO : Payload
      return @conn.post("/checks")
    end

  end
end
