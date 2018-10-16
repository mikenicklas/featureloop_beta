class Feature < ApplicationRecord
  belongs_to :user

  has_many :upvotes

  validates :title, presence: true
  validates :description, presence: true

  enum status: { open: 0, review: 1, planned: 2, building: 3, released: 4, closed: 5 }

  def score
    upvotes.count
  end

end
