class Item < ApplicationRecord
  belongs_to :title
  belongs_to :user
  has_many   :contents, dependent: :destroy
  validates :item,      presence: true
  validates :user_id,   presence: true
  validates :title_id,  presence: true

  def self.search(search)
    if search == ""
    else
      return Item.all() unless search
      Item.where('item LIKE(?)', "%#{search}%")
    end
  end
end
