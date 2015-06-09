module Watch
  module Watcher
    extend ActiveSupport::Concern

    included do
      has_many :watches, as: :watcher, dependent: :destroy, class_name: "Watch::Watch"
    end

    def watch(object)
      Watch::Watch.watch(self, object)
    end

    def unwatch(object)
      Watch::Watch.unwatch(self, object)
    end

    def watching?(object)
      self.watches.where(watchable: object).exists?
    end

  end
end
