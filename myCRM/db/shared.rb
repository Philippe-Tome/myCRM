require 'pg'

def run_sql(sql, args = [])
    conn = PG.connect(dbname: 'myCRM')
    results = conn.exec_params(sql, args)
    conn.close
    results
  end