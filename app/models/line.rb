class Line < ApplicationRecord
	SEPARATOR = '&&'

	belongs_to :chapter
end
