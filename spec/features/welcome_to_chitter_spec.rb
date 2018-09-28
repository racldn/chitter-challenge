feature 'Welcome Page' do
  scenario 'visiting welcome page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end
