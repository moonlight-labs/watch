module Watch
  module Watchable
    extend ActiveSupport::Concern

    included do
      has_many :watchers, as: :watchable, dependent: :destroy, class_name: "Watch::Watch"
    end
  end
end
