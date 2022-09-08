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

  def puts_event(event)
    puts "Summary:  #{event.summary}"
    puts "Location: #{event.location}"
    puts "ID:       #{event.id}"
    puts "Start:    #{event.start.date_time}"
    puts "End:      #{event.end.date_time}"
  end

  def set_event(summary, description, location, start_time, end_time)
    Google::Apis::CalendarV3::Event.new({
        summary: summary,
        description: description,
        location: location,
        start: Google::Apis::CalendarV3::EventDateTime.new(
          date_time: start_time
        ),
        end: Google::Apis::CalendarV3::EventDateTime.new(
          date_time: end_time
        )
      }
    )
  end

  def create
    event = set_event(
      'inserted test event',
      'test event',
      'test',
      DateTime.new(2020, 8, 23, 12),
      DateTime.new(2020, 8, 23, 15)
    )

    response =  @service.insert_event(
      @calendar_id,
      event
    )

    puts_event(response)
  end

  def read
    events = @service.list_events(@calendar_id,
                                  time_min: (Time.new(2020, 1, 1)).iso8601,
                                  time_max: (Time.new(2020, 12, 1)).iso8601,
                                 )
    events.items.each do |event|
      puts '-------------------------------'
      puts_event(event)
    end
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

    puts_event(response)
  end

  def delete(event_id)
    @service.delete_event(
      @calendar_id,
      event_id
    )
  end
end
