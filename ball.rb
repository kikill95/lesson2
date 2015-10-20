# RubyMonk's public profile: https://rubymonk.com/u/--15980
require 'yaml'

class Ball
  attr_accessor :answers, :colors

  def initialize
    @answers = YAML.load_file('answers.yml')
    @colors = {:red => 31, :green => 32, :yellow => 33, :blue => 34}
  end

  def color(answer)
    case answer
      when 0..4
        @colors[:red]
      when 5..9
        @colors[:green]
      when 10..14
        @colors[:yellow]
      else
        @colors[:blue]
    end
  end

  def shake
    random = rand(@answers.length)
    puts "\e[#{color(random)}m#{@answers[random]}\e[0m"
  end
end

Ball.new.shake