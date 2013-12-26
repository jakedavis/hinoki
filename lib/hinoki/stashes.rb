# hinoki/stashes.rb

require 'json'

class Hinoki
  module Stashes

    # Lists all stashes
    def self.all(limit=nil, offset=nil)
      # TODO : Limit, offset
      return @conn.get('/stashes')
    end

    # Add a new stash (JSON formatted)
    def self.create(payload, expiration=nil)
      # TODO : paylod, expiration
      return @conn.post('/stashes')
    end 

    # Get information about a specific stash
    def self.by_name(stash)
      return @conn.get("/stashes/#{stash}")
    end

    # Remove a stash
    def self.delete(stash)
      return @conn.delete("/stashes/#{stash}")
    end

  end
end
