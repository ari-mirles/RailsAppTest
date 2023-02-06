class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @author = Author.find(@book.author_id)
  end

  def new
    @book = Book.new
  end

  def create
    @author = Author.find(params[:author_id])
    @book = @author.books.create(book_params)
    redirect_to author_path(@author)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @author = Author.find(@book.author_id)

    @book.destroy
    redirect_to author_path(@author), status: :see_other
  end

  private
  def book_params
    params.require(:book).permit(:title, :synopsis)
  end
end
