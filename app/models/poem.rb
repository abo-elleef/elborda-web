class Poem < ApplicationRecord

	has_many :chapters, dependent: :destroy
	has_many :links, as: :linkable, dependent: :destroy


	def main_link
		links.first || chapters.includes(:links).map(&:links).flatten.compact.first
	end

	def desc
		super.presence || chapters.first.lines.first(2).map(&:body).join(" && ").gsub('&&', ' ..  ')
	end
end
