class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_auth, except: [:search]
  before_action :set_authors_and_genres, only: [:new, :edit, :create]
  before_action :set_book, only: [:update, :edit, :show, :destroy]

  def search
    # exact search
    # @books = Book.where(title: "a")

    # like search
    case params[:type]
    when "genre"
    when "publisher"
    when "author"
      @books = []
      authors = Author.where("first_name LIKE ?", "%#{params[:query]}%").or(Author.where("last_name LIKE ?", "%#{params[:query]}%"))
      authors.each do |author|
        author.books.each do |book|
          @books << book
        end
      end
    when "title"
      @books = Book.where("title LIKE ?", "%#{params[:query]}%")
    end
      render "index"
  end

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
