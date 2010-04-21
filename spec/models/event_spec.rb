require 'spec_helper'

describe Event do

  describe "A valid event should have a begin date and and end date" do

    it "should not be valid if the time is not set" do
      Event.create.should_not be_valid
    end

    it "should be valid if the time is set" do
      Event.new(:begin_at => Time.parse("Aug 31 16:00"), :end_at => Time.parse("Aug 31 16:30")).should be_valid
    end

    it "should have a begin date anterior to the en date" do
      Event.new(:begin_at => Time.parse("Aug 31 17:00"), :end_at => Time.parse("Aug 31 16:30")).should_not be_valid
    end

    it "should set the event begin_at and end_at when setting days and hours" do
      @event = Event.new({:start_day => '01/05/2010', :end_day => '01/05/2010', :end_time => '13:00', :start_time => '12:00'})
      @event.save.should be_true
      @event.begin_at.sec.should == Time.parse("01/05/2010 12:00").sec
      @event.end_at.sec.should == Time.parse("01/05/2010 13:00").sec
    end

    it "should not let a busy speaker to be intervenant in the same time" do
      pending
    end

    it "should not let a occupied room to be used in the same time" do
      pending
    end

    it "should return a warning if the time for a pedagogy is exceded" do
      pending
    end

  end
end
