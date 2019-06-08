# frozen_string_literal: true

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

  def get_watchlists
    employer = Employer.find_by id: params[:id]

    watchlist = employer.watchlists.reverse_order

    watchlist_data = []

    watchlist.each do |watch|

       if watch.student.bids.size >= 1
          top_price = watch.student.bids[0].amount
       else  
         top_price = 0
       end

      card_data = { 'watchlist' => watch, 'student' => watch.student, "current_price" => top_price, "bid_count" => watch.student.bids.count }
      watchlist_data.append(card_data)
    end

    render json: watchlist_data
  end
end
