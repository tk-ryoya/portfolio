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
    now = Date.current
    next_month = now.next_month
    events = @service.list_events(@calendar_id,
                                  single_events: true,
                                  order_by:      "startTime",
                                  time_min: (Time.new(now.year, now.month, now.day)).iso8601,
                                  time_max: (Time.new(next_month.year, next_month.month, next_month.day)).iso8601,
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

  def closed_days
    items = self.read.items
    rest = items.map { |item| item.start.date if item.summary == '休診日(臨時)' }
    rest.compact
  end

  def closed_days_pm
    items = self.read.items
    rest = items.map { |item| item.start.date if item.summary == '午後休診(臨時)' }
    rest.compact
  end
end
