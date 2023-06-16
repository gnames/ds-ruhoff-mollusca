#!/usr/bin/env ruby
## frozen_string_literal: true

# Concatenate lines in 02-index.txt

def continuation?(line)
  return true if line.size < 30
  return false if line =~ /^[a-z]{4,}[\.,]\s/
  return false if line =~ /^[\d]{1,2}-[a-z]{4,},\s/
  return true if line =~ /^[\d]+[^-]/
  return true if line =~ /(plate|figure)/
  return true if line =~ /[\d]:/


  false
end

f = File.open('data/02-index.txt')
prev_line = ''
cont_line = ''

f.each do |l|
  unless continuation?(l)
    if prev_line != ''
      puts "FL: #{prev_line}"
    end

    prev_line = l
    next
  end

  prev_line = "#{prev_line} #{l}"
  prev_line = prev_line.gsub(/\s{2,}/, ' ')
end
puts "E: #{prev_line}"