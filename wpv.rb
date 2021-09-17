#!/usr/bin/env ruby

require 'optparse'
require_relative 'wpv-methods.rb'

option_parser = OptionParser.new do |opts|
  filename=$0
  opts.banner =
"Usage:
  " + filename + " --site <site1,site2>
  " + filename + " -s <site1,site2>
"
  opts.on("-s", "--site SITE", "Site, seperated by commas.") do |site|
     @site = site
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end

#
end.parse!

if !@site
  puts "ERROR: Option --site (-s) required."
  exit
end

@site.split(",").each do |wpsite|
  wpv(wpsite)
end
puts "DONE motha fucka!"


