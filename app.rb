require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/doctor'
require './lib/patient'
require 'pg'

DB = PG.connect({dbname: "doctor_office"})

get '/' do
  erb :index
end

get '/doctor/:id/patients' do
  @doctor = Doctor.find(params[:id])
  erb :patients
end

get '/doctors' do
  @doctors = Doctor.all
  erb :doctors
end

get '/doctor/intake/new' do
  erb :doctor_intake_form
end

post '/doctor/intake/form' do
  name = params[:doctor_name]
  specialty = params[:doc_specialty]
  Doctor.new({name: name, specialty: specialty, id: nil}).save
  erb :doctors
 end

 get '/patient/intake/form' do
   @doctors = Doctor.all
  erb :patient_form
end

post '/patient/intake/form' do
  name = params[:patient_name]
  bday = params[:patient_bday]
  doc_id = params[:doctor_select].to_i
  Patient.new(name: name, birthday: bday, doctor_id: doc_id).save
  erb :patients
end
