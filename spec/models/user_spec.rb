require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(email: "test@example.com", password: "testing123", password_confirmation: "testing123") }

  it { is_expected.to be_valid }
end
