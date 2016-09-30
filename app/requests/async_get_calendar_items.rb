class AsyncGetCalendarItems < Android::Os::AsyncTask
  attr_accessor :activity, :calendar_items

  def initialize(activity)
    self.activity = activity
  end

  def doInBackground(params)
    json = ConnectionHelper.new.execute("calendar_items", "GET", "2f5ec706b5ccc2fe0bf22e50c44b4f72", true, false)
    calendar_items = JSON.load(json)["calendar_items"]
    calendar_items
  end

  def onPostExecute(calendar_items)
    activity.display_calendar_items calendar_items
  end

end