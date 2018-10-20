class Product < ApplicationRecord
  has_many :users
  has_many :features
  has_many :upvotes
  has_many :comments

  validates :name, presence: true
  validates :subdomain, uniqueness: { case_sensitive: false }, presence: true

  def self.current(subdomain)
    return unless subdomain
    return if ExcludedSubdomains.include? subdomain
    find_by_subdomain(subdomain)
  end

end
