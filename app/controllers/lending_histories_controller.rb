
class LendingHistoriesController < ApplicationController
    before_action :set_book
  
    def new
      @lending_history = @book.lending_histories.new
    end
  
    def create
      @lending_history = @book.lending_histories.new(lending_history_params)
      @lending_history.borrowed_at = Time.current
  
      if @lending_history.save
        @book.update(status: "borrowed")  # Mark book as borrowed
        redirect_to @book, notice: "Book borrowed successfully!"
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_book
      @book = Book.find(params[:book_id])
    end
  
    def lending_history_params
      params.require(:lending_history).permit(:borrower_name)
    end
  end
  