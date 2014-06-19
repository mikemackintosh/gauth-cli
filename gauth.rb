#!/usr/bin/env ruby

require 'rotp'
require 'inifile'

config = IniFile.load(File.expand_path('~/.gauth'))

puts "Available Tokens:"

i=1
sections = {}

config.each_section do |section|
  puts "#{i}: #{section}"
  sections[i] = section
  i = i + 1
end

puts ""
puts "Which key would you like to load?"

STDOUT.flush  
id = gets.chomp

puts sections.assoc(id).inspect

totp = ROTP::TOTP.new("#{ARGV[0]}")
puts totp.now
