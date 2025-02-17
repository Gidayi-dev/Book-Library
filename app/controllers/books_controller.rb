
class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy, :return]
  
    def index
      @books = Book.all
    end
  
    def show
      @lending_histories = @book.lending_histories.order(borrowed_at: :desc)
    end
  
    def new
      @book = Book.new
    end
  
    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to books_path, notice: "Book successfully added!"
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @book.update(book_params)
        redirect_to books_path, notice: "Book successfully updated!"
      else
        render :edit
      end
    end
  
    def destroy
      @book.destroy
      redirect_to books_path, notice: "Book deleted!"
    end
  
    def return
      @book.update(status: 'available')
      lending_history = @book.lending_histories.where(returned_at: nil).last
      if lending_history
        lending_history.update(returned_at: Time.now)
      end
      redirect_to books_path, notice: 'Book successfully returned!'
    end
  
    private
  
    def set_book
      @book = Book.find(params[:id])
    end
  
    def book_params
      params.require(:book).permit(:title, :author, :description, :status)
    end
  end
  