class Vote < ApplicationRecord
	belongs_to :adventure, optional: true
	belongs_to :post, optional: true
end
