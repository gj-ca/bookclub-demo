class Cart < ApplicationRecord
  belongs_to :user

  validate :check_that_no_cart_for_that_user_exists
  has_many :book_carts, dependent: :destroy
  has_many :books, through: :book_carts

  def check_that_no_cart_for_that_user_exists
    uncompleted_carts = Cart.where(user_id: user, completed: false)
    if uncompleted_carts.count > 0
      errors.add(:base, "ya boi can't make any more carts")
    end
  end
end
