require 'rspec'
require_relative 'mergesort'

describe Array do 

  let (:array1) { [7, 2, 9, 10, 6, 8, 1, 26] }
  let (:array2) { [7, 2, 9, 10, 6, 8, 1, 26, 4] }

  describe "#round_up" do
    it "returns an integer half the length of the array if the array is even" do
      expect(array1.round_up).to eq(4)
    end

    it "rounds a float up to the nearest whole number if the array is an odd length" do
      expect(array2.round_up).to eq(5)
    end
  end

  describe "#split" do
    it  "returns two arrays that are halves of the original array when the array is an even length" do
      expect(array1.split).to eq([[7, 2, 9, 10], [6, 8, 1, 26]])
    end

    it  "returns two arrays that are halves of the original array when the array 
      is an odd length with the first array containing one more element than the second" do
      expect(array2.split).to eq([[7,2,9,10, 6], [8, 1, 26, 4]])
    end
  end

  describe "#sort_array" do
    it "sorts an array of numbers from least to greatest" do
      arrays = array1.split
      expect(array1.sort_array(arrays[0])).to eq([2, 7, 9, 10])
    end

    it "sorts an odd array of numbers from least to greatest" do
      arrays = array2.split
      expect(array2.sort_array(arrays[0])).to eq([2, 6, 7, 9, 10])
    end
	end

  describe "#merge_sort" do
    it "merges the two half arrays in a sorted order" do
      expect(array1.merge_sort).to eq([1, 2, 6, 7, 8, 9, 10, 26])
    end

    it "merges the two uneven half arrays in a sorted order" do
      expect(array2.merge_sort).to eq([1, 2, 4, 6, 7, 8, 9, 10, 26])
    end
  end

end

