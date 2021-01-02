require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it {should belong_to :bachelorette}
    it {should have_many :outing_contestants}
    it {should have_many(:outings), through: :outing_contestants}
  end

  describe 'methods' do
    it 'finds the contestants season' do
      @season1 = Season.create!(description: "This was a season")
      @bachelorette1 = Bachelorette.create!(name: "Ashley", season_number: 1, season_id: @season1.id)
      @contestant1 = Contestant.create!(name: "Jim", age: 28, hometown:"Indianapolis", bachelorette_id: @bachelorette1.id)

      expect(@contestant1.season).to eq(1)
    end

    it 'finds the contestants season description' do
      @season1 = Season.create!(description: "This was a season")
      @bachelorette1 = Bachelorette.create!(name: "Ashley", season_number: 1, season_id: @season1.id)
      @contestant1 = Contestant.create!(name: "Jim", age: 28, hometown:"Indianapolis", bachelorette_id: @bachelorette1.id)

      expect(@contestant1.season_description).to eq("This was a season")
    end
  end
end
