module Gauntlet
  module Problems
    class PostfixCalculator

      # This one's not math, I swear!

      # Your job is to create a calculator which evaluates expressions
      # in postfix notation, sometimes called reverse Polish notation.

      # For example, the expression
      # 
      #     5 1 2 + 4 * + 3 -
      #
      # is equivalent to
      #
      #     5 + ((1 + 2) * 4) - 3
      #
      # and evaluates to 14.

      # Note for simplicity's sake you can assume there are always spaces
      # between numbers and operations.
      # e.g. `1 3 +` is valid but `1 3+` is not.

      # Source: Codewars

      def self.calc(expression)
        return 0 if expression == ""
        stack = Array.new
        equation = expression.split(" ")
        equation.each do |unit|
          if ["+", "-", "*", "/", "**"].include? unit
            b = stack.pop
            a = stack.pop
            stack.push(do_equation(a, b, unit))
          else
            stack.push(unit.to_f)
          end
        end
        stack.pop
      end

      def self.do_equation(a, b, operator)
        a.send(operator, b)
      end

    end
  end
end
