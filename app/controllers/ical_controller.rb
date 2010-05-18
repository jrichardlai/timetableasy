#!/usr/bin/env ruby
## Need this so we can require the library from the samples directory
$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'rubygems' # Unless you install from the tarball or zip.
require 'icalendar'
require 'date'

class IcalController < ApplicationController
  before_filter :login_required
  include Icalendar # Probably do this in your class to limit namespace overlap

  def get_ical
    cal = Calendar.new

    event = Event.new
    event.start = DateTime.civil(2010, 6, 23, 8, 30)
    event.summary = "A great event!"
    cal.add_event(event)

    event2 = cal.event  # This automatically adds the event to the calendar
    event2.start = DateTime.civil(2010, 6, 24, 8, 30)
    event2.summary = "Another great event!"

    # Now with support for property parameters
    params = {"ALTREP" =>['"http://my.language.net"'], "LANGUAGE" => ["SPANISH"]} 

    cal.event do
      dtstart Date.new(2010, 04, 29)
      dtend   Date.new(2010, 04, 28)
      summary "This is a summary with params.", params
    end
  end

  # We can output the calendar as a string to write to a file, 
  # network port, database etc.
  cal_string = cal.to_ical
  puts cal_string
end
