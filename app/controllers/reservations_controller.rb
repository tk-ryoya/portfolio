class ReservationsController < ApplicationController
  require 'google/apis/calendar_v3'
  require 'googleauth'

  APPLICATION_NAME = 'GOOGLE_CALENDAR_EXAMPLE'.freeze
  MY_CALENDAR_ID = '3luqpqlml35q3ki2kb7tk4hqbk@group.calendar.google.com'.freeze
  CLIENT_SECRET_PATH = './service_account_json_key.json'.freeze

  def initialize
    @service = Google::Apis::CalendarV3::CalendarService.new
    @service.client_options.application_name = APPLICATION_NAME
    @service.authorization = authorize
    @calendar_id = MY_CALENDAR_ID
  end

  def authorize
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(CLIENT_SECRET_PATH),
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR)
    authorizer.fetch_access_token!
    authorizer
  end

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = current_user.reservations.build
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      redirect_to reservations_path, '予約しました'
    else
      flash.now[:error] = '予約に失敗しました'
    end
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  def edit
    @reservation = current_user.reservations.find(params[:id])
  end

  def destroy
    @reservation = current_user.reservations.find(params[:id])
    @reservation.destroy!
    redirect_to reservations_path, success: '予約キャンセルしました'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :reservation_type, :reservation_datetime)
  end
end
