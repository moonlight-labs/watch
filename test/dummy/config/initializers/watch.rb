Watch.configure do |configuration|
  configuration.watcher = lambda { |context| User.take }
end
