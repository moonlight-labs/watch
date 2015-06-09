require 'json-bloomfilter'

class User < ActiveRecord::Base
  include Watch::Watcher
end
