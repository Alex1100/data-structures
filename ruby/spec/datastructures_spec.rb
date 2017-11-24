require_relative '../lib/datastructures'

describe "all datastructures" do

  describe BinarySearchTree do

    it "tests the insert method on BinarySearchTree" do
      bst = BinarySearchTree.new(10)
      bst.insert(9)
      bst.insert(6)
      bst.insert(5)
      bst.insert(8)
      bst.insert(15)
      bst.insert(13)
      bst.insert(20)

      expect(bst.left.value).to eq(9)
      expect(bst.right.value).to eq(15)
      expect(bst.left.left.value).to eq(6)
      expect(bst.right.right.value).to eq(20)
      expect(bst.left.left.left.value).to eq(5)
    end


    it "tests the contains method on BinarySearchTree to be false for non-inclusive nodes" do
      bst = BinarySearchTree.new(10)
      bst.insert(9)
      bst.insert(6)
      bst.insert(5)
      bst.insert(8)
      bst.insert(15)
      bst.insert(13)
      bst.insert(20)

      expect(bst.contains(100)).to eq(false)
    end

    it "tests the contains method on BinarySearchTree to be true for inclusive nodes" do
      bst = BinarySearchTree.new(10)
      bst.insert(9)
      bst.insert(6)
      bst.insert(5)
      bst.insert(8)
      bst.insert(15)
      bst.insert(13)
      bst.insert(20)

      expect(bst.contains(20)).to eq(true)
    end


    it "tests the DFS_to_array method on BinarySearchTree to convert nodes into an array" do
      bst = BinarySearchTree.new(10)
      bst.insert(9)
      bst.insert(6)
      bst.insert(5)
      bst.insert(8)
      bst.insert(15)
      bst.insert(13)
      bst.insert(20)

      expect(bst.DFS_to_array).to eq([10, 9, 6, 5, 8, 15, 13, 20])
    end


    it "tests the BFS_to_array method on BinarySearchTree to convert nodes into an array" do
      bst = BinarySearchTree.new(10)
      bst.insert(9)
      bst.insert(6)
      bst.insert(5)
      bst.insert(8)
      bst.insert(15)
      bst.insert(13)
      bst.insert(20)

      expect(bst.BFS_to_array).to eq([10, 9, 15, 6, 13, 20, 5, 8])
    end
  end


  describe DoublyLinkedList do
    describe DoublyNode do





    end
  end
end
