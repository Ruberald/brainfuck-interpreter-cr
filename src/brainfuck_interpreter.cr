class BrainfuckInterpreter
  def initialize(program : String)
    @program = program
    @memory = Array(UInt8).new(30000) { 0.to_u8 }
    @pointer = 0
    @output = ""
  end

  def run
    pc = 0
    while pc < @program.size
      case @program[pc]
      when '+'
        @memory[@pointer] += 1
      when '-'
        @memory[@pointer] -= 1
      when '>'
        @pointer += 1
      when '<'
        @pointer -= 1
      when '['
        if @memory[@pointer] == 0
          loop_level = 1
          while loop_level > 0
            pc += 1
            loop_level += 1 if @program[pc] == '['
            loop_level -= 1 if @program[pc] == ']'
          end
        end
      when ']'
        if @memory[@pointer] != 0
          loop_level = 1
          while loop_level > 0
            pc -= 1
            loop_level += 1 if @program[pc] == ']'
            loop_level -= 1 if @program[pc] == '['
          end
        end
      when '.'
        @output += (@memory[@pointer]).chr
      end
      pc += 1
    end
  end

  def get_output : String
    @output
  end

end
