#!/usr/bin/env ruby
require 'set'

class Array
    def included_in? array
        array.to_set.superset?(self.to_set)
    end
end

picks, max_elem, bankers = ARGV

unless ARGV.length >= 2
    puts "Usage: \n\tperms <picks> <max_selns> [bankers]\n\n"
    exit 1
end
puts "Picks: #{picks}, Max elements: #{max_elem}"

seln_range = *(1..max_elem.to_i)
perms = seln_range.permutation(picks.to_i).to_a
puts "Permutations Length: #{perms.length}\n"

if bankers.to_i > 0
    unless bankers.to_i <= 2 
        puts "\nFor bankers, please select up to two bankers!\n\n"
        exit 1
    end
    banker_arr = *(1..bankers.to_i)

    print "Perms with one banker: "

    cntr = 0
    perms.each do |perm|
        if perm.include? banker_arr.first.to_i
            cntr = cntr+1
        end
    end

    puts cntr

    print "Perms with two bankers: "
    cntr = 0
    perms.each do |perm|
        if banker_arr.included_in? perm
            cntr = cntr+1
        end
    end

    puts cntr
end