require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create(:product, name: "Google", subdomain: "google") }
  let!(:user) { product.users.create(email: "test@example.com", password: "testing123", password_confirmation: "testing123") }
  
  subject { product }

  describe "validations" do
    context "name is nil" do
      before { subject.name = nil }
      it { is_expected.to be_invalid }
    end

    context "subdomain is nil" do
      before { subject.subdomain = nil }
      it { is_expected.to be_invalid }
    end

    context "subdomain isn't unique" do
      subject { build(:product, name: "Bing", subdomain: "google") }
      it { is_expected.to be_invalid }
    end
  end
end
