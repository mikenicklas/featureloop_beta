require 'rails_helper'

RSpec.feature "user can submit a feature request", type: :feature do
  let(:product) { create(:product) }
  let(:owner) { create(:user, product: product) }
  let(:subuser) { create(:user, product: product) }

  before do
  end

  it "creates feature request for product" do
    visit root_url(subdomain: product.subdomain)
    click_on "Sign in"
    fill_in "user[email]", with: subuser.email
    fill_in "user[password]", with: "testing123"
    within(".actions") { click_on "Sign in" }
    click_on "Suggest a feature"
    fill_in "feature[title]", with: "Add geolocation for mapping"
    fill_in "feature[description]", with: "Its really hard to find yourself on the map so gelocation would make it easier"
    click_on "Submit"
    expect(page).to have_css(:h1, text: "Add geolocation for mapping")
    expect(page).to have_content "Open"
  end

end
