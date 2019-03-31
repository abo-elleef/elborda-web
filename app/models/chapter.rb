class Chapter < ApplicationRecord
	belongs_to :poem
	has_many :lines
end
