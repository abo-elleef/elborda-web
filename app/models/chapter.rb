class Chapter < ApplicationRecord
	belongs_to :poem
	has_many :lines
	has_many :links, as: :linkable
end
