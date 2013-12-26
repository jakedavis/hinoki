# hinoki/hinoki.rb

require 'hinoki/aggregates'
require 'hinoki/clients'
require 'hinoki/checks'
require 'hinoki/connection'
require 'hinoki/events'
require 'hinoki/stashes'

class Hinoki
  attr_accessor(:aggregates, :clients, :checks, :events, :stashes)
  
  def initialize
    @conn       = Hinoki::Connection.new
    @aggregates = Hinoki::Aggregates
    @checks     = Hinoki::Checks
    @clients    = Hinoki::Clients
    @events     = Hinoki::Events
    @stashes    = Hinoki::Stashes
  end

  # Delivers information about Sensu and RabbitMQ performance
  def health(consumers=1, messages=1)
    return @conn.get("/health?consumers=#{consumers}&messages=#{messages}")
  end

  # Metadata about the Sensu installation
  def info
    return @conn.get('/info')
  end

end
