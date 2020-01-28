require 'pry'
require_relative 'db/shared'
require_relative 'models/user'


create_user("admin", "admin@admin.com", "admin", "IT")

binding.pry