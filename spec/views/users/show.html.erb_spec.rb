require 'rails_helper'

RSpec.describe "users/show", type: :view do

  describe  'displays show of information' do
    it "can display user show page" do
      assign(:user, User.new(username: "Billy", password: "test"))

      render

      expect(rendered).to match (/Billy/)
    end
  end
end
