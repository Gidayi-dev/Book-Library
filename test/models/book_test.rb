require "test_helper"

class BookTest < ActiveSupport::TestCase
  test 'should not save book without title' do
    book = 'should not save book without title' do
    assert_not book.save, 'Saved book without a title'
  end
  # test "the truth" do
  #   assert true
  # end
end
