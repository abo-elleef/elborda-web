class Poem < ApplicationRecord

	has_many :chapters
	has_many :links, as: :linkable
end
