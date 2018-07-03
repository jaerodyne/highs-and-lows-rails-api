class SubscribersController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  before_action :set_subscriber, only: [:show, :update, :destroy]
  protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }
  skip_before_action :verify_authenticity_token
  http_basic_authenticate_with name: ENV['API_USERNAME'], password: ENV['API_PASSWORD']

  # GET /subscribers
  def index
    @subscribers = Subscriber.all

    render json: @subscribers
  end

  # GET /subscribers/1
  def show
    render json: @subscriber
  end

  # POST /subscribers
  def create
    @subscriber = Subscriber.new(subscriber_params)

    SubscriberMailer.subscribe_email(@subscriber).deliver

    if @subscriber.save
      render json: @subscriber, status: :created, location: @subscriber
    else
      render json: @subscriber.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subscribers/1
  def update
    if @subscriber.update(subscriber_params)
      render json: @subscriber
    else
      render json: @subscriber.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subscribers/1
  def destroy
    @subscriber.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subscriber_params
      params.require(:subscriber).permit(:email)
    end
end
