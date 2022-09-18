class Calendar
  include ActiveModel::Model

  def initialize
    @service = Google::Apis::CalendarV3::CalendarService.new
    @service.client_options.application_name = ENV["APPLICATION_NAME"]
    @service.authorization = authorize
    @calendar_id = ENV["CALENDAR_ID"]
  end

  def authorize
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(ENV["CLIENT_SECRET_PATH"]),
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR)
    authorizer.fetch_access_token!
    authorizer
  end

  def set_event(summary, start_time, end_time)
    event = Google::Apis::CalendarV3::Event.new(
      summary: summary,
      start: Google::Apis::CalendarV3::EventDateTime.new(date_time: start_time.iso8601),
      end: Google::Apis::CalendarV3::EventDateTime.new(date_time: end_time.iso8601)
    )
    @service.insert_event(@calendar_id, event)
  end

  def read
    events = @service.list_events(@calendar_id,
                                  single_events: true,
                                  order_by:      "startTime",
                                  time_min: (Time.new(2022, 9, 1)).iso8601,
                                  time_max: (Time.new(2022, 9, 20)).iso8601,
                                  )
  end

  def update(event_id)
    event = set_event(
      'updated test event',
      'updated test event',
      'updated',
      DateTime.new(2020, 8, 24, 12),
      DateTime.new(2020, 8, 24, 15)
    )

    response =  @service.update_event(
      @calendar_id,
      event_id,
      event
    )
  end

  def delete(event_id)
    @service.delete_event(
      @calendar_id,
      event_id
    )
  end

  # def fetch_events(set_time)
  #     calendar_id = ENV["CALENDAR_ID"]
  #     now = Time.current
  #     start_time = set_time
  #     end_time = set_time + 1
  #     response = @service.list_events(calendar_id,
  #                                 single_events: true,
  #                                 order_by:      "startTime",
  #                                 time_min:      Time.new(now.year,now.month,now.day,start_time,0,0).iso8601,
  #                                 time_max:      Time.new(now.year,now.month,now.day,end_time,0,0).iso8601 )
  # end
  #
  # def reservations_available_time_09_10
  #   response = self.fetch_events(9)
  #   if response.items.empty?
  #     result = '◎'
  #   elsif response.items.count == 4
  #     result = '△'
  #   else
  #     result = '○'
  #   end
  #   result
  # end
end
