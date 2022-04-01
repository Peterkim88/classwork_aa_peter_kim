require "passenger"

class Flight
    
    def initialize(flight_num, capacity)
        @flight_number = flight_num
        @capacity = capacity
        @passengers = []
    end

    def passengers
        @passengers
    end

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !self.full?
            @passengers << passenger
        end
    end

    def list_passengers
        @passengers.map { |pass| pass.name }
    end

    def [](num)
        @passengers[num]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
    
end