class Subscription < ActiveRecord::Base
	belongs_to :premium_plan

	scope :overlaps, ->(start_date, end_date) do
    	where "((start_date <= ?) and (end_date >= ?))", end_date, start_date
  	end
end
