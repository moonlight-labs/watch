class User < ActiveRecord::Base
  
  augment Watch::Watchable
  augment Watch::Watcher

end
