class Poem < ApplicationRecord
	DEFAULT_CHAPTER_SIZE = 20
	has_many :chapters, dependent: :destroy
	has_many :links, as: :linkable, dependent: :destroy
  scope :published, -> { where(published: true) }
	accepts_nested_attributes_for :chapters, allow_destroy: true


	def main_link
		links.first || chapters.map(&:links).flatten.compact.first
	end

	def desc
		super.presence || chapters.first.lines.first(3).map(&:body).join(" && ").gsub('&&', ' ..  ')
	end

	def sides?
		true
	end
end
