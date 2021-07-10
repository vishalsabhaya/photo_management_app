require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def setup
    @user = User.new(user_name: "unifa12345", password: "testunifa123")
    @image = @user.images.build(title: 'image 1', photo: upload_file("#{Rails.root}/public/images/home_main_family.jpeg"), created_at: DateTime.now()-2, updated_at: DateTime.now()-2)
  end

  test "object is valid" do
    assert @image.valid?
  end

  test "title must be present" do
    @image.title = nil
    assert_not @image.valid?
  end

  test "title maximum character not more than 30 " do
    @image.title = "u" * 31
    assert_not @image.valid?
  end

  test "photo must be present" do
    @image.photo.purge #delete image
    assert_not @image.valid?
  end

end
