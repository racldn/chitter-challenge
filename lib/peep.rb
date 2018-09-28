require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end


    result = connection.exec("SELECT entry FROM peeps ORDER BY id DESC;")
    result.map { |peep| peep['entry'] }

    # results = connection.exec("SELECT entry, timestamp FROM peeps ORDER BY id DESC;")
    # results.map {|peeps| [peeps['entry'], peeps['timestamp']]}

  end
end
