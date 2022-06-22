class CoffeeError < StandardError
  def message 
    return "This is coffee, yuck"
  end
end

# PHASE 2
def convert_to_int(str)
  Integer(str)
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "Coffee" 
    raise CoffeeError
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  begin
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
  rescue CoffeeError => e 
    p e.message
  retry
  rescue StandardError => e
    p e.message
  retry
  end
end  

# PHASE 4

class DescriptiveError < StandardError
  def message
    p "we've known each other longer than that, pls remember ): "
  end
end
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    begin
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    if yrs_known < 5
      raise DescriptiveError if yrs_known <5
    rescue DescriptiveError => e
      p e.message
      yrs_known = gets.chomp.to_i
    retry
    end
  end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


