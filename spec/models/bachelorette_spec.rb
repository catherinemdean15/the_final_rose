require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe 'methods' do

    it 'average_age_of_contestants' do
      @season1 = Season.create!(description: "This was a season")
      @bachelorette1 = Bachelorette.create!(name: "Ashley", season_number: 1, season_id: @season1.id)

      contestant1 = Contestant.create!(name: "Jim", age: 28, hometown:"Indianapolis", bachelorette_id: @bachelorette1.id)
      contestant2 = Contestant.create!(name: "Joe", age: 26, hometown:"Scranton", bachelorette_id: @bachelorette1.id)
      contestant3 = Contestant.create!(name: "Job", age: 27, hometown:"Idaho Springs", bachelorette_id: @bachelorette1.id)

      expect(@bachelorette1.average_age_of_contestants).to eq(27.0)
    end

    it 'hometowns' do
      @season1 = Season.create!(description: "This was a season")
      @bachelorette1 = Bachelorette.create!(name: "Ashley", season_number: 1, season_id: @season1.id)

      contestant1 = Contestant.create!(name: "Jim", age: 28, hometown:"Indianapolis", bachelorette_id: @bachelorette1.id)
      contestant2 = Contestant.create!(name: "Joe", age: 26, hometown:"Scranton", bachelorette_id: @bachelorette1.id)
      contestant3 = Contestant.create!(name: "Job", age: 27, hometown:"Indianapolis", bachelorette_id: @bachelorette1.id)

      expect(@bachelorette1.hometowns).to eq(["Indianapolis", "Scranton"])
    end

  end


end
