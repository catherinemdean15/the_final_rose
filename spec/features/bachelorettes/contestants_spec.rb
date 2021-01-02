require 'rails_helper'

RSpec.describe 'bachelorette contestants index page' do
  before :each do
    @season1 = Season.create!(description: "This was a season")
    @season2 = Season.create!(description: "This was another season")
    @bachelorette1 = Bachelorette.create!(name: "Ashley", season_number: 1, season_id: @season1.id)
    @bachelorette2 = Bachelorette.create!(name: "Brittney", season_number: 2, season_id: @season2.id)
    @contestant1 = Contestant.create!(name: "Jim", age: 28, hometown:"Indianapolis", bachelorette_id: @bachelorette1.id)
    @contestant2 = Contestant.create!(name: "Joe", age: 26, hometown:"Scranton", bachelorette_id: @bachelorette1.id)
    @contestant3 = Contestant.create!(name: "Job", age: 23, hometown:"Idaho Springs", bachelorette_id: @bachelorette2.id)


  end

  it 'displays bachelorettes contestants namem town, and age' do
    visit "/bachelorettes/#{@bachelorette1.id}/contestants"

    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant1.age)
    expect(page).to have_content(@contestant1.hometown)

    expect(page).to have_content(@contestant2.name)
    expect(page).to have_content(@contestant2.age)
    expect(page).to have_content(@contestant2.hometown)
  end

  it 'has a link to that contestant show page' do
    visit "/bachelorettes/#{@bachelorette1.id}/contestants"

    expect(page).to have_link("#{@contestant1.name}")
    click_link "#{@contestant1.name}"
    expect(current_path).to eq("/contestants/#{@contestant1.id}")

  end

  it 'displays a unique list of hometowns' do
    contestant4 = Contestant.create!(name: "Jeffrey", age: 28, hometown:"Indianapolis", bachelorette_id: @bachelorette1.id)
    visit "/bachelorettes/#{@bachelorette1.id}/contestants"

    expect(page).to have_content("These contestants are from these hometowns: Indianapolis, Scranton")

  end


end
