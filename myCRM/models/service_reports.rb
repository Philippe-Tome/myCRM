
def get_reports
    sql = <<~SQL
    SELECT service_reports.date, 
    service_reports.report, 
    clients.company_name, 
    users.name 
    FROM service_reports 
    INNER JOIN clients ON clients.id = service_reports.client_id 
    INNER JOIN users ON users.id = service_reports.user_id;
    SQL
    run_sql(sql)
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

