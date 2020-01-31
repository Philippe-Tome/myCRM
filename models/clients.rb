def get_clients
    sql = "select * from clients"
    run_sql(sql)
end

def get_client(id)
  sql = <<~SQL 
  SELECT * 
  FROM clients
  WHERE id = $1;
  SQL
  run_sql(sql, [id])
end

def create_client(name, address)
    sql = <<~SQL
      INSERT INTO clients 
      (company_name, address)
      VALUES
      ($1, $2);
      SQL
    run_sql(sql, [name, address])
end

def update_client(name, address, id)
  sql = <<~SQL
  UPDATE clients  
  SET 
  company_name = $1,
  address = $2
  WHERE id = $3;
  SQL
  run_sql(sql, [name, address, id])
end

def delete_client(client_id)
  sql = <<~SQL
  DELETE FROM clients 
  WHERE id = $1;
  SQL
  run_sql(sql, [client_id])
end

