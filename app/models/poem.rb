class Poem < ApplicationRecord

	has_many :chapters, dependent: :destroy
	has_many :links, as: :linkable, dependent: :destroy

	accepts_nested_attributes_for :chapters, allow_destroy: true


	def main_link
		links.first || chapters.includes(:links).map(&:links).flatten.compact.first
	end

	def desc
		super.presence || chapters.first.lines.first(3).map(&:body).join(" && ").gsub('&&', ' ..  ')
	end
end
