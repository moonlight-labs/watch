Watch.configure do |configuration|
  configuration.watcher = -> (context) { User.take }
end
