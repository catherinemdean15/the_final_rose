require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'relationships' do
    it {should have_many :bachelorettes}
  end
end
