#!/usr/bin/env ruby
#coding: utf-8

@max = `ioreg -n AppleSmartBattery | grep MaxCapacity | awk '{ print $5 }'` # maximum capacity
@cur = `ioreg -n AppleSmartBattery | grep CurrentCapacity | awk '{ print $5 }'` # current capacity
@cap = @cur.to_f / @max.to_f * 20.0

r = 20..1
(r.first).downto(r.last).each do |i|
  s1 = '—'
  s2 = '❚'
  width = 18
  if i > (@cap + 1)
    puts s1 * width
  elsif i > @cap
    bar_count = ((1-(i - @cap)) * width).floor
    puts "#{(s2 * bar_count)}#{(s1 * (width - bar_count))}"
  else
    s = '❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚❚'
    if @cap < 4
      puts "\033[31m#{s}\033[0m"
    else
      puts s
    end
  end
end