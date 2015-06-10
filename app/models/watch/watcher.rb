module Watch
  module Watcher
    extend ActiveSupport::Concern

    included do
      has_many :watches, as: :watcher, dependent: :destroy, class_name: "Watch::Watch"
    end

    def watch!(watchable)
      ::Watch::Watch.watch!(self, watchable)
    end

    def unwatch!(watchable)
      ::Watch::Watch.unwatch!(self, watchable)
    end

    def watching?(watchable)
      self.watches.where(watchable: watchable).exists?
    end

  end
end
