class Book < ApplicationRecord
	has_many :chapter
	 belongs_to :user
	 has_many :impressions, dependent: :destroy

	 validates :title,    length: { in: 1..30 }        # 「1文字以上75文字以下」
	 validates :arasuji,    length: { in: 1..50 }

end
