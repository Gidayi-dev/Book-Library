class LendingHistoriesController < ApplicationController
    def borrow
        @book = Book.find(params[:id])
        @book.update(status: 'borrowed')
        LendingHistory.create(book: @book, borrower_name: params[:borrower_name], borrowed_at: Time.now)
        redirect_to @book, notice: 'Book borrowed successfully.'
    end

    def return
        @book = Book.find(params[:book_id])
        @book.update(status: 'available')
        lending_history = @book.lending_histories.where(returned_at: nill).last
        lending_history.update(returned_at: Time.now)
        redirect_to @book, notice: 'Book returned successfully.'
    end
    
end
