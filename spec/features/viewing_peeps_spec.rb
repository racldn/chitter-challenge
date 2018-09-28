feature 'viewing peeps' do
  scenario 'A user can view all peeps made' do
    connection = PG.connect(dbname: 'peep_manager_test')

    # Add the test data
    connection.exec("INSERT INTO peeps VALUES(1, 'This is a test peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'This is another test peep');")
    connection.exec("INSERT INTO peeps VALUES(3, 'This is a third test peep');")

    visit('/peeps')
    expect(page).to have_content "This is a test peep"
    expect(page).to have_content "This is another test peep"
    expect(page).to have_content "This is a third test peep"
  end
end
