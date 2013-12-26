# hinoki/aggregates.rb

require 'hinoki/connection'

class Hinoki
  module Aggregates

    @conn = Hinoki::Connection.new

    # Return a list of all aggregates
    def self.all(limit=nil, offset=nil)
      url = "/aggregates"
      if limit  then url.append("?limit=#{limit}") end
      if offset then url.append("&offset=#{offset}") end

      return @conn.get(url)
    end

    # Return a specific aggregate check
    def self.by_name(name, age=nil)
      url = "/aggregates/#{name}"
      if age then url.append("?age=#{age}") end

      return @conn.get(url)
    end

    # Delete an aggregate check
    def self.delete(name)
      return @conn.delete("/aggregates/#{name}")
    end

    # Returns the list of aggregates
    def self.summarize(name, summarize=nil, results=false)
      url = "/aggregates"
      if summarize && results
        url.append("?summarize=#{summarize}&results=#{results}")
      elsif summarize 
        url.append("?summarize=#{summarize}")
      elsif results 
        url.append("?results=#{results}") 
      end

      return @conn.get(url)
    end

  end
end
