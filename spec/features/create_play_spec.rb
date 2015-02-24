require 'rails_helper'

feature 'user creates play', %Q{
  As a user
  I want to upload play
  So i can save it and view it
} do
  scenario 'valid data' do

    visit plays_path

    attach_file "Example", File.join(Rails.root, "spec/support/files/example.xml")

    click_button 'Upload'

    expect(page).to have_content('Uploaded')
    expect(Play.count).to eq(1)
  end

  # scenario 'specify invalid credentials' do
  #   visit new_user_session_path
  #
  #   click_button 'Log in'
  #   expect(page).to have_content('Invalid email or password')
  #   expect(page).to_not have_content('Sign Out')
  # end
end
