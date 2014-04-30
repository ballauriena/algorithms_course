class Mergesort
	attr_accessor :array


	def initialize(array)
		@array = array
	end


	def round_up
	    return (@array.size)/2 + 1 if (@array.size) % 2 != 0
	    return (@array.size)/2
	end


	def split
		nested_array = []
		@array.each_slice(round_up){ |ary| nested_array << ary }
		nested_array
	end


	def sort_array(ary, sorted = [])
		return sorted if ary.size == 0

		num = ary.pop 

		if !sorted.empty?
			for i in 0..sorted.count
				if num <= sorted[i] 
					sorted.insert(i, num)
					break
				end
			end
		else
			sorted << num
		end

		sort_array(ary, sorted)
	end

	
end