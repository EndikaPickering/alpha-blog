require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.create(username: "johndoe", email: "johndoe@example.com", password: "password", admin: false)
    sign_in_as(@user)
  end

  test "get new article form and create new article" do
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: "test_article", description: "This is a test artcile" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "test_article", response.body
  end

  test "get new article form and reject invalid article submission" do
    get "/articles/new"
    assert_response :success
    assert_no_difference 'Article.count' do
      post articles_path, params: { article: { title: " ", description: "This is a test artcile with no title" } }
    end
    assert_match "error", response.body
    assert_select "div.alert"
    assert_select "h4.alert-heading"
  end
end
