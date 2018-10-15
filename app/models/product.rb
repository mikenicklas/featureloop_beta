class Product < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :subdomain, uniqueness: { case_sensitive: false }, presence: true
end
