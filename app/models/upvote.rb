class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :feature
end
