require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
set :database, { adapter: "sqlite3", database: "mydb.db" }
require 'active_record'
require './models/student.rb'
require './models/college_class.rb'
require './models/student_class.rb'

get '/' do
    @students = Student.all
    erb :welcome 
end

get '/name' do 
    erb :name
end

get '/class' do
    erb :class
end 

post '/class_results' do
  cc = CollegeClass.find_by(name: params[:name])
  if !cc.nil?
  puts "Student #{params[:name]} was found"
  @CollegeClass = CollegeClass.all
  erb :class_list
  else
  "Student #{params[:name]} not found"
  end 
end

post '/name_results' do
  student = Student.find_by(name: params[:name])
  if !student.nil?
  puts "Student #{params[:name]} was found"
  @students = Student.all
  erb :student_list
  else
  "Student #{params[:name]} not found"
  end 
end