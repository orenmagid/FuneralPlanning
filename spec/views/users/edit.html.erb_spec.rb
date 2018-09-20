require 'rails_helper'

RSpec.describe "users/edit", type: :view do

  describe  'displays edit form' do
    it "can display edit form" do
      assign(:user, User.new(username: "Billy", password: "test"))

      render

      expect(rendered).to match (/Billy/)
    end
  end

end
