def mystery1(n)
  puts n
  if n == 1
    return n
  else
    return n + mystery1(n-1)
  end
end

def mystery2(n)
  if n < 10
    return n
    puts n
    puts "end of loop 1"
  else
    return (n%10) + mystery2(n/10)
    puts (n%10) + mystery2(n/10)
    puts "end of loop 1"
  end
end

puts mystery2(-123)

def mystery3(n)
  if n == 0
    return 100
  elsif n == -1
    return 200
  end
  if n%2 == 0
    return mystery3(n/2)
  else
    return mystery3(n-1)
  end
end

def mystery4(b,e)
  if e == 0
    return 1
  else
    return b * mystery4(b,e-1)
  end
end

def mystery5(s)
  if s.length == 0
    return ""
  else
    return "*" + mystery5(s[1..-1])
  end
end

def mystery6(s)
  if s == nil || s.length == 0
    return ""
  else
    space = 0
    until space >= s.length || s[space] == " "
      space += 1
    end
    return mystery6(s[(space+1)..-1]) + " " + s[0...space]
  end
end

def mystery7(word)
  if word.length < 2
    return true
  elsif word[0] != word[-1]
    return false
  else
    return mystery7(word[1..-2])
  end
end

# ANSWERS:

# Define the following:

# - Recursion
# A method of solving a problem where the solution depends on solutions to smaller instances of the same problem

# - Recursive Case
# Inputs for which the program recurs (calls itself)

# - Base Case
# The terminating scenario in recursion that does not use recursion to produce an answer

# - Activation Chain/Function Call Stack
# A stack data structure that stores information about the active subroutines of a program

# - Activation Record/Function Call
# A request made by a program or script that performs a predetermined function

# - Infinite Recursion/Stack Overflow/Stack too deep
# Any recursion that continues without end

# - Tail Recursion
# The use of a tail call (a function is called as the last act of another function) to perform a recursive function

# Tracing through a recursive method. Time & Space complexity.
# Trace #1
# def mystery1(n)
#   if n == 1
#     return n
#   else
#     return n + mystery1(n-1)
#   end
# end

# - What is mystery1(5)?
# mystery1(5) = 5 + mystery1(4)
# mystery1(4) = 4 + mystery1(3)
# mystery1(3) = 3 + mystery1(2)
# mystery1(2) = 2 + mystery1(1)
# mystery1(1) = 1
# => 1 + 2 + 3 + 5 = 15

# - What is mystery1(10)?
# mystery1(10) = 10 + mystery1(9)
# mystery1(9) = 9 + mystery1(8)
# mystery1(8) = 8 + mystery1(7)
# mystery1(7) = 7 + mystery1(6)
# mystery1(6) = 6 + mystery1(5)
# mystery1(5) = 5 + mystery1(4)
# mystery1(4) = 4 + mystery1(3)
# mystery1(3) = 3 + mystery1(2)
# mystery1(2) = 2 + mystery1(1)
# mystery1(1) = 1
# => 10 + 9 + 8 + 7 + 6 + 5 + 4 + 3 + 2 + 1 = 55

# - What is mystery1(0)?
# => Error - actual error given: stack level too deep, SystemStackError (reason: 0 is greater than the base case 1)

# - What is the time complexity of mystery1(n)?
# => O(n), reason: n steps

# - What is the space complexity of mystery1(n)?
# => O(n), reason: n stack frames

# Trace #2
# def mystery2(n)
#   if n < 10
#     return n
#   else
#     return (n%10) + mystery2(n/10)
#   end
# end

# - What is mystery2(123)?
# mystery2(123) = 3 + mystery2(12)
# mystery2(12) = 2 + mystery2(1)
# mystery2(1) = 1
# => 3 + 2 + 1 = 6

# - What is mystery2(9005)?
# mystery2(9005) = 5 + mystery2(900)
# mystery2(900) = 0 + mystery2(90)
# mystery2(90) = 0 + mystery2(9)
# mystery2(9) = 9
# => 5 + 0 + 0 + 9 = 14

# - What is mystery2(-123)?
# => -123 (reason: -123 < 10)

# - What is the time complexity of mystery2(n)?
# => O(m) where m is the number of digits of n

# - What is the space complexity of mystery2(n)?
# => O(m) where m is the number of digits of n

# - Added Fun: How could we make `mystery2(-123)` work the way we might expect it to work instead of the way it does?_
# => Take the absolute value of the number we enter, i.e. take out the negative sign

# Trace #3

# def mystery3(n)
#   if n == 0
#     return 100
#   elsif n == -1
#     return 200
#   end
#   if n%2 == 0
#     return mystery3(n/2)
#   else
#     return mystery3(n-1)
#   end
# end

