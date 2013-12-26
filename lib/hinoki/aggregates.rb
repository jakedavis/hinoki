# hinoki/aggregates.rb

class Hinoki
  class Aggregates

    def initialize
      @conn = Hinoki::Connection.new
    end

    # Return a list of all aggregates
    def all(limit=nil, offset=nil)
      # TODO : limit, offset
      return @conn.get('/aggregates')
    end

    # Return a specific aggregate check
    def by_name(name, age=nil)
      # TODO : age
      return @conn.get("/aggregates/#{name}")
    end

    # Delete an aggregate check
    def delete(name)
      return @conn.delete("/aggregates/#{name}")
    end

    # ??? idgi
    def summarize(name)
    end

  end
end
