class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  
  class UnsupportedOperation < StandardError; end

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError.new if [first_operand, second_operand].any? { |arg| arg.class != Integer }
    raise UnsupportedOperation.new unless ALLOWED_OPERATIONS.include?(operation)

    result = first_operand.send(operation, second_operand)
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  rescue ZeroDivisionError
    "Division by zero is not allowed."
  end
end
