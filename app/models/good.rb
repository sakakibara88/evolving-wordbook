class Good < ApplicationRecord
  belongs_to :content
  belongs_to :user
  validates_uniqueness_of :content_id, scope: :user_id
end
