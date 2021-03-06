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
    lim_arr = LimitedArray.new(10)
    lim_arr.set(0, 'Hello')

    it "tests the set method on LimitedArray" do
      lim_arr.set(1, 'Yo')

      expect(lim_arr.storage[1]).to eq('Yo')
    end

    it "tests the get method on LimitedArray" do
      expect(lim_arr.get(0)).to eq('Hello')
    end

    it "tests the each method on LimitedArray" do
      def square_it(element, idx)
        element[1].length * element[1].length
      end

      expect(lim_arr.each(method(:square_it))).to eq({0=>25, 1=>4})
    end
  end

  describe Queue do
    le_queue = Queue.new()

    it "tests the enqueue method on Queue" do
      le_queue.enqueue(12)
      le_queue.enqueue(13)
      le_queue.enqueue(14)

      expect(le_queue.items[0]).to eq(14)
      expect(le_queue.items[1]).to eq(13)
      expect(le_queue.items[2]).to eq(12)
      le_queue.clear
    end

    it "tests the dequeue method on Queue" do
      le_queue.enqueue(12)
      le_queue.enqueue(13)
      le_queue.enqueue(14)
      le_queue.dequeue
      le_queue.dequeue

      expect(le_queue.items).to eq({0=>14})
      le_queue.clear
    end

    it "tests the contains method on Queue for falsy value for non-inclusive items" do
      le_queue.enqueue(12)
      le_queue.enqueue(13)
      le_queue.enqueue(14)

      expect(le_queue.contains(20)).to eq false
      le_queue.clear
    end

    it "tests the contains method on Queue for truthy value for inclusive items" do
      le_queue.enqueue(12)
      le_queue.enqueue(13)
      le_queue.enqueue(14)

      expect(le_queue.contains(13)).to eq true
      le_queue.clear
    end

    it "tests the peek method on Queue for viewing top of stack without removing it" do
      le_queue.enqueue(12)
      le_queue.enqueue(13)
      le_queue.enqueue(14)

      expect(le_queue.peek).to eq(12)
      le_queue.clear
    end

    it "tests the to_array method on Queue" do
      le_queue.enqueue(1)
      le_queue.enqueue(2)
      le_queue.enqueue(3)
      le_queue.enqueue(4)

      expect(le_queue.to_array).to eq([1, 2, 3, 4])
    end
  end

  describe LinkedList do
    describe SinglyNode do
      it "tests the add method on LinkedList" do
        ll = LinkedList.new(nil, nil, 0)
        ll.add(10)
        ll.add(13)
        ll.add(24)

        expect(ll.head.data).to eq(10)
        expect(ll.head.next_in_line.data).to eq(13)
        expect(ll.head.next_in_line.next_in_line.data).to eq(24)
      end

      it "tests the search_by_position method on LinkedList" do
        ll = LinkedList.new(nil, nil, 0)
        ll.add(10)
        ll.add(13)
        ll.add(24)

        expect(ll.search_by_position(1).data).to eq(10)
        expect(ll.search_by_position(2).data).to eq(13)
        expect(ll.search_by_position(3).data).to eq(24)
        expect { ll.search_by_position(4).data }.to raise_error(RuntimeError)
      end

      it "tests the get item method on LinkedList" do
        ll = LinkedList.new(nil, nil, 0)
        ll.add(10)
        ll.add(13)
        ll.add(24)

        expect(ll.get_item(10)).to_not eq(nil)
        expect(ll.get_item(13)).to_not eq(nil)
        expect(ll.get_item(10).next_in_line.data).to eq(13)
        expect(ll.get_item(13).next_in_line.data).to eq(24)
        expect { ll.get_item(24).next_in_line.data }.to raise_error(NoMethodError)
      end

      it "tests the contains method on LinkedList if included returns true" do
        ll = LinkedList.new(nil, nil, 0)
        ll.add(10)
        ll.add(13)
        ll.add(24)

        expect(ll.contains(10)).to eq(true)
        expect(ll.contains(13)).to eq(true)
        expect(ll.contains(24)).to eq(true)
      end

      it "tests the contains method on LinkedList if not included returns false" do
        ll = LinkedList.new(nil, nil, 0)
        ll.add(10)
        ll.add(13)
        ll.add(24)

        expect(ll.contains(100)).to eq(false)
        expect(ll.contains(130)).to eq(false)
        expect(ll.contains(240)).to eq(false)
      end

      it "tests the remove_by_input method on LinkedList" do
        ll = LinkedList.new(nil, nil, 0)
        ll.add(10)
        ll.add(13)
        ll.add(24)

        ll.remove_by_input(10)
        ll.remove_by_input(24)
        expect(ll.head.data).to eq(13)
        expect { ll.next_in_line.data }.to raise_error(NoMethodError)
      end

      it "tests the remove_dups_and_reinitialize method on LinkedList" do
        ll = LinkedList.new(nil, nil, 0)
        ll.add(10)
        ll.add(13)
        ll.add(24)
        ll.add(13)
        ll.add(10)
        ll.add(24)
        ll.add(5)
        ll.add(6)
        ll.add(5)
        ll = ll.remove_dups_and_reinitialize

        expect(ll.head.data).to eq(10)
        expect(ll.head.next_in_line.data).to eq(13)
        expect(ll.head.next_in_line.next_in_line.data).to eq(24)
        expect(ll.head.next_in_line.next_in_line.next_in_line.data).to eq(5)
        expect(ll.head.next_in_line.next_in_line.next_in_line.next_in_line.data).to eq(6)
      end

      it "tests the find_before method on LinkedList" do
        ll = LinkedList.new(nil, nil, 0)
        ll.add(10)
        ll.add(13)
        ll.add(24)
        ll.add(13)
        ll.add(10)
        ll.add(24)
        ll.add(5)
        ll.add(6)
        ll.add(5)
        ll = ll.remove_dups_and_reinitialize

        expect(ll.find_before(24).data).to eq(13)
      end

      it "tests the remove_by_position method on LinkedList" do
        ll = LinkedList.new(nil, nil, 0)
        ll.add(10)
        ll.add(13)
        ll.add(24)
        ll.add(13)
        ll.add(10)
        ll.add(24)
        ll.add(5)
        ll.add(6)
        ll.add(5)
        ll = ll.remove_dups_and_reinitialize
        ll.remove_by_position(2)

        expect(ll.contains(13)).to eq false
      end
    end
  end

  describe Stack do
    it "tests the push method on Stack" do
      le_stack = Stack.new()

      le_stack.push(1)
      le_stack.push(2)
      le_stack.push(3)

      expect(le_stack.items).to eq({0=>3, 1=>2, 2=>1})
      le_stack.clear
    end

    it "tests the pop method on Stack" do
      le_stack = Stack.new()

      le_stack.push(1)
      le_stack.push(2)
      le_stack.push(3)
      le_stack.pop

      expect(le_stack.items).to eq({0=>2, 1=>1})
      le_stack.clear
    end

    it "tests the peek method on Stack" do
      le_stack = Stack.new()

      le_stack.push(1)
      le_stack.push(2)
      le_stack.push(3)

      expect(le_stack.peek).to eq(3)
      le_stack.clear
    end

    it "tests the is_empty? method on Stack for falsy value when stack.items has more than 0 keys" do
      le_stack = Stack.new()

      le_stack.push(1)
      le_stack.push(2)
      le_stack.push(3)

      expect(le_stack.is_empty?).to eq false
    end

    it "tests the is_empty? method on Stack for truthy value when stack.items has more than 0 keys" do
      le_stack = Stack.new()

      expect(le_stack.is_empty?).to eq true
    end

    it "tests the stack_size method on Stack" do
      le_stack = Stack.new()

      le_stack.push(1)
      le_stack.push(2)
      le_stack.push(3)

      expect(le_stack.stack_size).to eq(3)
    end

    it "tests the to_array method on Stack" do
      le_stack = Stack.new()

      le_stack.push(1)
      le_stack.push(2)
      le_stack.push(3)

      expect(le_stack.to_array).to eq([3, 2, 1])
    end
  end

  describe Tree do
    it "tests the add_child method on Tree" do
      le_tree = Tree.new(10)
      le_tree.add_child(12)

      expect(le_tree.children[0].value).to eq(12)
    end

    it "tests the remove_from_parent method on Tree" do
      le_tree = Tree.new(10)
      le_tree.add_child(12)
      le_tree.children[0].add_child(13)

      expect(le_tree.children[0].children[0].value).to eq(13)
      expect(le_tree.children[0].children.length).to eq(1)

      le_tree.children[0].children[0].remove_from_parent
      expect(le_tree.children[0].children.length).to eq(0)
    end

    it "tests the contains method on Tree for falsy values for non-inclusive children" do
      le_tree = Tree.new(10)
      le_tree.add_child(12)
      le_tree.children[0].add_child(13)

      expect(le_tree.contains(24)).to eq false
    end

    it "tests the contains method on Tree for truthy values for inclusive children" do
      le_tree = Tree.new(10)
      le_tree.add_child(12)
      le_tree.children[0].add_child(13)

      expect(le_tree.contains(12)).to eq true
    end

    it "tests the traverse method on Tree" do
      le_tree = Tree.new(10)
      le_tree.add_child(15)
      le_tree.add_child(20)
      le_tree.children[0].add_child('YOOOOOOO')
      le_tree.contains(10)
      le_tree.contains(15)
      le_tree.contains(11)
      le_tree.contains('YOOOOOOO')
      le_tree.children[0].children[0].remove_from_parent
      le_tree.contains('YOOOOOOO')

      expect(le_tree.traverse).to eq([10, 15, 20])
    end
  end
end
