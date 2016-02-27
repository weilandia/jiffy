require 'rails_helper'

RSpec.feature "User logs in and vists a category to favorite a jif" do
  scenario "they login successfully" do
    user = User.create(username: "test", email: "test@email.com", password: "password")

    category = Category.create(name: "test")

    jif = Jif.create(jif_path: "http://media2.giphy.com/media/vt8TzcnDOvTJS/giphy.gif", static_path: "http://media2.giphy.com/media/vt8TzcnDOvTJS/100_s.gif", category_id: category.id)

    jif1 = Jif.create(jif_path: "http://media3.giphy.com/media/zlaeUZnAOpuCY/giphy.gif", static_path: "http://media3.giphy.com/media/zlaeUZnAOpuCY/100_s.gif", category_id: category.id)

    jif2 = Jif.create(jif_path: "http://media3.giphy.com/media/EJ2mqTIOnOU8g/giphy.gif", static_path: "http://media3.giphy.com/media/EJ2mqTIOnOU8g/100_s.gif", category_id: category.id)

    visit root_path

    click_on "LOGIN"

    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_on "LOGIN"

    expect(current_path).to eq user_path(user)

    within "div#categories" do
      expect(page).to have_content("Categories")
      expect(page).to have_content("test")
    end
    click_on "test"

    expect(current_path).to eq category_path(category)

    within("div#category") do
      expect(page).to have_content category.name.upcase
    end

    within("div#categories") do
      expect(page).to have_content "Categories"
    end
  end
end
