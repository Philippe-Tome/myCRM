require 'pg'

def run_sql(sql, args = [])
    conn = PG.connect(ENV['DATABASE_URL'] || {dbname: 'myCRM'})
    results = conn.exec_params(sql, args)
    conn.close
    results
  end

  # PG.connect(ENV['DATABASE_URL'] || {dbname: 'GoodFoodHunting', "DB password"})

