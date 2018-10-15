require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:user) { User.create(email: "test@example.com", password: "testing123", password_confirmation: "testing123")}
  let!(:product) { user.products.create(name: "Google", subdomain: "google") }
  subject { product }

  describe "validations" do
    context "name is nil" do
      before { subject.name = nil }
      it { is_expected.to be_invalid }
    end

    context "subdomain is nil" do
      before { subject.update(subdomain: nil) }
      it { is_expected.to be_invalid }
    end

    context "subdomain isn't unique" do
      subject { user.products.create(name: "Bing", subdomain: "google") }
      it { is_expected.to be_invalid }
    end
  end
end
