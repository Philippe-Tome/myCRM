def get_clients
    sql = "select * from clients"
    run_sql(sql)
end

def create_client(name, address)
    sql = <<~SQL
      INSERT INTO clients 
      (name, address)
      VALUES
      ($1, $2);
      SQL
    run_sql(sql, [name, address])
end