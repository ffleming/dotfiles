# Railscasts Theme, vi for editing
Pry.config.theme  = "railscasts"
Pry.config.editor = "subl -wn"

# Simple prompt, colored
Pry.prompt = [
  proc { |obj, nest_level, _| prompt = ">> " },
  proc { |obj, nest_level, _| prompt = "   " }
]

Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "#{exception.class}: #{exception.message}"
  exception.backtrace.each do |bt|
    puts "\tfrom: #{bt}"
    break if bt =~ /^\(pry\)/
  end
end
