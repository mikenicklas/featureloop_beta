class Product < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :subdomain, uniqueness: { case_sensitive: false }, presence: true

  after_create :create_tenant

  private

  def create_tenant
    Apartment::Tenant.create(subdomain)
  end
  
end
