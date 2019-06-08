# frozen_string_literal: true

class BidController < ApplicationController
  # before_action :authenticate_user

  def getbids
    employer = Employer.find_by id: params[:id]

    offers = employer.bids.sort_by(&:created_at).reverse # puts bids by most recent first

    offers_info = []

    offers.each do |o|
      bid_info = { 'student' => o.student, 'student_bids' => o.student.bids[0], 'bid' => o, 'bid_count' => o.student.bids.count }
      offers_info.append(bid_info)
    end

    render json: offers_info
  end

  def winningbids
    employer = Employer.find_by id: params[:id] # get the employer

    # need to look at all the employers bids....
    offers = employer.bids.sort_by(&:created_at).reverse # puts bids by most recent

    winning_bids = []

    offers.each do |bid|
      next unless bid.student.bids[0].amount == bid.amount && bid.student.bids[0].employer_id == bid.employer_id && bid.student.auction_duration < Time.now()

      winning_bid_info = { 'bid' => bid, 'student' => bid.student, 'bid_count' => bid.student.bids.count }

      winning_bids.append(winning_bid_info)
    end

    render json: winning_bids
  end
end
