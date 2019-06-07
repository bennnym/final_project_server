class WatchlistController < ApplicationController
  def toggle
    student = Student.find_by id: params[:id]
    employer = Employer.find_by email: params[:employer_email]

    watchlist = Watchlist.find_by employer_id: employer.id, student_id: student.id
    
    if watchlist.nil?
      w = Watchlist.new
      w.employer_id = employer.id
      w.student_id = student.id  
      w.student_name = "#{student.first_name} #{student.last_name}"
      w.employer_email = params[:employer_email]
      w.save

    else
      watchlist.delete
    end


end
end
