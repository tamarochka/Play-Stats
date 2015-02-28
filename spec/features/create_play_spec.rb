require 'rails_helper'

feature 'user creates play', %Q{
  As a user
  I want to upload play
  So i can save it and view it
} do
  scenario 'valid data' do

    visit plays_path

    attach_file "File", File.join(Rails.root, "spec/support/files/example.xml")

    click_button 'Upload'

    expect(page).to have_content("Play Uploaded")
    expect(Play.count).to eq(1)
  end

  scenario 'specify invalid credentials' do
    visit plays_path

    click_button 'Upload'

    expect(page).to have_content('Please attach file')
    expect(Play.count).to eq(0)
  end
end
