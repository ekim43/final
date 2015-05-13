class PatientsController < ApplicationController

  def index
  	@patients = Patient.all
  end

  def show
	@patient = Patient.find_by(id: params["id"])
  end

  def new
    @patient = Patient.new
  end

  def create
	Patient.create(params["patient"])
  	redirect_to patients_url
  end

  def edit
  	@patient = Patient.find_by(id: params["id"])
  end

  def update
  	patient = Patient.find_by(id: params["id"])
  	patient.update(params["patient"])
  	redirect_to patients_url
  end

 def destroy
 	patient = Patient.find_by(id: params["id"])
 	patient.delete
 	redirect_to patients_url
 end

end
