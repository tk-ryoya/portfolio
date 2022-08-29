class Reservation < ApplicationRecord
  belongs_to :user

  enum reservation_type: { first_interview: 0, repeate_interview: 1 }

  validates :reservation_type, presence: true
  validates :reservation_datetime, presence: true

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

  # だいそんさんの認証用コード
  # def initialize
  #   @calendar_service = Google::Apis::CalendarV3::CalendarService.new.tap { |cs| cs.authorization = authorizer }
  # end
  #
  # def authorizer
  #   @authorizer ||= Google::Auth::ServiceAccountCredentials.make_creds(
  #     json_key_io: File.open('credentials.json'),
  #     scope: scope
  #   )
  # end
end
