require 'rails_helper'

RSpec.feature "User logs in and vists a category to favorite a jif" do
  scenario "they login successfully" do
    user = User.create(username: "test", email: "test@email.com", password: "password")

    category = Category.create(name: "test")

    jif = Jif.create(jif_path: "http://media3.giphy.com/media/nrN8fUJ4EZn5m/giphy.gif", static_path: "http://media3.giphy.com/media/nrN8fUJ4EZn5m/giphy.gif", category_id: category.id, width:"250", height:"194")

    jif1 = Jif.create(jif_path: "http://media3.giphy.com/media/AOlW6QMcOuWGY/giphy.gif", static_path: "http://media3.giphy.com/media/AOlW6QMcOuWGY/giphy.gif", category_id: category.id, width:"384", height:"288")

    jif2 = Jif.create(jif_path: "http://media1.giphy.com/media/CcgO6hjOyM6lO/giphy.gif", static_path: "http://media1.giphy.com/media/CcgO6hjOyM6lO/giphy.gif", category_id: category.id, width:"320", height:"320")

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

    within("div#categories") do
      expect(page).to have_content "Categories"
    end

    within("div#jifs") do
      expect(page).to have_link "#{jif.id}-jif"
      expect(page).to have_link "#{jif1.id}-jif"
      expect(page).to have_link "#{jif2.id}-jif"
    end

    click_on "#{jif.id}-jif"

    within("div#show_jif") do
      page.has_css?('img')
    end
    within("div#jif-info") do
      expect(page).to have_button "Favorite this jif!"
      expect(page).to have_link "Category: test"
      expect(page).to have_content "source: http://media3.giphy.com/media/nrN8fUJ4EZn5m/giphy.gif"
    end

    click_on "Favorite this jif!"

    expect(current_path).to eq user_path(user)

    expect(page).to have_link "#{jif.id}-jif"
  end
end
