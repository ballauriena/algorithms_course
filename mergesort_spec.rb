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

   describe "#sort_and_count_array" do
    it "sorts an array of numbers from least to greatest" do
      arrays = array1.split
      expect(arrays[0].sort_and_count_array[1]).to eq([2, 7, 9, 10])
    end

    it "sorts an odd array of numbers from least to greatest" do
      arrays = array2.split
      expect(arrays[0].sort_and_count_array[1]).to eq([2, 6, 7, 9, 10])
    end

    it "counts the number of inversions in an even array" do
      arrays = array1.split
      expect(arrays[0].sort_and_count_array[0]).to eq(1)
    end

    it "counts the number of inversions in an odd arrray" do
      arrays = array2.split
      expect(arrays[0].sort_and_count_array[0]).to eq(4)
    end
  end

  describe "#merge_sort" do
    it "counts inversions in even arrays" do
      expect(array1.merge_sort).to eq(12)
    end

    it "counts inversions in odd arrays" do
      expect(array2.merge_sort).to eq(18)
    end

    it "returns the original array if it only contains one element" do
      array = [6]
      expect(array.merge_sort).to eq(0)
    end

    it "returns an empty array if the array is empty" do
      array = []
      expect(array.merge_sort).to eq(0)
    end
  end

end

