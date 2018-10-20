class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :product, optional: true
  has_many :features
  has_many :upvotes
  has_many :comments

  def owns_product?
    return false unless product_id
    !!Product.find(product_id)
  end
end
