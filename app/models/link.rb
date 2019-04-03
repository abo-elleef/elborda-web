class Link < ApplicationRecord

  belongs_to :linkable, polymorphic: true

  enum source: {sound_cloud: 1, you_tube: 2}
end
