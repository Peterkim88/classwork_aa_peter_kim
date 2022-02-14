require 'rspec'
require 'tdd_project'

#Remove dups
# prestep monkey patch in an Array class
# 1. returns only unique elements from array
# 2. returns unique elements in the order in which they first appeared.
# 3. returns a new_arr

# prestep monkey patch in an Array class
describe Array do
  let(:arr) { [1, 2, 1, 3, 3] }
  let(:arr2) { [4, 7, 4, 8, 8, 1] }

  describe "#my_uniq" do
    # 1. returns only unique elements from array
    it "returns only unique elements from array" do
      expect(arr.my_uniq).to eq([1, 2, 3])
    end
    # 2. returns unique elements in the order in which they first appeared.
    it "returns unique elements in the order in which they first appeared" do
      expect(arr2.my_uniq).to eq([4, 7, 8, 1])
    end
    # 3. returns a new_arr
    it "returns a new_arr" do
      expect(arr.my_uniq).not_to be(arr)
    end
  end
end

#two_sum

#1. create a class array
#2. describe two_sum 
#3. create variables - one for the original array on Open, a new one with differnt numbers
#4. each pair to be sorted smaller index before bigger. the array of pairs to be sorted "dictionary-wise":

describe Array do
  describe "#two_sum" do
  let(:arr) {[-1, 0, 2, -2, 1]}
  let(:arr2) {[3, 2, -2, 0, -1, -3, 1]}

    it "sum of elements at each pair of indicies should equal to 0" do
      expect(arr.two_sum).to eq([[0,4], [2,3]])
    end
    it "the array of pairs to be sorted 'dictionary-wise'" do
      expect(arr2.two_sum).to eq([[0, 5], [1, 2], [4, 6] ])
    end 
    
  end
end

# 1. create a class Array
describe Array do
# 2. describe my_transpose
  describe "#my_transpose" do
# 3. create row variable - rows = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
  let(:arr) {[[0, 1, 2], [3, 4, 5], [6, 7, 8]]}
# 4. create another row variable - rows2 = [[0, 1],[2, 3]]
  let(:arr2) {[[0, 1],[2, 3]]}
# 5. first it - "returns a new 2-d array that converts the row-orientations to column-orientations"
    it "returns a new 2-d array that converts the row-orientations to column-orientations" do
# 6. rows => [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
      expect(arr.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
# 7. rows2 => [[0, 2], [1, 3]]
      expect(arr2.my_transpose).to eq([[0, 2], [1, 3]])
    end
  end
end


# 1. describe "#stock_picker" 
describe "#stock_picker" do
# 2. create variable prices = [6, 3, 6, 8, 3, 5, 8, 4, 1, 4, 7, 7, 10, 4]
  let(:stock1) {[6, 3, 6, 8, 3, 5, 8, 4, 1, 4, 7, 7, 10, 4]}
  let(:stock2) {[10, 7, 1, 7, 4, 4, 6, 5, 4, 3, 6, 3, 8, 8]}
# 3. it statement "outputs the first most profitable pair of days"
    it "outputs the first most profitable pair of days" do
# 4. expect variables.stock_picker => [8, 12] 
      expect(stock_picker(stock1)).to eq([8, 12])
    end

    it "profits are only valid when sold after day of purchase" do
      expect(stock_picker(stock2)).to eq([2, 12])
    end
end

