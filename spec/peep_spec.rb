require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'peep_manager_test')

      connection.exec("INSERT INTO peeps (entry) VALUES ('This is a test peep');")
      connection.exec("INSERT INTO peeps (entry) VALUES('This is another test peep');")
      connection.exec("INSERT INTO peeps (entry) VALUES('This is a third test peep');")


      peeps = Peep.all

      expect(peeps).to include("This is a test peep")
      expect(peeps).to include("This is another test peep")
      expect(peeps).to include("This is a third test peep")
    end
  end
end
