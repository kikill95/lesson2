class Ball
  require 'yaml'
  attr_accessor :ANSWERS

  def initialize
    @ANSWERS = YAML.load_file('answers.yml')
  end

  def color(answer)
    case answer
      when 0..4
        31
      when 5..9
        32
      when 10..14
        33
      else
        34
    end
  end

  def shake
    random = rand(@ANSWERS.length)
    puts "\e[#{color(random)}m#{@ANSWERS[random]}\e[0m"
  end
end

Ball.new.shake