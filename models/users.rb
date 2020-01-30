def get_user(email)
  sql = "SELECT * FROM users WHERE email = $1"
  run_sql(sql, [email])
end

def get_all_users
  sql = "SELECT * FROM users"
  run_sql(sql)
end

def get_user_name(user_id)
  sql = "SELECT name FROM users where id = $1"
  run_sql(sql, [user_id])
end
  
require 'bcrypt'
def create_user(name, email, password, role)
  password_digest = BCrypt::Password.create(password)
  sql = <<~SQL
    INSERT INTO users 
    (name, email, password_digest, role)
    VALUES
    ($1, $2, $3, $4);
    SQL
  run_sql(sql, [name, email, password_digest, role])
end




