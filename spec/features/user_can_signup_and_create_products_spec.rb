require 'rails_helper'

RSpec.feature "user can signup and create products", type: :feature do
  
  it "creates accessible product subdomain" do
    visit root_path
    click_on "Register"
    fill_in "user[email]", with: "testing@example.com"
    fill_in "user[username]", with: "awesome_user"
    fill_in "user[password]", with: "testing123"
    fill_in "user[password_confirmation]", with: "testing123"
    click_on "Sign up"
    expect(page).to have_content "Start tracking feature requests for your app"
    fill_in "product[name]", with: "Google"
    fill_in "product[subdomain]", with: "google"
    click_on "Start tracking feature requests!"
    expect(page).to have_content "Suggest a feature"
    expect(Product.find_by_subdomain("google")).to be_truthy
    expect(User.find_by_username("awesome_user")).to be_truthy
  end

end
