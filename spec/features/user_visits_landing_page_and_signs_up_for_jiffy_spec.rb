require 'rails_helper'

RSpec.feature "User signs up for Jiffy" do
  scenario "they signup and see their profile page" do
    visit root_path
    click_on "LOGIN"

    click_on "SIGNUP"

    fill_in "username", with: "User"
    fill_in "email", with: "user@gmail.com"
    fill_in "password", with: "password"

    click_on "JOIN"

    within("nav") do
      expect(page).to have_link "LOGOUT"
    end

    within("div#favorite_jifs") do
      expect(page).to have_content "Favorite Jifs!"
      expect(page).to have_content "No favorites yet!"
    end

    within("div#categories") do
      expect(page).to have_content "Categories"
    end
  end
end
