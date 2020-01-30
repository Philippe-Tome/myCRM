# models for each db tables

require 'sinatra'
require_relative 'db/shared'
require_relative 'models/users.rb'
require_relative 'models/clients.rb'
require_relative 'models/service_reports.rb'
require_relative 'controllers/clients_controller'

if development?
require 'sinatra/reloader'
require 'pry'
also_reload 'db/shared'
end


enable :sessions 


def logged_in?
  if session[:user_id]
    return true
  else 
    return false
  end
end

def current_user
  run_sql("SELECT * FROM users WHERE id = #{session[:user_id] };")[0]
end

get '/' do
  erb :index
end


post '/' do
  results = get_user(params[:email])
  @reports = get_reports()

  if results.count == 1 && BCrypt::Password.new(results[0]['password_digest']) == params[:password]
    session[:user_id] = results[0]['id']

    if results[0]["role"] == "IT"
      redirect '/IT/index'
    elsif results[0]["role"] == "Manager"
      redirect '/Manager/index'
    else
      redirect '/Engineer/index'
    end
  else
    redirect '/'
  end
end

get '/IT/index' do
  @reports = get_reports()
  @users = get_all_users()
  @clients = get_clients()
  erb :"/IT/index"
end

get '/Manager/index' do
  @clients = get_clients()
  @reports = get_reports()
  erb :"/Manager/index"
end

get '/Engineer/index' do
  @reports = get_reports()
  erb :"/Engineer/index"
end

get '/Engineer/new/records' do
  redirect '/' unless logged_in?
  erb :"/Engineer/new"
end

get '/new/records' do
  redirect '/' unless logged_in?
  erb :"/new_records"
end

post '/Engineer/new/records' do
  create_eng_report(params[:date], current_user['id'], params[:client_id], params[:report])
  
  redirect '/Engineer/index'
end

post '/new/records' do
  create_report(params[:date], params[:user_id], params[:client_id], params[:report])

  redirect '/IT/index'
end

delete '/session' do 
  session[:user_id] = nil
  redirect '/'
end

delete '/records' do
  delete_report(params[:report_id])
  user = current_user()
  if user["role"] == "IT"
    redirect '/IT/index'
  elsif user["role"] == "Manager"
    redirect '/Manager/index'
  else 
    redirect '/Engineer/index'
  end
end

get '/records/:id/edit' do
  @user = current_user()
  @clients = get_clients()
  @result = get_report(params[:id])[0]
  erb :edit_records
end

patch '/records/edit:id' do
  update_report(params[:date], params[:user_id].to_i, params[:client_id].to_i, params[:report], params[:id])
  @user = current_user()
  if @user["role"] == "IT"
    redirect '/IT/index'
  elsif @user["role"] == "Manager"
    redirect '/Manager/index'
  else 
    redirect '/Engineer/index'
  end
end


