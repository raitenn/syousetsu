class Impression < ApplicationRecord
	belongs_to :user
    belongs_to :book

    validates :impression,    length: { in: 1..20 }
end
