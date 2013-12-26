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
    @aggregates = Hinoki::Aggregates.new
    @checks     = Hinoki::Checks.new
    @clients    = Hinoki::Clients.new
    @events     = Hinoki::Events.new
    @stashes    = Hinoki::Stashes.new
  end

  def self.conn
    return @conn
  end

  # Delivers information about Sensu and RabbitMQ performance
  def health(consumers=1, messages=1)
    # TODO : consumers, messages
    return @conn.get('/health')
  end

  # Metadata about the Sensu installation
  def info
    return @conn.get('/info')
  end

end