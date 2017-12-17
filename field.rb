class Field
  attr_reader :o, :e, :elements

  def initialize(p)
    @elements = Array.new(p) { |n| FieldElement.new(n, p) }
    @o = @elements[0]
    @e = @elements[1]
  end
end

class FieldElement
  attr_reader :el

  def initialize(el, mod)
    @el = el
    @mod = mod
  end
  
  def ==(other)
    (@el % @mod) == (other.el % @mod)
  end

  def +(other)
    FieldElement.new((@el + other.el) % @mod, @mod)
  end

  def *(other)
    FieldElement.new((@el * other.el) % @mod, @mod)
  end

  def **(power)
    FieldElement.new((@el ** power) % @mod, @mod)
  end

  def to_s
    @el.to_s
  end
end
