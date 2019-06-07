class BidController < ApplicationController
    # before_action :authenticate_user

  def getbids 
    employer = Employer.find_by id: params[:id]

    offers = employer.bids

    offers_info = []

     offers.each do |o|
      bid_info = {"student" => o.student, "bid" => o}
      offers_info.append(bid_info)
    end

    render json: offers_info 
  end
end
