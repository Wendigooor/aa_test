ActiveAdmin.register_page "Report" do

  content only: :index do
    render 'index'
  end

  controller do
  	layout 'active_admin'
    def index
      # if params[:day_from]
      # 	@date_to = params[:day_from].to_date
      # 	@date_from = params[:day_from].to_date - 7.days
      # else
      # 	@date_to = Date.current
      # 	@date_from = Date.current - 7.days
      # end

      @date_to = Date.current
      @date_from = Date.current - 1.month

      @subscriptions = Subscription.overlaps(@date_from, @date_to)
      @apple_subs = @subscriptions.select {|sub| sub.premium_plan_id == 1 }.count
      @stripe_subs = @subscriptions.select {|sub| sub.premium_plan_id == 2 }.count

      @apple_revenue = @apple_subs * PremiumPlan.find(1).price_per_month
      @stripe_revenue = @stripe_subs * PremiumPlan.find(2).price_per_month

      @revenue = @apple_revenue + @stripe_revenue
    end
  end

end
