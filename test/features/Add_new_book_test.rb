require "test_helper"

class AddNewBook < Capybara::Rails::TestCase

setup do
  Author.create! first_name: "Malcolm", last_name: "X", bio: "YYYYYY", photo_id:"http://www.ultimatestock.co.uk/wp-content/uploads/2016/02/Modern-Romance-Written-By-Aziz-Ansari-500x600.jpg"
end
test "Can Add New Book" do

  visit root_path

  click_link "New Book"
  within("#new_book") do
  fill_in "Title", with: "MODERN ROMANCE"
  fill_in "Price", with: "$33"
  fill_in "Photo", with: "http://www.ultimatestock.co.uk/wp-content/uploads/2016/02/Modern-Romance-Written-By-Aziz-Ansari-500x600.jpg"
  save_and_open_page
  select("Malcolm X", from: "Author")
  click_button "Create Book"

  assert_content page, "MODERN ROMANCE"
end
end
end
