#mergesort for counting split inversions
require 'pry'


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


  def sort_and_count_array#(sorted = [self.shift], counter = 0)
    # return [counter, sorted] if self.empty?
    sorted = []
    counter = 0
    for i in 0...self.size
      num = self.shift 

      i = sorted.find_index{|i| i > num} || sorted.length
      sorted.insert(i, num)
      counter += sorted.count - (i+1)
    end
    [counter, sorted]
    # sort_and_count_array(sorted, counter)
  end


  def merge_sort
    return 0 if self.size <= 1
    first_half = self.split[0].sort_and_count_array
    second_half = self.split[1].sort_and_count_array
    inversions = first_half[0] + second_half[0]
    a = first_half[1]
    b = second_half[1]
    c = []
    i = 0
    j = 0
    for k in 0...self.size
      if !a[i] 
        c[k] = b[j]
        j += 1
        inversions += a.count - i 
      elsif !b[j]
        c[k] = a[i]
        i += 1
      elsif b[j] < a[i]
        j += 1
        inversions += a.count - i 
      else  
        c[k] = a[i]
        i += 1
      end
    end
    inversions
  end

end
