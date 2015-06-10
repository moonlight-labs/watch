require "watch/engine"
require "watch/configuration"

module Watch

  def self.configuration
    @configuration ||= Configuration.new
  end
  
  def self.configure
    yield(self.configuration)
  end
  
end
