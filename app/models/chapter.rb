class Chapter < ApplicationRecord
	belongs_to :poem
	has_many :lines, dependent: :destroy
	has_many :links, as: :linkable, dependent: :destroy
end
