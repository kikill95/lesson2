# RubyMonk's public profile: https://rubymonk.com/u/--15980
require 'yaml'

class Ball
  ANSWERS = YAML.load_file('answers.yml')
  COLORS = { red: 31, green: 32, yellow: 33, blue: 34 }

  def color(answer)
    case answer
    when 0..4
      COLORS[:red]
    when 5..9
      COLORS[:green]
    when 10..14
      COLORS[:yellow]
    else
      COLORS[:blue]
    end
  end

  def shake
    random = rand(ANSWERS.length)
    puts "\e[#{color(random)}m#{ANSWERS[random]}\e[0m"
    ANSWERS[random]
  end
end
