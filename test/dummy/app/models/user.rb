require 'json-bloomfilter'

class User < ActiveRecord::Base
  
  augment Watch::Watchable
  augment Watch::Watcher

  def as_json(options={})
    super.merge({watch_bloom: self.watch_bloom.to_hash})
  end

end
