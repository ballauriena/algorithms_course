class Mergesort
	attr_accessor :array

	def initialize(array)
		@array = array
	end

	def round_up
	    return (@array.size)/2 + 1if (@array.size) % 2 != 0
	    return (@array.size)/2
	end

	def split
		nested_array = []
		@array.each_slice(round_up){ |ary| nested_array << ary }
		nested_array
	end
end