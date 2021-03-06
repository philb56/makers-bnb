feature 'User log in' do

  let!(:user) do
    User.create(name: 'Ed',
                username: 'Ed',
                password: 'Banana',
                email_address: 'test123@mail.com')
  end

  scenario 'with correct credentials' do
    log_in
    expect(page).to have_content "Hello Ed! Welcome to DwellBnB"
  end
  scenario 'with incorrect credentials' do
    log_in(password: 'Courgette')
    expect(page).to have_content "The email or password is incorrect"
  end
end


feature 'User signs out' do

  let!(:user) do
    User.create(name: 'Ed',
                username: 'Ed',
                password: 'Banana',
                email_address: 'test123@mail.com')
  end

  scenario 'while being signed in' do
    log_in(username: 'Ed', password: 'Banana')
    click_link 'Sign out'
    click_button 'Sign out'
    expect(page).to have_content('Thanks for stopping by !')
    expect(page).not_to have_content('Hello Ed')
  end
end
