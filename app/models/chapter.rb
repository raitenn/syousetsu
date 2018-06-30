class Chapter < ApplicationRecord
	 belongs_to :book

	 validates :subtitle,    length: { in: 1..30 }        # 「1文字以上75文字以下」
end
