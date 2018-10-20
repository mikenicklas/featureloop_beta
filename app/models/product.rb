class Product < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :subdomain, uniqueness: { case_sensitive: false }, presence: true

  def self.current(subdomain)
    return unless subdomain
    return if ExcludedSubdomains.include? subdomain
    find_by_subdomain(subdomain)
  end

end
