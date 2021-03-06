require 'rails_helper'

RSpec.describe 'Manufacturers Index Page' do
  before :each do
      @innova = Manufacturer.create!(name: 'Innova', founded_in: 1983, in_business: true)
      @teebird = @innova.discs.create!(name: 'Teebird', max_weight: 175, in_production: true)
      @wraith = @innova.discs.create!(name: 'Wraith', max_weight: 175, in_production: true)
  end

  describe 'as a visitor' do
    it 'shows the name and attributes of each disc' do
      visit '/discs'

      expect(page).to have_content(@teebird.name)
      expect(page).to have_content(@teebird.id)
      expect(page).to have_content(@teebird.max_weight)
      expect(page).to have_content(@teebird.in_production)
      expect(page).to have_content(@teebird.created_at)
      expect(page).to have_content(@teebird.updated_at)

      expect(page).to have_content(@wraith.name)
      expect(page).to have_content(@wraith.id)
      expect(page).to have_content(@wraith.max_weight)
      expect(page).to have_content(@wraith.in_production)
      expect(page).to have_content(@wraith.created_at)
      expect(page).to have_content(@wraith.updated_at)
    end

    it 'can navigate home' do
      visit "/discs"

      expect(page).to have_link('Home')
      click_link('Home')
      expect(current_path).to eq('/')
    end
  end
end
