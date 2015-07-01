

[
	{"id": 1, "title": "Apple", "price_per_month": 5.99, "active": true},
	{"id": 2, "title": "Stripe", "price_per_month": 4.20, "active": true}

].each do |plan|
	PremiumPlan.create(plan_type: plan[:title], price_per_month: plan[:price_per_month])
end

[
	{"id": 1, "email": "user1@rever.co"},
	{"id": 2, "email": "user2@rever.co"},
	{"id": 3, "email": "user3@rever.co"},
	{"id": 4, "email": "user4@rever.co"},
	{"id": 5, "email": "user5@rever.co"},
	{"id": 6, "email": "user6@rever.co"},
	{"id": 7, "email": "user7@rever.co"},
	{"id": 8, "email": "user8@rever.co"},
	{"id": 9, "email": "user9@rever.co"},
	{"id": 10, "email": "user10@rever.co"}

].each do |user|
	User.create!(email: user[:email], password: "asdasdasd", password_confirmation: "asdasdasd")
end

[
	{"premium_plan_id": 1, "start_date": "2015-05-16", "end_date": "2015-07-16", "user_id": 1},
	{"premium_plan_id": 2, "start_date": "2015-02-10", "end_date": "2015-04-10", "user_id": 2},
	{"premium_plan_id": 2, "start_date": "2014-01-10", "end_date": "2014-10-10", "user_id": 3},
	{"premium_plan_id": 2, "start_date": "2015-05-10", "end_date": "2015-09-10", "user_id": 4},
	{"premium_plan_id": 2, "start_date": "2015-03-02", "end_date": "2015-04-02", "user_id": 5},
	{"premium_plan_id": 1, "start_date": "2015-02-01", "end_date": "2015-04-01", "user_id": 6},
	{"premium_plan_id": 1, "start_date": "2015-06-10", "end_date": "2015-07-10", "user_id": 7},
	{"premium_plan_id": 1, "start_date": "2015-03-11", "end_date": "2015-09-11", "user_id": 8},
	{"premium_plan_id": 2, "start_date": "2015-05-05", "end_date": "2015-07-05", "user_id": 9},
	{"premium_plan_id": 1, "start_date": "2015-06-11", "end_date": "2015-08-11", "user_id": 10}

].each do |sub|
	s = Subscription.create(premium_plan_id: sub[:premium_plan_id], start_date: sub[:start_date].to_date, end_date: sub[:end_date].to_date)
	User.find(sub[:user_id].to_i).update_attributes(subscription_id: s.id)
end

