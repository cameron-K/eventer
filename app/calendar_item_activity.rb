class CalendarItemActivity < Android::App::Activity
  CalendarItemExtra = "calendar_item_extra"
  def onCreate(savedInstanceState)
    super
    setContentView(R::Layout::Activity_calendar_item)
    calendar_item = self.intent.getStringExtra(CalendarItemExtra)
    calendar_item = JSON.load calendar_item
    display_calendar_item calendar_item
  end
  def display_calendar_item(calendar_item)
    findViewById(R::Id::Title).text = calendar_item["title"]
    findViewById(R::Id::Start).text = calendar_item["starts_at"]
    findViewById(R::Id::End).text = calendar_item["ends_at"]
  end
end