# - What is mystery3(1)?
# mystery3(1) = mystery3(1-1) = mystery3(0)
# mystery3(0) = 100
# => 100

# - What is mystery3(13)?
# mystery3(13) = mystery3(12)
# mystery3(12) = mystery3(6)
# mystery3(6) = mystery3(3)
# mystery3(3) = mystery3(2)
# mystery3(2) = mystery3(1)
# mystery3(1) = mystery3(0)
# mystery3(0) = 100
# => 100

# - What is mystery3(-6)?
# mystery3(-6) = mystery3(-3) = 200
# mystery3(-3) = mystery3(-4) = 200
# mystery3(-4) = mystery3(-2) = 200
# mystery3(-2) = mystery3(-1) = 200
# mystery3(-1) = 200
# => 200

# - What is the time complexity of mystery3(n)?
# O(|n/2|) ; I'm still confused as to why because without help, I would have said O(n)

# - What is the space complexity of mystery3(n)?
# O(|n/2|); I'm still confused as to why because without help, I would have said O(n)

# Trace #4
# def mystery4(b, e)
#   if e == 0
#     return 1
#   else
#     return b * mystery4(b, e-1)
#   end
# end

# - What is mystery4(10, 2)?
# mystery4(10, 2) = 10 * mystery4(10, 1)
# mystery4(10, 1) = 10 * mystery4(10, 0)
# mystery4(10, 0) = 1
# => 1 * 10 * 10 = 100

# - What is mystery4(4, 3)?
# mystery4(4, 3) = 4 * mystery4(4, 2)
# mystery4(4, 2) = 4 * mystery4(4, 1)
# mystery4(4, 1) = 4 * mystery4(4, 0)
# mystery4(4, 0) = 1
# => 1 * 4 * 4 = 64

# - What is mystery4(5, 0)?
# mystery4(5,0) = 1
# => 1

# - What is the time complexity of mystery4(b, e)?
# O(e) where e is the value of the second parameter
# - What is the space complexity of mystery4(b, e)?
# O(e) where e is the value of the second parameter

# Trace #5

# def mystery5(s)
#   if s.length == 0
#     return ""
#   else
#     return "*" + mystery5(s[1..-1])
#   end
# end

# - What is mystery5("hi")?
# mystery5("hi") = * + mystery5("i")
# mystery5("i") = * + mystery5("")
# mystery5("") = ""
# => **

# - What is mystery5("")?
# mystery5("") = ""
# => empty string

# - What is mystery5("Hi, there!")?
# mystery5("Hi, there!") = * + mystery5("i, there!")
# mystery5("i, there!") = * + mystery5(", there!")
# mystery5(", there!") = * + mystery5(" there!")
# mystery5(" there!") = * + mystery5("there!")
# mystery5("there!") = * + mystery5("here!")
# mystery5("here!") = * + mystery5("ere!")
# mystery5("ere!") = * + mystery5("re!")
# mystery5("re!") = * + mystery5("e!")
# mystery5("e!") = * + mystery5("!")
# mystery5("!") = * + mystery5("")
# mystery5("") = ""
# => **********

# - What is the time complexity of mystery5(s)?
# O(n) where n is the length of the string, one step per character in the string

# - What is the space complexity of mystery5(s)?
# O(n) where n is the length of the string, one step in the stack frame for each recursion

# Trace #6                                                                                                            ```ruby
# def mystery6(s)
#   if s == nil || s.length == 0
#     return ""
#   else
#     space = 0
#     until space >= s.length || s[space] == " "
#       space += 1
#     end
#     return mystery6(s[(space+1)..-1]) + " " + s[0...space]
#   end
# end

# - Added Fun: How could we make the reversal happen by letter, instead of by word (i.e. Make it so that mystery6("goodnight moon") returned "noom thgindoog")?_
# We could iterate through the string s so that it returns one character at a time (the last one of the string) + the method called on the rest of the string

# THIS IS LIKE THE PALINDROME CHECKING METHOD
# Trace #7

# def mystery7(word)
#   if word.length < 2
#     return true
#   elsif word[0] != word[-1]
#     return false
#   else
#     return mystery7(word[1..-2])
#   end
# end

# - What is mystery7("cupcake")?
# mystery7("cupcake") = false
# => false

# - What is mystery7("detected")?
# mystery7("detected") = mystery7("etecte")
# mystery7("etecte") = mystery7("tect")
# mystery7("tect") = mystery7("ec")
# mystery7("ec") = false
# => false

# - What is mystery7("eye")?
# mystery7("eye") = mystery7("y")
# mystery7("y") = true
# => true

# - What is the time complexity of mystery7(word)?
# O(n) where n is the length of the word, we are doing 1/2 n steps but constants don't count

# - What is the space complexity of mystery7(word)?
# O(n) where n is the length of the word, same but for stack frames

