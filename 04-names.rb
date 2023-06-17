#!/usr/bin/env ruby
## frozen_string_literal: true

require 'csv'

# Find out names without a year

f = File.open('data/06-names.txt')
w = CSV.open('data/06-names.csv', 'w:utf-8')
w << %w[Name LineNum Line]

f.each_with_index do |l, i|
  # pick names with ranges
  m = l.match(/^((\d{1,2}-)?[a-zäëö-]+,\s*[A-Z][a-z]+\s*[^0-9]+,\s*18\d\d-18\d\d)/)
  if  !m.nil?
    w << [m[1], i + 1, l]
    # puts m[1]
  else
    m = l.match(/^((\d{1,2}-)?[a-zäëö-]+,\s*[A-Z][a-z]+\s*[^0-9]+,\s*18\d[\d?])/)
    if !m.nil? && !m.nil?
      w << [m[1], i + 1, l]
      # puts m[1]
    end
  end
end

w.close
f.close
