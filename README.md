# Hinoki
A programmatic interface to the Sensu API. Named after the
[Japanese tree](http://en.wikipedia.org/wiki/Chamaecyparis_obtusa) which were 
(are?) once used for Japanese hand fans (Sensu).

## Usage
This gem is designed to be easy to use and programmatic. It is basically just a
light Net::HTTP wrapper. Things are namespaced by API endpoint first, and then
by a DSL-like logical description of the desired task. Where appropriate, the
same terminology is used across endpoints.

### Configuration
Hinoki looks for a config file in `~/.hinoki`. If it does not find this
configuration file, it will assume it should contact `localhost:4567` for all
requests. The config file is JSON format and accepts only a `host` and `port`
parameter at present.

``` json
{
  "host": "sensu.example.com",
  "port": 5000
}
```

### Examples
``` ruby
require 'hinoki'
h = Hinoki.new

h.checks.all
h.checks.by_name('check_flux_capacitor')
h.checks.request('check_flux_capacitor', ['my_client'])

h.events.all
h.events.for_client('my_client')
h.events.resolve('my_client', 'check_flux_capacitor')

h.clients.all
h.clients.by_name('my_client')
h.clients.history('my_client')
h.clients.delete('my_client')

h.stashes.all
h.stashes.create('/test', {reason: 'because reasons'}}
h.stashes.by_name('/test')
h.stashes.delete('/test')

h.aggregates.all
h.aggregates.by_name('my_aggregate')
h.aggregates.summarize('my_aggregate')
h.aggregates.delete('my_aggregate')
```

## Author and License
Jake Davis \<jake.davis5989@gmail.com\>

Apache License, Version 2.0
