require 'rails_helper'

RSpec.describe Religion, type: :model do
  describe "Associations" do
    it { should have_many(:funerals) }
  end
end
