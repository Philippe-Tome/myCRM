require 'bcrypt'

def get_user(email)
  sql = "SELECT * FROM users WHERE email = $1"
  run_sql(sql, [email])
end

def get_user_by_ID(id)
  sql = <<~SQL
  SELECT * 
  FROM users 
  WHERE id = $1
  SQL
  run_sql(sql, [id])
end

def get_all_users
  sql = "SELECT * FROM users"
  run_sql(sql)
end

def get_user_name(user_id)
  sql = "SELECT name FROM users where id = $1"
  run_sql(sql, [user_id])
end
  
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

def update_user(name, email, password_digest, role, id)
  password_digest = BCrypt::Password.create(password_digest)
  sql = <<~SQL
  UPDATE users  
  SET 
  name = $1,
  email = $2,
  password_digest = $3,
  role = $4
  WHERE id = $5;
  SQL
  run_sql(sql, [name, email, password_digest, role, id])
end

def delete_user(user_id)
  sql = <<~SQL
  DELETE FROM users 
  WHERE id = $1;
  SQL
  run_sql(sql, [user_id])
end


