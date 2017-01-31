module Interface

  def self.menu_header(title)
    puts ""
    decoration(title, "-")
    puts ("   #{title}   ").colorize(:blue)
    decoration(title, "-")
  end

  def self.input_prompt(prompt)
    puts ""
    print ("--- #{prompt} --> ").colorize(:green)
  end

  def self.input_error
    error = "Input Error: Enter Valid Number Selection"
    decoration(error, "*")
    puts error.colorize(:red)
    decoration(error, "*")
  end

  def self.decoration(parameter, symbol)
    print symbol * (parameter.length + 6), "\n"
  end

end
