require 'rails_helper'

feature 'user creates play statistics', %Q{
  As a user
  I want to upload a file
  So i can get all the roles statistics from it
} do
  before(:each) do
    visit plays_path
    attach_file "File", File.join(Rails.root, "spec/support/files/example.xml")
    click_button 'Upload'
  end

  scenario 'creates roles' do
    visit plays_path

    click_on "The Tragedy of Julius Caesar"

    expect(page).to have_content("JULIUS CAESAR")
    expect(page).to have_content("CASCA")
    expect(Role.count).to eq(2)
  end

  scenario 'creates scenes' do
    visit plays_path

    click_on "The Tragedy of Julius Caesar"
    expect(Scene.count).to eq(2)
  end

  scenario 'creates lines' do
    visit plays_path

    click_on "The Tragedy of Julius Caesar"
    expect(Line.count).to eq(5)
  end

end
