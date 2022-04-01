require_relative "room"

class Hotel
  
    def initialize(name, rooms)
        @name = name
        @rooms = {}
        rooms.each { |k, v| @rooms[k] = Room.new(v) }
    end   

    def name
        new_name = @name.split(" ").map { |part| part.capitalize }
        new_name.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.include?(room_name)
    end

    def check_in(guest, room_name)
        if !self.room_exists?(room_name)
            p "sorry, room does not exist"
        elsif @rooms[room_name].add_occupant(guest)
            p "check in successful"
        else
            p "sorry, room is full"
        end
    end

    def has_vacancy?
        @rooms.any? { |room, capacity| !@rooms[room].full? }
    end

    def list_rooms
        @rooms.each { |room, cap| puts room + " " + "#{@rooms[room].available_space}" }
    end

end
