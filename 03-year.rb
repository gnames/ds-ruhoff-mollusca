#!/usr/bin/env ruby
## frozen_string_literal: true

# Find out names without a year

f = File.open('data/05-year.txt')

f.each_with_index do |l, i|
  m = l.match(/^(\d{1,2}-)?[a-zäëö-]+,\s*[^0-9]+18\d{2}/)
  puts format('%05d %s', i, l) if m.nil?
end
