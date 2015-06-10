class User < ActiveRecord::Base
  include Watch::Watcher
end
