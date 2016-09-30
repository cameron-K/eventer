# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/android'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Eventer'
  app.package = "com.rubythree.eventer"
  app.main_activity = "MainActivity"
  app.sub_activities << "CalendarItemActivity"
  app.theme = "@android:style/Theme.Holo.Light"
  app.development { app.archs << 'x86' }
end
