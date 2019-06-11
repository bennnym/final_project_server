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

  def getinfo
    employer = Employer.find_by id: params[:id]

    render json: employer
  end

  def update 
    employer = Employer.find_by id: params[:id]
    employer.password = params[:password] if params[:password]
    employer.password_confirmation = params[:password_confirmation] if params[:password_confirmation]
    if employer.save 
      render json: employer
    else
      raise 'error'
    end
  end

    private
    def employer_params
    params.permit(:first_name,:last_name,:company, :email, :password, :password_confirmation) 
    end
end
