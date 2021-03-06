class Line < ApplicationRecord
	SEPARATOR = '&&'

	belongs_to :chapter
	belongs_to :poem


	def readable_body
		body_parts.join(' .. ')
	end

	def body_parts
		body.split(SEPARATOR)
	end
end
