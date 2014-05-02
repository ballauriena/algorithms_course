class Array
  
  def round_up
    return (self.size)/2 + 1 if (self.size) % 2 != 0
    return (self.size)/2
  end


  def split
    nested_array = []
    self.each_slice(round_up){ |ary| nested_array << ary }
    nested_array
  end

  def sort_array(ary, sorted = [])
    return sorted if ary.empty?

    num = ary.pop 

    if sorted.empty? || num > sorted.last
      sorted << num
    else
      for i in 0..sorted.count
      	if sorted[i] && num <= sorted[i] 
      	  sorted.insert(i, num)
      	  break
      	end
      end
    end
    sort_array(ary, sorted)
  end

  def merge_sort
    a = sort_array(split[0])
    b = sort_array(split[1])
    c = []
    i = 0
    j = 0
    for k in 0...self.size
      if !a[i] || b[j] < a[i]
        c[k] = b[j]
        j += 1
      else #!b[j] || a[i] < b[j] 
        c[k] = a[i]
        i += 1
      end
    end
    c
  end

end

