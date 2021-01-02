require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'relationships' do
    it {should have_many :outing_contestants}
    it {should have_many(:contestants), through: :outing_contestants}
  end

  describe 'methods' do
    it 'counts the contestants' do

      @season1 = Season.create!(description: "This was a season")
      @bachelorette1 = Bachelorette.create!(name: "Ashley", season_number: 1, season_id: @season1.id)
      @contestant1 = Contestant.create!(name: "Jim", age: 28, hometown:"Indianapolis", bachelorette_id: @bachelorette1.id)
      @contestant2 = Contestant.create!(name: "Joe", age: 26, hometown:"Scranton", bachelorette_id: @bachelorette1.id)
      @contestant3 = Contestant.create!(name: "Job", age: 23, hometown:"Idaho Springs", bachelorette_id: @bachelorette1.id)
      @outing1 = @contestant1.outings.create!(description: "Kickball", location: "Denver", date:'24/12/2015')
      OutingContestant.create!(outing_id: @outing1.id, contestant_id: @contestant2.id)
      OutingContestant.create!(outing_id: @outing1.id, contestant_id: @contestant3.id)

      expect(@outing1.number_of_contestants).to eq(3)
    end

  end
end
