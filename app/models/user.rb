class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :books
         has_many :impressions, dependent: :destroy

         validates :name,length: { in: 2..20 }
         validates :name, presence: true
end
