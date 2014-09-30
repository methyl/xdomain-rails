require 'bundler/setup'

require 'xdomain_rails/engine'
require 'xdomain_rails/config'
require 'xdomain_rails/version'

module XdomainRails
  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield(config)
  end
end
