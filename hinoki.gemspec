#!/usr/bin/env ruby

lib = File.expand_path('../lib', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'hinoki/version'

Gem::Specification.new do |s|
  s.name          = 'hinoki'
  s.version       = Hinoki::VERSION
  s.summary       = 'Sensu CLI utility'
  s.description   = 'A programmatic CLI utility for interacting with the Sensu API'
  s.author        = 'Jake Davis'
  s.email         = 'jake.davis5989@gmail.com'
  s.licenses      = 'Apache 2.0'
  s.homepage      = 'http://github.com/jakedavis/hinoki'
  s.files         = Dir.glob('**/*')
  s.require_paths = ['lib']
end
