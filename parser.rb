require_relative 'mergesort'

array = File.open("integers.txt").readlines.map{ |line| line.to_i }

p array.merge_sort
