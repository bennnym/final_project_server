class EmployerController < ApplicationController
  def create
    employer = Employer.new employer_params

    if employer.save
      return 
    else 
      raise 'email already taken'
    end

  end

    private
    def employer_params
    params.permit(:first_name,:last_name,:company, :email, :password, :password_confirmation) 
    end
end
