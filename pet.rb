class Pet

  def initialize(name, type)
    @name, @type = name, type
    @age = 0
    @mood = 10
    @hungry = 10
    @asleep = 10
    @clean = 10
    @walk = 10
    @energy = 10

    puts "You have created #{@type} with name: #{@name}."
    puts "Type 'help' to watch full list of commands."
    menu
  end

  def walk
    @walk += 4
    @mood += 2
    @clean -= 1
    @hungry -= 1
    @asleep -= 1
    @energy -= 1
    cycle
    menu
  end

  def sleep
    @asleep += 8
    @energy += 4
    @walk -= 4
    cycle
    menu
  end

  def eat
    @hungry += 8
    @energy += 4
    @mood += 2
    @asleep -= 1
    @clean -= 2
    cycle
    menu
  end

  def play
    @mood += 4
    @asleep -= 1
    @energy -= 2
    @clean -= 3
    @hungry -= 3
    cycle
    menu
  end

  def clean
    @clean += 8
    @walk -= 1
    @mood -= 1
    @hungry -= 1
    @energy -= 1
    cycle
    menu
  end

  def train
    @walk += 2
    @mood += 1
    @asleep -= 2
    @hungry -= 1
    @energy -= 4
    cycle
    menu
  end

  def punish
    @energy -= 1
    @hungry -= 1
    @mood -= 5
    cycle
    menu
  end

  def watch
    random = rand(10)
    if random == 3
      puts "Your pet found a friend."
      @mood += 4
    end
    if random == 5
      puts "The car pined down your pet."
      close
    end
    cycle
    menu
  end

  def info
    puts "Some information about your pet:"
    puts "Your #{@type} has name: #{@name}"
    puts "Age: #{@age}"
    puts "Mood: #{@mood}"
    puts "Hungry: #{@hungry}"
    puts "Asleep: #{@asleep}"
    puts "Clean: #{@clean}"
    puts "Walk: #{@walk}"
    puts "Energy: #{@energy}"
    menu
  end

  def help
    puts "The list of possible commands (type word or number):"
    puts "1. walk"
    puts "2. sleep"
    puts "3. eat"
    puts "4. play"
    puts "5. clean"
    puts "6. train"
    puts "7. watch"
    puts "8. punish"
    puts "9. info"
    puts "10. help"
    puts "11. close"
    menu
  end

  def close
    exit
  end

  def menu
    puts "Your action:"
    action = gets.chomp
    case action
    when "walk", "1"
      walk
    when "sleep", "2"
      sleep
    when "eat", "3"
      eat
    when "play", "4"
      play
    when "clean", "5"
      clean
    when "train", "6"
      train
    when "watch", "7"
      watch
    when "punish", "8"
      punish
    when "info", "9"
      info
    when "help", "10"
      help
    when "close", "11"
      close
    else
    end
  end


  private

  def cycle
    @age += 1
    @mood -= rand(3)
    @hungry -= rand(3)

    if @age > 20
      puts "Your #{@type} #{@name} became very old and died."
      close
    end
    if @mood > 25
      puts "Your #{@type} #{@name} became crazy."
      close
    end
    if @hungry <= 0
      puts "Your #{@type} #{@name} became very hungry and died."
      close
    end
    if @asleep <= 0
      puts "Your #{@type} #{@name} became sick and died in the hospital."
      close
    end
    if @clean <= 0
      puts "Your #{@type} #{@name} became very unclean and beetles ate it."
      close
    end
    if @walk <= 0
      puts "Your #{@type} #{@name} became very sad and run away from you."
      close
    end
    if @energy <= 0
      puts "Your #{@type} #{@name} had a nervous breakdown and died in the hospital."
      close
    end
  end
end

puts "What type of animal do you want?"
type = gets.chomp
puts "What is the name of your pet?"
name = gets.chomp

Pet.new(type, name).menu