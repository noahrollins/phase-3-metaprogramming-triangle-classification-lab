class Triangle
  
  attr_reader :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def kind
    validate_triangle
    if side_a == side_b && side_b == side_c
      :equilateral
    elsif side_a == side_b || side_b == side_c || side_a == side_c
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [side_a, side_b, side_c].all?(&:positive?)
  end

  def validate_triangle_inequality?
    side_a + side_b > side_c && side_a + side_c > side_b && side_b + side_c > side_a
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && validate_triangle_inequality?
  end

  class TriangleError < StandardError
  end
end
