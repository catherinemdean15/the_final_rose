require 'rails_helper'

RSpec.describe 'contestant show page' do
  before :each do
    @season1 = Season.create!(description: "This was a season")
    @bachelorette1 = Bachelorette.create!(name: "Ashley", season_number: 1, season_id: @season1.id)
    @contestant1 = Contestant.create!(name: "Jim", age: 28, hometown:"Indianapolis", bachelorette_id: @bachelorette1.id)
    @outing1 = @contestant1.outings.create!(description: "Kickball", location: "Denver", date:'24/12/2015')
    @outing2 = @contestant1.outings.create!(description: "Hot Springs", location: "Glenwood Springs", date:'05/01/2016')
    @outing3 = @contestant1.outings.create!(description: "Helicopter Ride", location: "Aspen", date:'17/12/2015')
  end

  it 'displays contestants name, season number and outings' do
    visit "/contestants/#{@contestant1.id}"

    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant1.season)
    expect(page).to have_content("Outings")
    expect(page).to have_content(@outing1.description)
    expect(page).to have_content(@outing2.description)
    expect(page).to have_content(@outing3.description)
  end

  it 'has a link to the outing show page' do
    visit "/contestants/#{@contestant1.id}"

    expect(page).to have_link(@outing1.description)
    expect(page).to have_link(@outing2.description)
    expect(page).to have_link(@outing3.description)
    click_link "#{@outing1.description}"
    expect(current_path).to eq("/outings/#{@outing1.id}")
  end

end
