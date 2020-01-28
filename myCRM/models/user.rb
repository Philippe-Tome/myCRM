# read
def all_users
    sql = "SELECT * FROM users;"
    # implicit return
    run_sql(sql)
  end
  
  def find_one_user_by_email(email)
    sql = "SELECT * FROM dishes WHERE email = $1;"
    run_sql(sql, [email])[0]
  end
  
  # create
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