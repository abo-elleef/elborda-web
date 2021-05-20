class Poem < ApplicationRecord
	DEFAULT_CHAPTER_SIZE = 20
	has_many :chapters, dependent: :destroy
	has_many :links, as: :linkable, dependent: :destroy

	accepts_nested_attributes_for :chapters, allow_destroy: true


	def main_link
		v_id = chapters.map(&:video_id).compact.first
		if false &&  v_id.present?
			"https://img.youtube.com/vi/#{v_id}/hqdefault.jpg"
		else
			# should be removed after completely move to youtube and normalize data
			links.first || chapters.includes(:links).map(&:links).flatten.compact.first	
		end
	end

	def desc
		content = chapters.map(&:content).compact.first
		if content.present?
			super.presence || content
		else
			super.presence || chapters.first.lines.first(3).map(&:body).join(" && ").gsub('&&', ' ..  ')	
		end
		
	end
end
