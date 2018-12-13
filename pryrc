Pry.config.theme  = "railscasts"
Pry.config.editor = "vim -p"

# Simple prompt, colored
Pry.prompt = [
  proc { |obj, nest_level, _| prompt = ">> " },
  proc { |obj, nest_level, _| prompt = "   " }
]

Pry.hooks.add_hook :after_read, :hack_encoding do |str, _|
  str.force_encoding("ASCII-8BIT")
end

Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "#{exception.class}: #{exception.message}"
  exception.backtrace.each do |bt|
    puts "\tfrom: #{bt}"
    break if bt =~ /^\(pry\)/
  end
end

if defined?(PryByebug)
  # Pry.commands.alias_command 'c', 'continue'
  # Pry.commands.alias_command 's', 'step'
  # Pry.commands.alias_command 'n', 'next'
  # Pry.commands.alias_command 'f', 'finish'
end
%w(base64 uri json csv cgi).each {|dep| require dep }
