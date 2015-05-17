class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 helper_method :current_patient
 before_action :auth

  def auth
  	if current_patient
  	else 
  	redirect_to new_session_path
  	end
  end

  def current_patient
	Patient.find_by(id: session["patient_id"])
  end

end
