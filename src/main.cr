require "./brainfuck_interpreter.cr"

if ARGV.size == 0
  puts "Provide brainfuck program in arguments"
else
  program = ARGV[0]
  interpreter = BrainfuckInterpreter.new(program)
  interpreter.run
  puts interpreter.get_output
end
