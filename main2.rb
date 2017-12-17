require_relative 'solver'

primes = [3, 5, 7]

primes.each do |p|
  puts "Field F#{p}", "\n"

  field = Field.new(p)
  solver = Solver.new(field, 'x**2 + x + a = 0')
  solver.solve

  puts '--------------', "\n"
end
