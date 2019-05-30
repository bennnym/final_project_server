class StudentsController < ApplicationController

  def new
  end

  def create 
    @student = Student.new student_params

    if @student.save
    end

  end

    private
    def student_params
    params.permit(:first_name,:last_name,:university,:gpa,:reserve_price, :email, :password, :password_confirmation)  # :profile_photo, :cv, :auction_duration,
    end
end
