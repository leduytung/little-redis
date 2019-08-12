module DataStructure
  class LinkedList
    # Init the list with single or multi value
    def initialize
      @head = nil
      @tail = nil
      @size = 0
    end

    # Add a single value to list
    def add(value)
      node = Node.new(value)
      unless @head
        @head = node
      else
        node.previous = @tail
        @tail.next = node
      end
      @tail = node
      @size += 1
    end

    # Delete element with the value
    def delete(value)
    end

    #Delete last element of list(tail)
    def rpop
      temp = @tail
      @tail = @tail.previous
      @tail.next = nil
      return temp.to_s
    end

    #Delete first element of list(head)
    def lpop
      temp = @head
      @head = @head.next
      return temp.to_s
    end

    # Return size of list
    def size
      @size
    end

    # Return array of value in list between 2 conditions
    def lrange(start = 0, stop = 0)
      elements = []
      current_node = @head
      counter = 0
      while (current_node.next != nil) && (stop > 0 ? (counter <= stop) : true)
        # Condition for elements
        cond_start = start >= 0 ? (counter >= start) : true
        cond_stop = stop > 0 ? (counter <= stop) : true
        
        elements << current_node.to_s if (cond_start && cond_stop)
        counter = counter + 1
        current_node = current_node.next
      end
      counter = counter + 1
      elements << current_node.to_s if (stop > 0 ? (counter <= stop) : true)
      return elements.to_s
    end

    #
    def to_s
      "#<List: #{lrange()}"
    end
  end
end