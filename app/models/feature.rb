class Feature < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  enum status: { open: 0, review: 1, planned: 2, building: 3, released: 4, closed: 5 }

  def score
    rand(100)
  end

end
