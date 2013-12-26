# hinoki/aggregates.rb

class Hinoki
  module Aggregates

    # Return a list of all aggregates
    def self.all(limit=nil, offset=nil)
      # TODO : limit, offset
      return @conn.get('/aggregates')
    end

    # Return a specific aggregate check
    def self.by_name(name, age=nil)
      # TODO : age
      return @conn.get("/aggregates/#{name}")
    end

    # Delete an aggregate check
    def self.delete(name)
      return @conn.delete("/aggregates/#{name}")
    end

    # ??? idgi
    def self.summarize(name)
    end

  end
end
