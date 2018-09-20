require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) {User.find_by(username: "Oren")}

  describe  'Get show' do
    it "Can display user show page" do
      get(:show)
      expect(assigns['user']).to eq(user)
    end
  end

    describe  'Get new' do
      before(:example) {get :new}

      it "is a success" do
        expect(response).to have_http_status(:ok)
      end

      it "renders 'new' template" do
        expect(response).to render_template('new')
        # expect(response).to redirect_to(user_path(@user))
      end
    end

    # describe  'Get summary' do
    #   before(:example) {get :summary}
    #
    #   it "is a success" do
    #     expect(response).to have_http_status(:ok)
    #   end
    #
    #   it "renders 'summary' template" do
    #     expect(response).to render_template('summary')
    #     # expect(response).to redirect_to(user_path(@user))
    #   end
    # end



end



# get(action, options)
# post(action, options)
# patch(action, options)
# put(action, options)
# delete(action, options)
