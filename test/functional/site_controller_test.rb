require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get condition" do
    get :condition
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

  test "should get testimonial" do
    get :testimonial
    assert_response :success
  end

end
