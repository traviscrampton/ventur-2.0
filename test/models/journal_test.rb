require 'test_helper'

class JournalTest < ActiveSupport::TestCase
	def setup
		@user = users(:gabe)
		@journal = @user.journals.build(title: "Patagonia by Bicycle",
																	 description: "A nice ride", 
																	 user_id: @user.id)
	end

	test "should be valid" do
		assert @journal.valid?
	end

	test "user id should be present" do
		@journal.user_id = nil
		assert_not @journal.valid?
	end

	test "title should be present" do
		@journal.title = "  "
		assert_not @journal.valid?
	end

	test "description should be present" do
		@journal.description = "  "
		assert_not @journal.valid?
	end

	test "title should be at most 50 characters" do
    @journal.title = "a" * 51
    assert_not @journal.valid?
  end

  #test "user should upload a journal cover image" do
  	#@journal.journal_image.blank?
  	#assert_not @journal.valid?
  #end
end
