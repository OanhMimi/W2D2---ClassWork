require_relative "room"

class Hotel

    attr_reader :rooms

    def initialize(name,hash) #hash = {roomname => capacity}
        @name = name
        @rooms = Hash.new {|h,key| h[key] = 0}
        hash.each do |k,v|
            @rooms[k] = Room.new(hash[k])
        end
    end

    def name
        new_arr = @name.split(" ").map do |word| 
            word.capitalize
        end
        new_arr.join(" ")
    end

    def room_exists?(room_name)
        if @rooms.has_key?(room_name)
            return true
        else
            return false
        end
    end

    def check_in(person,room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                p 'check in successful'
            else
                p 'sorry, room is full'
            end
        else
            p ' sorry, room does not exist'
        end
    end

    def has_vacancy?
        @rooms.each do |k,v|
            if v.full?
                return false
            else
                return true
            end
        end
    end

    def list_rooms
        @rooms.each do |k,v|
            puts k +"."+v.available_space.to_s
        end
    end
    
end
