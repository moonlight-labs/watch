require "watch/engine"

# Augmentations
class ::Object
  def self.augment(*mods)
    include *mods
    mods.each {|mod| class_eval &mod.augmentation }
  end
end

class ::Module
  def augmentation(&block)
    @augmentation ||= block
  end
end


module Watch
end
