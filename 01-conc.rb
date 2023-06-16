#!/usr/bin/env ruby
## frozen_string_literal: true

# Concatenate lines in 02-index.txt

def continuation?(line)
  return true if line.size < 20
  return false if line =~ /^[a-z-]{4,},\s/
  return false if line =~ /^\d{1,2}-[a-z]{4,},\s/
  return false if line =~ /^(aci|ada|aha|ala|arx|boa|coa|cor|dux|eoa),/
  return false if line =~ /^(eos|eta|eva|gea|ino|ios|jos|mus|noe|nux),/
  return false if line =~ /^(pan|pia|ros|sol|tau|vau|yod),/

  true
end

f = File.open('data/02-index.txt')
prev_line = ''

f.each do |l|
  unless continuation?(l)
    puts prev_line.strip if prev_line != ''

    prev_line = l
    next
  end

  prev_line = "#{prev_line} #{l}"
  prev_line = prev_line.gsub(/\s{2,}/, ' ')
end
puts prev_line.strip
