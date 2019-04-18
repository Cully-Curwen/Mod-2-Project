class SubscriptionsController < ApplicationController

  def index
    @subscriptions = Subscription.where(user_id: @current_user.id)
  end

  def all
    @subscriptions = Subscription.where(user_id: @current_user.id)
  end

  def new
    @subscription = Subscription.new(session[:subscription])
    @companies = Company.all.order(:name)
    @billing_frequency = ["Test", "1", "2"] #will need to fix, test only
    @currency = Currency.all #will need to fix, test only
    @contract_type = ["Fixed", "Auto-Renew", "Open Ended / Continious / Rolling"] #will need to fix, test only
    @payment_method = @subscription.payment_method
    
    # @payment_options = session[:subscription][:payment_method]

    # if !@current_user.bank_details.empty?
    #   @current_user.bank_details.map{|e| @payment_options << [e.id, "Direct Debit"]}
    # end
    # if !@current_user.card_details.empty?
    #   @current_user.card_details.map{|e| @payment_options << e}
    # end
    # if !@current_user.paypal_details.empty?
    #   @current_user.paypal_details.map{|e| @payment_options << e}
    # end
  end
  
  def create
    subscription = Subscription.create(params_subscriptions)
    if subscription.valid?
      redirect_to subscriptions_all_path
    else
      # Error
      byebug
      store = params_subscriptions.to_hash.select{ |key, value| !value.empty? }
      store.map do |key, value|
        session[:subscription][key] = value
      end
      redirect_to new_subscription_path
    end
  end

  def store
    # session[:subscription] = store.select{|key, value| !value.empty?}
    store = params_subscriptions.to_hash.select{ |key, value| !value.empty? }
    store.map do |key, value|
      session[:subscription][key] = value
    end
    
    redirect_to payment_method_select_path
  end
  
  def edit
    @subscription = Subscription.where(id: params[:id], user_id: @current_user.id)
  end
  
  def update
    
    redirect_to subscriptions_all
  end

  private

  def params_subscriptions
    params.require(:subscription).permit(
      :id,
      :user_id,
      :company_id,
      :product,
      :billing_value,
      :billing_frequency,
      :currency_id,
      :contract_type,
      :contract_start,
      :contract_end,
      :payment_method_type,
      :payment_method_id
    )
  end
end
