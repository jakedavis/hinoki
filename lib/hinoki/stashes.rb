# hinoki/stashes.rb

require 'json'

class Hinoki
  class Stashes

    def initialize
      @conn = Hinoki::Connection.new
    end

    # Lists all stashes
    def all(limit=nil, offset=nil)
      # TODO : Limit, offset
      return @conn.get('/stashes')
    end

    # Add a new stash (JSON formatted)
    def create(payload, expiration=nil)
      # TODO : paylod, expiration
      return @conn.post('/stashes')
    end 

    # Get information about a specific stash
    def by_name(stash)
      return @conn.get("/stashes/#{stash}")
    end

    # Remove a stash
    def delete(stash)
      return @conn.delete("/stashes/#{stash}")
    end

  end
end
