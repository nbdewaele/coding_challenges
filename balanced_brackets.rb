# A bracket is considered to be any one of the following characters: (, ), {, }, [, or ].
#
# Two brackets are considered to be a matched pair if the an opening bracket (i.e., (, [, or {) occurs to the left of a closing bracket (i.e., ), ], or }) of the exact same type. There are three types of matched pairs of brackets: [], {}, and ().
#
# A matching pair of brackets is not balanced if the set of brackets it encloses are not matched. For example, {[(])} is not balanced because the contents in between { and } are not balanced. The pair of square brackets encloses a single, unbalanced opening bracket, (, and the pair of parentheses encloses a single, unbalanced closing square bracket, ].
#
# By this logic, we say a sequence of brackets is considered to be balanced if the following conditions are met:
#
# It contains no unmatched brackets.
# The subset of brackets enclosed within the confines of a matched pair of brackets is also a matched pair of brackets.
# Given n strings of brackets, determine whether each sequence of brackets is balanced. If a string is balanced, print YES on a new line; otherwise, print NO on a new line.

# Sample Input
#
# 3
# {[()]}
# {[(])}
# {{[[(())]]}}
# Sample Output
#
# YES
# NO
# YES

# ANSWER
class BSMSyntaxError < StandardError
end

class BracketStateMachine
  YES = "YES"
  NO = "NO"
  OPEN_PAREN = '('
  CLOSE_PAREN = ')'
  OPEN_SQUARE = '['
  CLOSE_SQAURE = ']'
  OPEN_CURLY = '{'
  CLOSE_CURLY = '}'

  # parser state
  attr_accessor :inside_parens, :inside_squares, :inside_curlys, :last_token

  # initial state
  def initialize
    @inside_parens = @inside_squares = @inside_curlys = []
  end

  ####
  # helpers
  ####

  def everything_closed?
    @inside_parens.empty? and @inside_squares.empty? and @inside_curlys.empty?
  end

  def rest_of_string input_str
    input_str[1..input_str.length]
  end

  ####
  # event handlers
  ####

  def on_open_paren
    @inside_parens << true
  end

  def on_close_paren
    if [OPEN_SQUARE, OPEN_CURLY].include? @last_token
      raise BSMSyntaxError, "Invalid nesting: close parens"
    elsif @inside_parens.empty?
      raise BSMSyntaxError, "Extra close parens"
    end

    @inside_parens.pop
  end

  def on_open_square
    @inside_squares << true
  end

  def on_close_square
    if [OPEN_PAREN, OPEN_CURLY].include? @last_token
      raise BSMSyntaxError, "Invalid nesting: close square"
    elsif @inside_squares.empty?
      raise BSMSyntaxError, "Extra close square"
    end

    @inside_squares.pop
  end

  def on_open_curly
    @inside_curlys << true
  end

  def on_close_curly
    if [OPEN_PAREN, OPEN_SQUARE].include? @last_token
      raise BSMSyntaxError, "Invalid nesting: close curly"
    elsif @inside_curlys.empty?
      raise BSMSyntaxError, "Extra close curly"
    end

    @inside_curlys.pop
  end

  ####
  # parser
  ####

  def parse input_str
    char = input_str[0]

    # state machine
    # emit events for each important character
    # and update the parser state accordingly
    begin
      case char
      when OPEN_PAREN
        on_open_paren
      when CLOSE_PAREN
        on_close_paren
      when OPEN_SQUARE
        on_open_square
      when CLOSE_SQAURE
        on_close_square
      when OPEN_CURLY
        on_open_curly
      when CLOSE_CURLY
        on_close_curly
      end
    rescue BSMSyntaxError => bsme
      # invalid state detected
      puts "#{bsme.message} at #{input_str}"
      return NO
    end

    if not input_str.empty?
      @last_token = char
      parse rest_of_string(input_str)
    elsif everything_closed?
      YES
    else
      puts "Something left open"
      NO
    end
  end

  def self.parse input
    self.new.parse input
  end
end

inputs = %w({[()]} {[(])} {{[[(())]]}}] [)

inputs.each do |input|
  puts input
  puts BracketStateMachine.parse(input)
  puts
end
