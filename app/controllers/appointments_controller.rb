class AppointmentsController < ApplicationController

  def index
  	@appointments = Appointment.all
  end

  def show
	@patient = current_patient
  @appointment = Appointment.find_by(id: params["id"])
  end

  def new
    @appointment = Appointment.new
  end

  def create
	  appointment = Appointment.new(params["appointment"])
  	appointment.patient = current_patient
    appointment.save
    redirect_to patient_url(current_patient), notice: "Appointment created"
  end

  def edit
    @appointment = Appointment.find_by(id: params["id"])
  end

  def update
  	appointment = Appointment.find_by(id: params["id"])
  	appointment.update(params["appointment"])
  redirect_to patient_url(current_patient), notice: "Appointment updated"
  end

 def destroy
 	appointment = Appointment.find_by(id: params["id"])
 	appointment.destroy
 	redirect_to patient_url(current_patient), alert: "Appointment cancelled"
 end

end
