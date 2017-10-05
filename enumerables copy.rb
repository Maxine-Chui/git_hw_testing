class Array

  def my_each(&block)
    i= 0
    while i < self.length
      block.call(self[i])
    i+= 1
    end
    self
  end

  def my_select(&prc)
    result = []
    self.my_each do |el|
      if prc.call(el) == true
        result << el
      end
    end
    result
  end

  def my_reject(&prc)
    result = []
    self.my_each do |el|
      if prc.call(el) == false
        result << el
      end
    end
    result
  end

  def my_any?(&block)
    arr= self.my_select do |el|
      block.call(el)
    end
    return true if arr.length > 0
    false
  end

  def my_all?(&block)
    arr= self.my_select do |el|
      block.call(el)
    end
    return true if arr.length == self.length
    false
  end

  def my_flatten
    result = []
    self.my_each do |el|
      if el.class == Array
        result.concat(el.my_flatten)
      else
        result << el
      end

    end
    result
  end

  def my_zip(*args)
    result=[]
    # self.length.times do |i|
    #   args.my_each do |arg|
    #     zip << self[i]
    #     zip << arg[i]
    #   end
    # end
    self.length.times do |i|
      zip = []
      args.my_each do |arg|
        zip << arg[i]

      end
      result << [self[i], zip].my_flatten
    end
    result
  end


  def my_rotate(space= 1)
    dist = space % self.length
    self[dist..-1] + self[0...dist]
  end

  def my_join( separator= '')
    result=''
    self.each do |el|
      result << el + separator
    end
    # result.delete!(result[-1])  if result[-1] == separator
    return result[0...-1] if result[-1] == separator
    result
  end

  def my_reverse
    arr=[]
    self.my_each do |el|
      arr.unshift(el)
    end
    arr
  end



end
