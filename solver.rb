require_relative 'field'

class Solver
  def initialize(field, equation)
    @field = field
    @equation = prepare(equation)
  end

  def solve
    with_param = @equation.include?('a')
    with_param ? solve_with_param : solve_without_param
  end

  private

  def prepare(equation)
    equation.gsub!(/[01=]/, '1' => '@field.e', '0' => '@field.o', '=' => '==')
  end

  def solve_with_param
    @field.elements.each do |a|
      next if a == @field.o

      puts "For param a = #{a}"

      @field.elements.each do |x|
        puts "\t Solution x = #{x}" if eval(@equation)
      end

      puts "\n"
    end
  end

  def solve_without_param
    @field.elements.each do |x|
      puts "Solution x = #{x}" if eval(@equation)
    end
  end
end
