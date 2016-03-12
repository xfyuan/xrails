require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create :user }

  it { should be_valid }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:authentication_token) }

  it { should validate_length_of(:email).is_at_least(6).is_at_most(50) }
  it { should validate_length_of(:password).is_at_least(4).is_at_most(30) }
  it { should validate_length_of(:firstname).is_at_least(2).is_at_most(30) }
  it { should validate_length_of(:lastname).is_at_least(2).is_at_most(30) }
end
