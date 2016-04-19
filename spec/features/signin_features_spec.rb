# spec/features/visitor_signs_up_spec.rb
require 'rails_helper'

feature 'Guest signs up' do
  before(:all) do
    Capybara.current_driver = :selenium
  end

  scenario 'with valid email and password', js: true do
    sign_up_with 'valid name', 'valid@example.com', 'password', 'password'

    expect(page).to have_content('Log out')
  end

  scenario 'with invalid email', js: true do
    sign_up_with '', 'valid@example.com', 'password', 'password'

    expect(page).to have_content('Sign in')
  end

  scenario 'with blank password', js: true do
    sign_up_with 'valid name', 'valid@example.com', '', ''

    expect(page).to have_content('Sign in')
  end

  def sign_up_with(name, email, password, password_confirmation)
    visit new_user_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password Confirmation', with: password_confirmation
    click_button 'Create my account'
  end
end
