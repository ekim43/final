class PatientsController < ApplicationController

skip_before_action :auth, only: [:index, :show, :new, :create]

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
	  @patient = Patient.create(params["patient"])
  	if @patient.valid?
    redirect_to patients_url, notice: "User created"
    else
    render "new"
    end
  end

  def edit
  	@patient = Patient.find_by(id: params["id"])
  end

  def update
  	@patient = Patient.find_by(id: params["id"])
  	@patient.update(params["patient"])
  	redirect_to patients_url
  end

  def destroy
  	@patient = Patient.find_by(id: params["id"])
   	@patient.destroy
   	redirect_to patients_url
  end

end
