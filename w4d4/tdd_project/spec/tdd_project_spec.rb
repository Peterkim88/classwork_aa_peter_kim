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