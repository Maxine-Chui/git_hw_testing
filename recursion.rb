require 'byebug'


def range(start_num, end_num)
  return [] if end_num < start_num
  return [start_num] if end_num - start_num == 1
  result = [start_num]
  result + range(start_num + 1, end_num)
end

def iterative_range(start_num, end_num)
  return [] if end_num < start_num
  result = []
  (start_num...end_num).each do |num|
    result << num
  end
  result
end

def exponent(base, power)
  return 1 if power == 0
  return base if power == 1
  base * exponent(base, power - 1)
end

def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    exp2(b, n / 2) * exp2(b, n / 2)
  else
    b * exp2(b, (n - 1) / 2) * exp2(b, (n - 1) / 2)
  end
end

class Array
  def deep_dup

    arr_copy = []

    self.each do |el|
      if el.is_a?(Array)
        arr_copy << el.deep_dup
      else
        arr_copy << el
      end
    end
    arr_copy
  end
end

def fibonacci(num)
  return [1] if num == 1
  return [1,1] if num == 2
  result = fibonacci(num - 1)
  result << result[-2] + result[-1]
  result
end

def subset(arr)
  return [arr] if arr.empty?
  return [[], arr] if arr.length == 1
  result = subset(arr[0...-1])

  result.length.times do |i|
    result[i] << arr.last
  end
  subset(arr[0...-1]) + result
end

def permutation(arr)
  return [arr] if arr.length <= 1
  permutations = permutation(arr[0...-1])
  result = []
  permutations.each do |perm|
    partial_result = []
    (0..perm.length).each do |idx|
      partial_result = perm[0...idx] + [arr.last] + perm[idx..-1]
      result << partial_result
    end
  end
  result

end
