module Watch
  class Watch < ActiveRecord::Base
    belongs_to :watcher, polymorphic: true, touch: true
    belongs_to :watchable, polymorphic: true

    def self.watch!(watcher, watchable)
      raise 'A valid watcher is required' if watcher.nil?
      raise 'A valid watchable is required' if watchable.nil?

      self.find_or_create_by!(watcher: watcher, watchable: watchable)
    end

    def self.unwatch!(watcher, watchable)
      raise 'A valid watcher is required' if watcher.nil?
      raise 'A valid watchable is required' if watchable.nil?

      watch = self.find_by(watcher: watcher, watchable: watchable)
      watch.destroy! if watch
    end

    def self.bloom(watcher)
      filter = new JsonBloomFilter(size: watcher.watches.count)
      filter.add(watcher.watches.pluck(:watchable_type,:watchable_id))
      return filter
    end

  end
end
