class StudentsController < ApplicationController

  def new
  end

  def create 
    @student = Student.new student_params

    puts params[:profile_photo]

    if params[:profile_photo].present? 
      # Then call Cloudinary's upload method, passing in the file in params
      req = Cloudinary::Uploader.upload(params[:profile_photo])
      # Using the public_id allows us to use Cloudinary's powerful image 
      # transformation methods.
      @student.profile_photo = req["secure_url"]
    else 
      raise 'no profile photo entered'
    end

    if params[:cv].present? 
      # Then call Cloudinary's upload method, passing in the file in params
      req = Cloudinary::Uploader.upload(params[:cv])
      # Using the public_id allows us to use Cloudinary's powerful image 
      # transformation methods.
      @student.cv = req["secure_url"]
    else 
      raise 'no CV uploaded'
    end

    if @student.save
        render :json => @student
    else 
      raise 'email already taken'
    end
      
  end

    private
    def student_params
    params.permit(:first_name,:last_name,:university,:gpa,:reserve_price, :email, :password, :password_confirmation, :auction_duration)  # :profile_photo, :cv, 
    end
end
