require 'rails_helper'

RSpec.describe User, type: :model do

    it "has zero users at the start" do
      expect(User.count).to eq(0)
    end

    it "has one user after creating one" do
      User.create(username: "Mitch")
      expect(User.count).to eq(0)
    end

    it "has zero users after transaction" do
      expect(User.count).to eq(0)
    end

  describe "Validations" do

    it { should validate_presence_of(:username) }

    it { should validate_uniqueness_of(:username) }

    it "is not with no attributes" do
      expect(User.new).to be_invalid
    end

    it "is valid all valid attributes" do
      user = User.new(username: "Jil", email: "jil@jil.com", password: "test")
      expect(user).to be_valid
    end

    it "is not valid without a password" do
      user = User.new(username: "Jil", email: "jil@jil.com")
      user.password = nil
      expect(user).to_not be_valid
    end

    it "is not valid without an email" do
      user = User.new(username: "Jil", password: "jucifer")
      user.email = nil
      expect(user).to_not be_valid
    end
  end

  describe "Associations" do
    it { should have_many(:contacts) }
    it { should have_one(:funeral) }
    it { should have_one(:user_funeral) }
  end

end
