class Book < ApplicationRecord
    resourcify
    belongs_to :user

    has_many :liked_books
    has_many :likers, through: :liked_books, source: :user

    has_many :favourited_books
    has_many :favouriters, through: :favourited_books, source: :user
    
    belongs_to :author
    has_many :book_genres, dependent: :destroy
    has_many :genres, through: :book_genres

    has_many :book_carts, dependent: :destroy
    has_many :carts, through: :book_carts

    has_one_attached :cover, dependent: :purge

    validates :title, presence: { message: "Please provide a title" }
    validates :date_published, presence: { message: "Please set a publication date" }
    validate :past_date

    def past_date
        if date_published >= Date.today
            errors.add(:date_published, "Date published must be in the past")
        end
    end
end
