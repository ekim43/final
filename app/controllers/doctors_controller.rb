class DoctorsController < ApplicationController

skip_before_action :auth, only: [:index, :show]

  def index
  	@doctors = Doctor.all
  end

  def show
	@doctor = Doctor.find_by(id: params["id"])
  end

  def new
    @doctor = Doctor.new
  end

  def create
	Doctor.create(params["doctor"])
  	redirect_to doctors_url
  end

  def edit
  	@doctor = Doctor.find_by(id: params["id"])
  end

  def update
  	doctor = Doctor.find_by(id: params["id"])
  	doctor.update(params["doctor"])
  	redirect_to doctors_url
  end

 def destroy
 	doctor = Doctor.find_by(id: params["id"])
 	doctor.delete
 	redirect_to doctors_url
 end

end
