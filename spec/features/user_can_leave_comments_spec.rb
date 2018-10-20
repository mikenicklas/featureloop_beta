require 'rails_helper'

RSpec.feature "UserCanLeaveComments", type: :feature do
  let(:product) { create(:product) }
  let(:feature_owner) { create(:user, product: product) }
  let(:feature) { create(:feature, user: feature_owner, product: product) }
  let(:commenter) { create(:user, product: product) }

  before do
    feature
    commenter
  end
  
  it "lets user upvote" do
    visit root_url(subdomain: product.subdomain)
    within(".navbar") { click_on "Sign in" }
    fill_in "user[email]", with: commenter.email
    fill_in "user[password]", with: "testing123"
    within(".actions") { click_on "Sign in" }
    expect(page).to have_content "Most Popular"
    within(".card--feature") do
      click_on feature.title
    end
    expect(page).to have_content "Leave a comment"
    fill_in "comment[content]", with: "This is a great idea and something I struggle with, too!"
    click_on "Save comment"
    expect(page).to have_content "Comments (1)"
    expect(page).to have_content "This is a great idea and something I struggle with, too!"
  end
end
