require "queue"
describe "MyQueue" do
    subject(:queue_1) { MyQueue.new }
    subject(:queue_2) { MyQueue.new }

    it "should not expose a reader or writer for @queue" do
        expect(queue_1).to_not respond_to(:queue, :queue=)
    end

    describe "#initialize" do
        it "should set @queue to an empty array" do
            expect(queue_1.instance_variable_get(:@queue)).to eq([])
        end
    end

    describe "#size" do
        it "should return the total number of items currently on the queue" do
            expect(queue_1.size).to eq(0)

            queue_1.instance_variable_set(:@queue, ['x', 'y', 'z'])
            expect(queue_1.size).to eq(3)

            queue_2.instance_variable_set(:@queue, ['q', 'r', 's', 't', 'u', 'v'])
            expect(queue_2.size).to eq(6)
        end
    end

    describe "#empty?" do
        context "when the queue contains no items" do
            it "should return true" do
                expect(queue_1.empty?).to eq(true)
            end
        end

        context "when the queue contains some items" do
            it "should return false" do
                queue_1.instance_variable_set(:@queue, ['a', 'b'])
                expect(queue_1.empty?).to eq(false)
            end
        end
    end

    describe "#peek" do
        it "should return the item next in the queue" do
            queue_1.instance_variable_set(:@queue, ['a', 'b', 'c', 'd'])
            expect(queue_1.peek).to eq('a')

            queue_2.instance_variable_set(:@queue, ['a', 'b', 'c', 'd', 'e', 'f'])
            expect(queue_2.peek).to eq('a')
        end

        it "should not modify the queue" do
            queue_1.instance_variable_set(:@queue, ['a', 'b', 'c', 'd'])
            queue_1.peek
            expect(queue_1.instance_variable_get(:@queue)).to eq(['a', 'b', 'c', 'd'])
        end
    end

    describe "#enqueue" do
        it "should accept an item as an argument" do
            expect { queue_1.enqueue('spinach') }.to_not raise_error
        end

        it "should add the given item to the end of the queue" do
            queue_1.enqueue('spinach')
            expect(queue_1.instance_variable_get(:@queue)).to eq(['spinach'])

            queue_2.instance_variable_set(:@queue, ['a', 'b', 'c', 'd'])
            queue_2.enqueue('e')
            expect(queue_2.instance_variable_get(:@queue)).to eq(['a', 'b', 'c', 'd', 'e'])
        end

        it "should return the new size of the queue" do
            expect(queue_1.enqueue('spinach')).to eq(1)

            queue_2.instance_variable_set(:@queue, ['a', 'b', 'c', 'd'])
            expect(queue_2.enqueue('e')).to eq(5)
        end
    end

    describe "#dequeue" do
        context "when there are no items on the queue" do
            it "should return nil" do
                expect(queue_1.dequeue).to eq(nil)
                expect(queue_1.instance_variable_get(:@queue)).to eq([])
            end
        end

        context "when there is at least one item on the queue" do
            it "should remove the first item of the queue" do
                queue_1.instance_variable_set(:@queue, ['a', 'b', 'c', 'd'])
                queue_1.dequeue
                expect(queue_1.instance_variable_get(:@queue)).to eq(['b', 'c', 'd'])

                queue_2.instance_variable_set(:@queue, ['r'])
                queue_2.dequeue
                expect(queue_2.instance_variable_get(:@queue)).to eq([])
            end

            it "should return the removed element" do
                queue_1.instance_variable_set(:@queue, ['a', 'b', 'c', 'd'])
                expect(queue_1.dequeue).to eq('a')

                queue_2.instance_variable_set(:@queue, ['r'])
                expect(queue_2.dequeue).to eq('r')
            end
        end
    end
end
