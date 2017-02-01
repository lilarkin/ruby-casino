require 'pry'
require 'colorize'
require 'artii'

module Interface

  def self.menu_header(title)
    puts ""
    decoration(title, "-")
    puts ("   #{title}   ").colorize(:blue)
    decoration(title, "-")
  end

  def self.input_prompt(prompt)
    puts ""
    print ("--- #{prompt} --> ").colorize(:cyan)
  end

  def self.winner(win_statement)
    puts ""
    decoration(win_statement, "~")
    puts ("   #{win_statement}   ").colorize(:green)
    decoration(win_statement, "~")
  end

  def self.input_error
    error = ("Input Error: Enter Valid Number Selection").colorize(:red)
    decoration(error, "*")
    puts error.colorize(:red)
    decoration(error, "*")
  end

  def self.decoration(parameter, symbol)
    print symbol * (parameter.length + 6), "\n"
  end

end
