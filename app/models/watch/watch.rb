module Watch
  class Watch < ActiveRecord::Base
    belongs_to :watcher,   polymorphic: true
    belongs_to :watchable, polymorphic: true

    scope :by_type, -> { group(:watchable_type) }

  end
end
