require 'rails_helper'

RSpec.describe User, type: :model do
  subject!(:user) { User.create!(username: "HALLO", password: "goodbye") }

  describe "Validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "::find_by_credentials" do

    it "returns user based on username and password" do
      # bob = User.create!(username: "bob", password: "thebuilder")
      # expect(User.find_by_credentials("bob","thebuilder")).to eq(bob)
      expect(User.find_by_credentials("HALLO","goodbye")).to eq(user)
    end
  end

end
