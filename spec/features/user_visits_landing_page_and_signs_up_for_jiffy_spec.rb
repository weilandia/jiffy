require 'rails_helper'

RSpec.feature "User signs up for Jiffy" do
  scenario "they signup and see their profile page" do
    visit root
    click_on "Login"

    click_on "Signup"

    fill_in "username", with: "User"
    fill_in "email", with: "user@gmail.com"
    fill_in "password", with: "password"

    click_on "Join"

    within("nav") do
      expect(page).to have_link "Logout"
      expect(page).to have_link "Jiffy"
    end

    within("div#favorite_jifs") do
      expect(page).to have_content "Favorite Jifs"
      expect(page).to have_content "No favorites yet!"
    end

    within("div") do
      expect(page).to have_content "Categories"
    end
  end
