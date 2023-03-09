require_relative './node'

class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend(node)
        node.next_node = @head
        @head = node
    end

    def append(node)
        if head.nil?
            @head = node
            return
        end

        last_node = @head
        while last_node.next_node
            last_node = last_node.next_node
        end

        last_node.next_node = node
    end

    def delete_head
        if @head != nil
            @head = head.next_node
        end

    end

    def delete_tail
        if self.head.nil?
            return
        elsif self.head.next_node == nil
            self.head = nil
            return
        end
        last_node = @head
        previous_node = nil
        while last_node.next_node
            previous_node = last_node
            last_node = last_node.next_node
        end
        last_node = nil
        previous_node.next_node = nil
    end

    def add_after(index, node)
        count = 0
        new_node = @head
        until count == index
            previous_node = new_node
            new_node = new_node.next_node
            count += 1
        end
        if new_node.nil?
            previous_node.next_node = node
        else
            new_node.next_node = node
        end
        
    end

    def search(value)

        new_node = @head
        correct_node = nil
        until correct_node
            if new_node.data == value
                correct_node = new_node
            elsif new_node.next_node.data == value
                correct_node = new_node.next_node
            else
                correct_node = nil
            end
        end
        correct_node

    end



end
