require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test 'should not save book without title' do
    book = Book.new(author: 'Author', status: 'available')
    assert_not book.save, 'Saved book without a title'
  end
  # test "the truth" do
  #   assert true
  # end
end
