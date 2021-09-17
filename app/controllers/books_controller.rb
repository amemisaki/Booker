class BooksController < ApplicationController
  def index
  end

  def books
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def create
      @book = Book.new(book_params)
      if @book.save
        last_id = Book.last(1)
        flash[:notice] = 'Create successfully'
      redirect_to controller: :books, action: :show, id: last_id
      else
        @books = Book.all
        render template: 'books/books'
      end
  end
  
  def update
    @book = Book.find(params[:id])
    if
      @book.update(book_params)
      flash[:notice] = 'Update successfully'
      redirect_to controller: :books, action: :show, id: params[:id]
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Delete successfully'
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
