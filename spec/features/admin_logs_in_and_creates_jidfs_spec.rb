require 'rails_helper'

RSpec.feature "Admin logs in and creates jifs" do
  scenario "they login successfully" do
    admin = User.create(username: "admin", email: "admin", password: "password", role: 1)

    Category.create(name: "test")

    visit root_path
    click_on "LOGIN"

    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_on  "LOGIN"

    expect(current_path).to eq admin_user_path(admin)

    within "div#categories" do
      expect(page).to have_content("Categories")
      expect(page).to have_content("test")
    end

    fill_in "category", with: "manzana"

    click_on "CREATE"

    within "div#categories" do
      expect(page).to have_content("Categories")
      expect(page).to have_content("manzana")
    end

    expect(Category.find_by(name:"manzana").jifs.all.first.class).to eq(Jif)
  end
end
