#!/usr/bin/env ruby
require './flights.rb'
require 'test/unit'

class TestFlights < Test::Unit::TestCase

  def test_standard_cases
    # Running the test case provided as an example
    avg_time = average_time_of_arrival ['11:51pm', '11:56pm', '12:01am', '12:06am', '12:11am']
    assert_equal('12:01am', avg_time)
    # Running another test that doesn't have an average crossing midnight
    avg_time_2 = average_time_of_arrival ['11:15pm', '12:03am', '11:30pm', '11:23pm', '11:48pm']
    assert_equal('11:35pm', avg_time_2)
  end
  
  def test_std_plus_6_hrs
    avg_time = average_time_of_arrival ['6:41am', '6:51am', '7:01am']
    assert_equal('06:51am', avg_time)
  end

  def test_std_plus_12_hrs
    avg_time = average_time_of_arrival ['11:51am', '11:56am', '12:01pm', '12:06pm', '12:11pm']
    assert_equal('12:01pm', avg_time)
  end
  
  def test_bad_times_array
    avg_time = average_time_of_arrival ['11:51pm', '11:56pm', '12:01am', 'FRED', '12:11am']
    assert_equal('Please check input times', avg_time)
  end
  
  def test_no_times_array_passed
    assert_equal(nil, average_time_of_arrival)
  end

  def test_non_array_passed
    assert_equal(nil, average_time_of_arrival('fred'))
    assert_equal(nil, average_time_of_arrival(12))
    assert_equal(nil, average_time_of_arrival(3.14159))
  end
  
end
