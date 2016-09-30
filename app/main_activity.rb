class MainActivity < Android::App::Activity
  attr_accessor :calendar_items
  def onCreate(savedInstanceState)
    super
    AsyncGetCalendarItems.new(self).execute([])
    # display_calendar_items [{"title" => "moday"}]
  end

  def display_calendar_items(calendar_items)
    self.calendar_items = calendar_items
    adapter = Android::Widget::ArrayAdapter.new(self, Android::R::Layout::Simple_list_item_1, calendar_items.collect{|i| i["title"]})
    lv = Android::Widget::ListView.new self
    lv.adapter = adapter
    lv.onItemClickListener = self
    self.contentView = lv
  end

  def onItemClick(parent, view, position, id)
    intent = Android::Content::Intent.new(self, CalendarItemActivity)
    intent.putExtra(CalendarItemActivity::CalendarItemExtra, calendar_items[position].to_json)
    startActivity intent
  end
end