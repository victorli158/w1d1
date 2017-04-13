class Array

  def my_each(&prc)
    counter = 0
    while counter <= self.length - 1
      prc.call(self[counter])
      counter += 1
    end
    self
  end

  def my_select(&prc)
    new_array = []
    self.my_each do |el|
      new_array << el if prc.call(el)
    end
    new_array
  end

  def my_reject(&prc)
    new_array = []
    self.my_each do |el|
      new_array << el if !prc.call(el)
    end
    new_array
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false if !prc.call(el)
    end
    true
  end

  def my_flatten
    new_array = []
    return new_array if new_array.all? { |el| el.class == Fixnum } && !new_array.empty?
    self.each do |el|
      if el.class == Fixnum
        new_array << el
      elsif el.class == Array
        new_array += el.my_flatten
      end
    end
    new_array
  end

  def my_zip(*args)
    new_array = []
    each_index do |idx|
      current_array = [self[idx]]
      args.each do |el|
        current_array << el[idx]
      end
      new_array << current_array
    end
    new_array
  end

  def my_rotate(rotations = 1)
    rotations %= self.length
    if rotations > 0
      rotated = shift(rotations)
      rotated.each { |el| self.push(el) }
      return self
    else
      rotated = pop(-rotations)
      rotated.reverse.each { |el| self.unshift(el) }
      return self
    end
  end

  def my_join(join = "")
    string = ""
    each.with_index do |el, i|
      string << el
      string << join unless i == self.length - 1
    end
    string
  end

  def my_reverse
    new_array = []
    self.length.times { |el| new_array << pop }
    new_array
  end
end

def factors(num)
  counter = 0
  factors = []
  until counter > num
    counter += 1
    factors << counter if num % counter == 0
  end
  factors


def bubble_sort!(&prc)


end

end
