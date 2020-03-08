class Item < ApplicationRecord
  belongs_to :title
  belongs_to :user
  has_many   :contents
end
