class Feature < ApplicationRecord
  belongs_to :user
  belongs_to :product

  has_many :upvotes
  has_many :comments

  validates :title, presence: true
  validates :description, presence: true

  enum status: { open: 0, review: 1, planned: 2, building: 3, released: 4, closed: 5 }

  def score
    #count = upvotes.loaded? ? upvotes.size : upvotes.count
    upvotes.size + id + 100
  end

end
