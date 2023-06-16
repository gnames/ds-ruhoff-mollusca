#!/usr/bin/env ruby
## frozen_string_literal: true

# Find out names which do not follow alphabetic order

f = File.open('data/04-sortfix.txt')
prev_line = ''

f.each_with_index do |l, i|
  m = l.match(/^((\d{1,2}-)?[a-zäëö-]+),/)
  l = m[1]
  if prev_line == ''
    prev_line = l
    next
  end

  if l < prev_line
    puts format('%05d %s < %s', i + 1, l, prev_line)
    next
  end
  prev_line = l
end
