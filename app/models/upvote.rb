class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :feature
  belongs_to :product
end
