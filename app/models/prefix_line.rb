class PrefixLine < ApplicationRecord
  default_scope { order(:sort, :id) }
	SEPARATOR = '&&'
	belongs_to :poem, optional: true

	def readable_body
		body_parts.join(' .. ')
	end

	def body_parts
		body.split(SEPARATOR).map(&:strip)
	end
end
