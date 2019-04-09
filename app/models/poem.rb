class Poem < ApplicationRecord

	has_many :chapters
	has_many :links, as: :linkable


	def main_link
		links.first || chapters.includes(:links).map(&:links).flatten.compact.first
	end
end
