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

      it "tests the add method on DoublyLinkedList" do
        dll = DoublyLinkedList.new(nil, nil, 0)
        dll.add(10)
        dll.add(13)
        dll.add(24)

        expect(dll.head.data).to eq(10)
        expect(dll.head.next_in_line.data).to eq(13)
        expect(dll.head.next_in_line.prev.data).to eq(10)
        expect(dll.head.next_in_line.next_in_line.data).to eq(24)
        expect(dll.head.next_in_line.next_in_line.prev.data).to eq(13)
      end


      it "tests the search_by_position method on DoublyLinkedList" do
        dll = DoublyLinkedList.new(nil, nil, 0)
        dll.add(10)
        dll.add(13)
        dll.add(24)

        expect(dll.search_by_position(1).data).to eq(10)
        expect(dll.search_by_position(2).data).to eq(13)
        expect(dll.search_by_position(3).data).to eq(24)
        expect { dll.search_by_position(4).data }.to raise_error(RuntimeError)
      end


      it "tests the get item method on DoublyLinkedList" do
        dll = DoublyLinkedList.new(nil, nil, 0)
        dll.add(10)
        dll.add(13)
        dll.add(24)

        expect(dll.get_item(10)).to_not eq(nil)
        expect(dll.get_item(13)).to_not eq(nil)
        expect(dll.get_item(10).next_in_line.data).to eq(13)
        expect(dll.get_item(13).next_in_line.data).to eq(24)
        expect { dll.get_item(24).next_in_line.data }.to raise_error(NoMethodError)
      end


      it "tests the contains method on DoublyLinkedList if included returns true" do
        dll = DoublyLinkedList.new(nil, nil, 0)
        dll.add(10)
        dll.add(13)
        dll.add(24)

        expect(dll.contains(10)).to eq(true)
        expect(dll.contains(13)).to eq(true)
        expect(dll.contains(24)).to eq(true)
      end

      it "tests the contains method on DoublyLinkedList if not included returns false" do
        dll = DoublyLinkedList.new(nil, nil, 0)
        dll.add(10)
        dll.add(13)
        dll.add(24)

        expect(dll.contains(100)).to eq(false)
        expect(dll.contains(130)).to eq(false)
        expect(dll.contains(240)).to eq(false)
      end


      it "tests the remove_by_input method on DoublyLinkedList" do
        dll = DoublyLinkedList.new(nil, nil, 0)
        dll.add(10)
        dll.add(13)
        dll.add(24)

        dll.remove_by_input(10)
        dll.remove_by_input(24)
        expect(dll.head.data).to eq(13)
        expect { dll.next_in_line.data }.to raise_error(NoMethodError)
      end


      it "tests the remove_dups_and_reinitialize method on DoublyLinkedList" do
        dll = DoublyLinkedList.new(nil, nil, 0)
        dll.add(10)
        dll.add(13)
        dll.add(24)
        dll.add(13)
        dll.add(10)
        dll.add(24)
        dll.add(5)
        dll.add(6)
        dll.add(5)
        dll = dll.remove_dups_and_reinitialize

        expect(dll.head.data).to eq(10)
        expect(dll.head.next_in_line.data).to eq(13)
        expect(dll.head.next_in_line.next_in_line.data).to eq(24)
        expect(dll.head.next_in_line.next_in_line.next_in_line.data).to eq(5)
        expect(dll.head.next_in_line.next_in_line.next_in_line.next_in_line.data).to eq(6)
      end
    end
  end


  describe Graph do
    it "tests the add_node method on Graph" do
      le_graph = Graph.new()

      le_graph.add_node(10)
      le_graph.add_node(13)
      le_graph.add_node(24)

      expect(le_graph.nodes_array).to eq([10, 13, 24])
    end


    it "tests the remove_node method on Graph" do
      le_graph = Graph.new()

      le_graph.add_node(10)
      le_graph.add_node(13)
      le_graph.add_node(24)

      le_graph.remove_node(24)

      expect(le_graph.nodes_array).to eq([10, 13])
    end


    it "tests the contains method on Graph for falsy value of non-inclusive node" do
      le_graph = Graph.new()

      le_graph.add_node(10)
      le_graph.add_node(13)
      le_graph.add_node(24)

      expect(le_graph.contains(100)).to eq false
    end


    it "tests the contains method on Graph for truthy value of inclusive node" do
      le_graph = Graph.new()

      le_graph.add_node(10)
      le_graph.add_node(13)
      le_graph.add_node(24)

      expect(le_graph.contains(24)).to eq true
    end

    it "tests the add_edge method on Graph" do
      le_graph = Graph.new()

      le_graph.add_node(10)
      le_graph.add_node(13)
      le_graph.add_node(24)

      le_graph.add_edge(13, 10)

      expect(le_graph.data[10]).to eq([13])
      expect(le_graph.data[13]).to eq([10])
    end


    it "tests the has_edge method on Graph for falsy value of non-inclusive edge" do
      le_graph = Graph.new()

      le_graph.add_node(10)
      le_graph.add_node(13)
      le_graph.add_node(24)

      le_graph.add_edge(13, 10)

      expect(le_graph.has_edge(24, 10)).to eq false
    end

    it "tests the has_edge method on Graph for truthy value of inclusive edge" do
      le_graph = Graph.new()

      le_graph.add_node(10)
      le_graph.add_node(13)
      le_graph.add_node(24)

      le_graph.add_edge(13, 10)

      expect(le_graph.has_edge(10, 13)).to eq true
    end

    it "tests the remove_edge method on Graph" do
      le_graph = Graph.new()

      le_graph.add_node(10)
      le_graph.add_node(13)
      le_graph.add_node(24)

      le_graph.add_edge(13, 10)
      le_graph.remove_edge(10, 13)

      expect(le_graph.has_edge(13, 10)).to eq false
    end

    it "tests the depth_first_search method on Graph" do
      le_graph = Graph.new()

      le_graph.add_node(1)
      le_graph.add_node(2)
      le_graph.contains(2)
      le_graph.remove_node(2)
      le_graph.contains(2)
      le_graph.contains(1)
      le_graph.add_node(2)
      le_graph.add_node(3)
      le_graph.add_edge(3, 2)
      le_graph.has_edge(3, 2)
      le_graph.has_edge(3, 1)
      le_graph.add_node(4)
      le_graph.add_node(5)
      le_graph.add_edge(5, 4)
      le_graph.remove_edge(4, 5)
      le_graph.has_edge(4, 5)
      le_graph.remove_edge(2, 3)
      le_graph.remove_node(5)

      le_graph.add_node(0)
      le_graph.add_node(1)
      le_graph.add_node(2)
      le_graph.add_node(3)
      le_graph.add_edge(0, 1)
      le_graph.add_edge(0, 2)
      le_graph.add_edge(1, 2)
      le_graph.add_edge(2, 0)
      le_graph.add_edge(2, 3)
      le_graph.add_edge(3, 1)

      expect(le_graph.depth_first_search(2)).to eq([2, 0, 1, 3])
    end
  end


  describe LimitedArray do

  end


  describe Queue do

  end

  describe LinkedList do
    describe SinglyNode do

    end
  end


  describe Stack do

  end

  describe Tree do

  end
end
