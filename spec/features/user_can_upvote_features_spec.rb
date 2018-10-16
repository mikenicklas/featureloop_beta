require 'rails_helper'

RSpec.feature "user can upvote features", type: :feature do
  let(:product) { create(:product) }
  let(:feature_owner) { create(:user) }
  let(:feature) { create(:feature, user: feature_owner) }
  let(:upvoter) { create(:user) }

  before do
    Apartment::Tenant.switch! product.subdomain
    feature
    upvoter
  end
  
  it "lets user upvote" do
    visit root_url(subdomain: product.subdomain)
    click_on "Sign in"
    fill_in "user[email]", with: upvoter.email
    fill_in "user[password]", with: "testing123"
    click_on "Log in"
    expect(page).to have_content "Most Popular"
    within(".card--feature") do
      find(".upvote").click
    end
    expect(page.body).to include "keyboard_arrow_down"
  end
end
