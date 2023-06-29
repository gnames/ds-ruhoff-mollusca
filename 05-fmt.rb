#!/usr/bin/env ruby
## frozen_string_literal: true

require 'csv'

# Find out names without a year

f = CSV.open('data/06-names.csv', headers: true)
w = CSV.open('data/07-fmt-names.csv', 'w:utf-8')
w << %w[Name OrigName Phylum LineNum DatasetIDs Line]
phyl = 'Mollusca'
source_ids = '1,2,3,8,11,12,105,132,158,163,170,172,179,181,183,186,194'

f.each_with_index do |l, i|
  # pick names with ranges
  name = l['Name']
  m = name.match(/^(([a-züäëö-]+),\s*([A-Z][a-z]+)\s+([a-zäëö-]+){0,2}\s+([^0-9]+)?,\s*(18\d\d-18\d\d))/)
  unless m.nil?
    fmt = "#{m[3]} #{m[4]} #{m[2]} #{m[5]}, #{m[6]}"
    w << [fmt, name, phyl, i + 2, source_ids, l['Line']]
    # puts name
    next
  end

  m = name.match(/^(([a-züäëö-]+),\s*([A-Z][a-z]+)\s+([^0-9]+)?,\s*(18\d\d-18\d\d))/)
  unless m.nil?
    fmt = "#{m[3]} #{m[2]} #{m[4]}, #{m[5]}"
    w << [fmt, name, phyl, i + 2, source_ids, l['Line']]
    # puts name
    next
  end

  m = name.match(/^(((\d{1,2}-)?[a-züäëö-]+),\s*([A-Z][a-z]+(\s+\([A-Z][a-z]+\.?\))?)\s+([a-zäëö-]{4,}){0,2}\s+([^0-9]+),\s*(18\d[\d?]))/)
  unless m.nil?
    fmt = "#{m[4]} #{m[6]} #{m[2]} #{m[7]}, #{m[8]}"
    w << [fmt, name, phyl, i + 2, source_ids, l['Line']]
    # puts name
    next
  end

  m = name.match(/^(((\d{1,2}-)?[a-üäëö-]+),\s*([A-Z][a-zö]+(\s+\([A-Z][a-z]+\.?\))?)\s+([^0-9]+),\s*(18\d[\d?]))/)
  unless m.nil?
    fmt = "#{m[4]} #{m[2]} #{m[6]}, #{m[7]}"
    w << [fmt, name, phyl, i + 2, source_ids, l['Line']]
    # puts name
    next
  end

  puts format('%05d %s', i + 2, name)
end

w.close
f.close
