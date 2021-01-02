require 'rails_helper'

RSpec.describe 'bachelorette show page' do
  before :each do
    @season1 = Season.create!(description: "This was a season")
    @season2 = Season.create!(description: "This was another season")
    @bachelorette1 = Bachelorette.create!(name: "Ashley", season_number: 1, season_id: @season1.id)
    @bachelorette2 = Bachelorette.create!(name: "Brittney", season_number: 2, season_id: @season2.id)

  end

  it 'displays bachelorettes name and season number' do
    visit "/bachelorettes/#{@bachelorette1.id}"

    expect(page).to have_content(@bachelorette1.name)
    expect(page).to have_content(@bachelorette1.season_number)
    expect(page).to have_content(@season1.description)

  end

  it 'has a link that takes you to the bachelorettes contestants' do
    contestant1 = Contestant.create!(name: "Jim", age: 28, hometown:"Indianapolis", bachelorette_id: @bachelorette1.id)
    contestant2 = Contestant.create!(name: "Joe", age: 26, hometown:"Scranton", bachelorette_id: @bachelorette1.id)
    contestant3 = Contestant.create!(name: "Job", age: 23, hometown:"Idaho Springs", bachelorette_id: @bachelorette2.id)

    visit "/bachelorettes/#{@bachelorette1.id}"

    expect(page).to have_link("Ashley's Contestants")
    click_link "Ashley's Contestants"
    expect(current_path).to eq("/bachelorettes/#{@bachelorette1.id}/contestants")
    expect(page).to have_content(contestant1.name)
    expect(page).to have_content(contestant2.name)
    expect(page).to have_no_content(contestant3.name)

  end

  it 'displays the average age of the contestants' do
    contestant1 = Contestant.create!(name: "Jim", age: 28, hometown:"Indianapolis", bachelorette_id: @bachelorette1.id)
    contestant2 = Contestant.create!(name: "Joe", age: 26, hometown:"Scranton", bachelorette_id: @bachelorette1.id)
    contestant3 = Contestant.create!(name: "Job", age: 27, hometown:"Idaho Springs", bachelorette_id: @bachelorette1.id)

    visit "/bachelorettes/#{@bachelorette1.id}"

    expect(page).to have_content("Average Age of Contestants: 27.0")

  end

end
