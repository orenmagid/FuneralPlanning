require 'rails_helper'

RSpec.describe "contacts/index", type: :view do

  describe  'contacts index page' do
    it "can display index page" do
      assign(:user, User.new(username: "Billy"))

      render

      expect(rendered).to match (/Billy/)
    end
  end

end
