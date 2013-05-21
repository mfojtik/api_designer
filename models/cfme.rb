module CFME
  include Designer

  Dir[File.join(File.dirname(__FILE__), 'cfme', '*.rb')].each { |m|
    require_relative(m)
  }
end
