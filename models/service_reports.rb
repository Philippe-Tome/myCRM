
def get_reports
    sql = <<~SQL
    SELECT 
      service_reports.id, 
      service_reports.date,
      service_reports.report, 
      service_reports.user_id,
      clients.company_name, 
      users.name 
    FROM service_reports 
    INNER JOIN clients ON clients.id = service_reports.client_id 
    INNER JOIN users ON users.id = service_reports.user_id;
    SQL
    run_sql(sql)
end

def get_report(id)
  sql = <<~SQL
  SELECT
    service_reports.id, 
    service_reports.date,
    service_reports.report, 
    service_reports.user_id,
    service_reports.client_id 
  FROM service_reports 
  INNER JOIN clients ON clients.id = service_reports.client_id
  INNER JOIN users ON users.id = service_reports.user_id 
  WHERE service_reports.id = $1;
  SQL
  run_sql(sql, [id])
end  


def create_eng_report(date, user_id, client_id, report)
    sql = <<~SQL
      INSERT INTO service_reports 
      (date, user_id, client_id, report)
      VALUES
      ($1, $2, $3, $4);
      SQL
    run_sql(sql, [date, user_id, client_id, report])
end

def create_report(date, user_id, client_id, report)
  sql = <<~SQL
    INSERT INTO service_reports 
    (date, user_id, client_id, report)
    VALUES
    ($1, $2, $3, $4);
    SQL
  run_sql(sql, [date, user_id, client_id, report])
end

def delete_report(id)
  sql = <<~SQL
    DELETE FROM service_reports 
    WHERE id = $1;
    SQL
  run_sql(sql, [id])
end

def update_report(date, user_id, client_id, report, id)
  sql = <<~SQL
  UPDATE service_reports 
  SET 
  date = $1,
  user_id = $2,
  client_id = $3,
  report = $4
  WHERE id = $5;
  SQL
  run_sql(sql, [date, user_id, client_id, report, id])
end  


