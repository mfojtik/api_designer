#encoding: utf-8

require 'rubygems'

require_relative './lib/schema'
require_relative './lib/entity'


desc "Open a pry console for debugging API design"
task :console do
  require 'pry'
  require_relative './models/cfme'
  binding.pry
end

desc "Build the Entity Relation Diagram"
task :generate do
  require_relative './models/cfme'
  Designer::Graph.erd_plot(CFME::EntryPoint, :title => 'CFME REST API')
end
