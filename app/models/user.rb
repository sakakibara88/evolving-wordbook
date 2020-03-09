class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :contents
  has_many :goods
  has_many :good_contents, through: :goods, source: :content
  validates :name, presence: true

  def already_good?(content)
    self.goods.exists?(content_id: content.id)
  end
end
