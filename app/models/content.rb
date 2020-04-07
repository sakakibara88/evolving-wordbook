class Content < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :goods, dependent: :destroy
  has_many :good_users, through: :goods, source: :user

end
