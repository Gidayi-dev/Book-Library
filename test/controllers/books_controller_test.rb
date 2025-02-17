require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get books_url
    assert_response :success
  end
  # test "the truth" do
  #   assert true
  # end
end
