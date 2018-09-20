require 'rails_helper'

RSpec.describe Funeral, type: :model do

  describe "Associations" do
    it { should belong_to(:funeral_home) }
    it { should belong_to(:religion) }
    it { should have_one(:user_funeral) }
    it { should have_one(:user) }
    it { accept_nested_attributes_for(:funeral_home) }


  end

end
