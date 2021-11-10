class User < ApplicationRecord
  after_create :set_role

  # reviews a user has created
  has_many :reviews_made, class_name: "Review", foreign_key: :reviewer_id
  # reviews of a user
  has_many :reviews_of, class_name: "Review", foreign_key: :reviewee_id




  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts

  #owned 
  has_many :books
  #liked
  has_many :liked_books #joining table
  has_many :liked, through: :liked_books, source: :book #method relationship
  #fav'd
  has_many :favourited_books
  has_many :favourited, through: :favourited_books, source: :book

  def set_role
    self.add_role(:user) if self.roles.blank?
  end

  def cart 
    return Cart.find_by(user_id: id, completed: false) || Cart.create(user_id: id, completed: false, price: 0)
  end
end
