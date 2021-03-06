# frozen_string_literal: true

class StudentsController < ApplicationController
  def quickbid
    if params[:student_id] && params[:employer_email] && params[:bid_amount]
      @bid = Bid.new
      employer = Employer.find_by email: params[:employer_email]
      student = Student.find_by id: params[:student_id]
      @bid.employer_id = employer.id
      @bid.company = employer.company
      @bid.student_id = params[:student_id]
      @bid.amount = params[:bid_amount]

      raise 'employer not found' if @bid.employer_id.nil?

      if @bid.save
        return render json: student.to_json(only: %i[id first_name last_name university gpa reserve_price auction_duration profile_photo cv email], include: :bids)
      else
        raise "error, bid didn't save"
      end
    end
    raise 'error, params not sent'
  end

  def all
    students = Student.all.order(:auction_duration)

    students = students.select do |s|
      s.auction_duration - Time.now.utc > 0 if s.auction_duration
    end

    render json: students.to_json(only: %i[id first_name last_name university gpa reserve_price auction_duration profile_photo cv email], include: :bids)
  end

  def ending
    students = Student.order(:auction_duration)

    students = students.select do |s|
      s.auction_duration - Time.now.utc > 0 if s.auction_duration
    end

    students = students.take(10)

    render json: students.to_json(only: %i[id first_name last_name university gpa reserve_price auction_duration profile_photo cv email], include: :bids)
  end

  def create
    @student = Student.new student_params

    puts params[:profile_photo]

    if params[:profile_photo].present?
      # Then call Cloudinary's upload method, passing in the file in params
      req = Cloudinary::Uploader.upload(params[:profile_photo])
      # Using the public_id allows us to use Cloudinary's powerful image
      # transformation methods.
      @student.profile_photo = req['secure_url']
    else
      raise 'no profile photo entered'
    end

    if params[:cv].present?
      # Then call Cloudinary's upload method, passing in the file in params
      req = Cloudinary::Uploader.upload(params[:cv])
      # Using the public_id allows us to use Cloudinary's powerful image
      # transformation methods.
      @student.cv = req['secure_url']
    else
      raise 'no CV uploaded'
    end

    if @student.save
      render json: @student
    else
      raise 'email already taken'
    end
  end

  def profile
    student = Student.find_by id: params[:id]
    render json: student.to_json(only: %i[id first_name last_name university gpa reserve_price auction_duration profile_photo cv email password_digest], include: %i[bids watchlists])
  end

  def studentid
    student = Student.find_by email: params[:email]

    render json: student.to_json(only: %i[id])
 end

  def update
    student = Student.find_by id: params[:id]

    student.email = params[:email] if params[:email]
    student.gpa = params[:gpa] if params[:gpa]
    student.reserve_price = params[:reserve_price] if params[:reserve_price]
    student.university = params[:university] if params[:university]

    student.password = params[:password] if params[:password]
    student.password_confirmation = params[:password_confirmation] if params[:password_confirmation]
     if student.save
       render json: student
     else
      raise 'error'
     end
  end

  private

  def student_params
    params.permit(:first_name, :last_name, :university, :gpa, :reserve_price, :email, :password, :password_confirmation, :auction_duration) # :profile_photo, :cv,
  end
end

#  id: localStorage.studentID,
#       email,
#       gpa,
#       reserve_price: reservePrice,
#       university,
#       password,
#       password_confirmation: passwordConfirm
