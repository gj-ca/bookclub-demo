class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_auth
  before_action :set_authors_and_genres, only: [:new, :edit, :create]
  before_action :set_book, only: [:update, :edit, :show, :destroy]

  def new
    @book = Book.new
  end

  def index
    @books = Book.order(title: :asc)
  end

  def create
    @book = Book.new(book_params)
    begin
      @book.save!
      redirect_to @book
    rescue
      flash.now[:errors] = @book.errors.messages.values.flatten
      render 'new'
    end
  end

  def update
    @book.update(book_params)
    redirect_to @book
  end

  def edit
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def show
  end

  private

  def book_params
    params.require(:book).permit(:title, :publisher, :date_published, :cover, :author_id, genre_ids: [])
  end

  def set_authors_and_genres
    @authors = Author.order(:last_name)
    @genres = Genre.order(:name)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def check_auth
    authorize Book
  end
end
