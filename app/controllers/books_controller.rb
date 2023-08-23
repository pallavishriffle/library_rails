class BooksController < ApplicationController
    def index
    @books = Book.all
    render json: @books
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render plain: "book was succesfully added"
    else
        render :new, status: 422
    end 
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
        render plain: "book was update succesfully added"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    render plain: "book deleted succesfully "
end

  private
    def book_params
        params.permit(:title, :author, :publication_year)
     
    end
     
end
