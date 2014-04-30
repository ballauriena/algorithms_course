require 'rspec'
require_relative 'mergesort'

describe Mergesort do 

	let (:mergesort1) { Mergesort.new([7, 2, 9, 10, 6, 8, 1, 26]) }
	let (:mergesort2) { Mergesort.new([7, 2, 9, 10, 6, 8, 1, 26, 4]) }

	describe "#initialize" do
		context "with valid input" do
			it "creates a new instance of Mergesort with an array" do
				expect(mergesort1.array).to eq([7, 2, 9, 10, 6, 8, 1, 26])
			end
		end

		context "with no input" do
			it "throws an argument error when not passed an array" do
				expect{ Mergesort.new }.to raise_error(ArgumentError)
			end
		end

	end

	describe "#round_up" do
		it "returns an integer half the length of the array if the array is even" do
			expect(mergesort1.round_up).to eq(4)
		end

		it "rounds a float up to the nearest whole number if the array is an odd length" do
			expect(mergesort2.round_up).to eq(5)
		end
	end

	describe "#split" do
		it  "returns two arrays that are halves of the original array when the array is an even length" do
			expect(mergesort1.split).to eq([[7,2,9,10], [6, 8, 1, 26]])
		end

		it  "returns two arrays that are halves of the original array when the array 
			is an odd length with the first array containing one more element than the second" do
			expect(mergesort2.split).to eq([[7,2,9,10, 6], [8, 1, 26, 4]])
		end
	end

end