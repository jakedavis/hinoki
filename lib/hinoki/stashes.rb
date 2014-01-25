# hinoki/stashes.rb

require 'json'
require 'hinoki/connection'

class Hinoki
  module Stashes

    @conn = Hinoki::Connection.new

    # Lists all stashes
    def self.all(limit=nil, offset=nil)
      url = "/stashes"
      if limit  then url.append("?limit=#{limit}") end
      if offset then url.append("&offset=#{offset}") end
      
      return @conn.get(url)
    end

    # Add a new stash (JSON formatted)
    def self.create(path, content, expiration=nil)
      hash = {path: path, content: content}
      if expiration then hash.merge!({expire: expiration.to_i}) end

      post = Net::HTTP::Post.new('/stashes')
      post.body=JSON.generate(hash)

      return @conn.request(post)
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
