class EmployerController < ApplicationController
  def create
    employer = Employer.new employer_params

    if employer.save
      # render json: employer
      render json: employer.to_json(only: %i[id])
      return 
    else 
      raise 'email already taken'
    end

  end

  def getid
    employer = Employer.find_by email: params[:email]

    render json: employer.to_json(only: %i[id])

  end

    private
    def employer_params
    params.permit(:first_name,:last_name,:company, :email, :password, :password_confirmation) 
    end
end
