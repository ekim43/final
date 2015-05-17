class SessionsController < ApplicationController
skip_before_action :auth
layout false

  def create
        @patient = Patient.find_by(email: params["email"])
      if @patient.present?
        #yes, user exists
        if @patient.authenticate(params["password"])
        session["patient_id"] = @patient.id
        redirect_to root_url
        else
          redirect_to new_session_url, alert: "Wrong password"
        end
      else
        #no user with that email
        redirect_to new_session_url, alert: "Wrong email"
      end

    # params["email"] => the email address
    # params["password"] => the password
    # Do authentication
    # Redirect to the root_path
    # Display a notice that login was either successful or unsuccessful
  end

  def destroy
    # Do sign-out
    session["patient_id"] = new_session_url
    redirect_to root_url, notice: "See ya later"
  end

end