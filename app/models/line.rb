class Line < ApplicationRecord
	SEPARATOR = '&&'

	belongs_to :chapter


	def readable_body
		body_parts.join(' .. ')
	end

	def body_parts
		body.split(SEPARATOR)
	end
end
