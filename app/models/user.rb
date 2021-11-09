class User < ApplicationRecord
  after_create :set_role

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts

  def set_role
    self.add_role(:user) if self.roles.blank?
  end

  def cart 
    return Cart.find_by(user_id: id, completed: false) || Cart.create(user_id: id, completed: false, price: 0)
  end
end
