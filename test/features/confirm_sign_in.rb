require "test_helper"

class AddNewBook < Capybara::Rails::TestCase

  setup do
    User.create! name:"ZakiAhmed", email:"reach.zaki.ahmed@gmailcom", password:"Shakira!123"
    Book.create! title:"Autobiography of Malcolm X", price: "$45", photo_url:"http://www.ultimatestock.co.uk/wp-content/uploads/2016/02/Modern-Romance-Written-By-Aziz-Ansari-500x600.jpg", author_id: mx.id
  end

test "Confirm Sign in"

visit root_path

click_link "Autobiography of Malcolm X"
within("#book")
fill_in "Name" with: "ZakiAhmed"
fill_in "Email" with: "reach.zaki.ahmed@gmailcom"
fill_in "Password" with:"Shakira!123"
click_button "Sign In"
click_link "Autobiography of Malcolm X"

assert_content page, "Autobiography of Malcolm X"
end
