class SubscriptionsController < ApplicationController
  before_action :set_event, only: %i[create destroy]
  before_action :set_subscription, only: [:destroy]

  # POST /subscriptions
  def create
    @new_subscription = @event.subscriptions.build(subscription_params)
    @new_subscription.user = current_user

    if user_signed_in? && @event.user == current_user
      return redirect_to('events/show', alert: I18n.t('controllers.subscriptions.current_user_error'))
    end

    if @new_subscription.save
      EventMailer.subscription(@event, @new_subscription).deliver_now
      redirect_to(@event, notice: I18n.t('controllers.subscriptions.created'))
    else
      # https://goo.gl/ake5rB - stackoverflow, last comment
      # https://goo.gl/Yjpy1Z - Adding flash message capability to your render calls in Rails
      render('events/show', alert: I18n.t('controllers.subscriptions.error'))
    end
  end

  # DELETE /subscriptions/1
  def destroy
    message = { notice: I18n.t('controllers.subscriptions.destroyed') }

    if current_user_can_edit?(@subscription)
      @subscription.destroy
    else
      message = { alert: I18n.t('controllers.subscriptions.error') }
    end

    redirect_to(@event, message)
  end

  private

  def set_subscription
    @subscription = @event.subscriptions.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def subscription_params
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end
end
