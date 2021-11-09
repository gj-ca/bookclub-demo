class BookCart < ApplicationRecord
  belongs_to :book
  belongs_to :cart
end
