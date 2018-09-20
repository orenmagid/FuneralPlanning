require 'rails_helper'

RSpec.describe "static_pages/home", type: :view do

  describe  'static_pages home page' do
    it "can display home page" do
      assign(:user, User.new(username: "Billy"))

      render

      expect(rendered).to match (/Login/)
    end
  end

end
