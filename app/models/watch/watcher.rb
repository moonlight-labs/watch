module Watch::Watcher
  augmentation do

    has_many :watches, as: :watcher, class_name: 'Watch::Watch'
    

    def watch(obj)
      raise 'Must be run from an instance' if self.nil?
      raise 'Must pass a AR object as a parameter' if obj.nil?
      Watch::Watch.where(watcher: self, watchable: obj).first_or_create
    end

    def unwatch(obj)
      raise 'Must be run from an instance' if self.nil?
      raise 'Must pass a AR object as a parameter' if obj.nil?
      Watch::Watch.where(watcher: self, watchable: obj).destroy_all
    end

    def watches?(obj)
      self.watches.where(watchable: obj).present?
    end

    def watch_bloom
      filter = JsonBloomfilter.build 10000, 0.01
      filter.add watches.pluck(:watchable_type,:watchable_id) 
      return filter  
    end

  end
end
