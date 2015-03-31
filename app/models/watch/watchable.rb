module Watch::Watchable
  augmentation do 
    has_many :watchers, as: :watchable, class_name: 'Watch::Watch'

  end
end
