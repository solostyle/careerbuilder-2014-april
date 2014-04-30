class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map {|i| verse(i)}.join("\n")
  end

  def verse(num)
    Verse.new(num).to_s
  end
end

class Verse
  attr_reader :num, :starting_bottle_number, :ending_bottle_number

  def initialize(num)
    @starting_bottle_number = get_bottle_number(num)

    if num < 1
      @ending_bottle_number = get_bottle_number(99)
    else
      @ending_bottle_number = get_bottle_number(num-1)
    end
  end

  def get_bottle_number(num)
    case true
    when num == 6
      Object.const_get("BottlishNumberSix")
    when num == 0
      Object.const_get("BottlishNumberZero")
    when num == 1
      Object.const_get("BottlishNumberOne")
    else
      Object.const_get("BottlishNumber")
    end.new(num)
  end

  def to_s
    "#{starting_bottle_number.quantity.capitalize} #{starting_bottle_number.name} of beer on the wall, " +
    "#{starting_bottle_number.quantity} #{starting_bottle_number.name} of beer.\n" +
    "#{starting_bottle_number.action}, " +
    "#{ending_bottle_number.quantity} #{ending_bottle_number.name} of beer on the wall.\n"
  end
end

class BottlishNumber
  attr_reader :bottle_number

  def initialize(number)
    @bottle_number = number
  end

  def quantity
    bottle_number.to_s
  end

  def name
    'bottles'
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    'one'
  end
end

class BottlishNumberZero < BottlishNumber
  def action
    "Go to the store and buy some more"
  end

  def quantity
    "no more"
  end
end

class BottlishNumberOne < BottlishNumber
  def name
    'bottle'
  end

  def pronoun
    'it'
  end
end

class BottlishNumberSix < BottlishNumber
  def name
    if bottle_number == 6
      'six pack'
    else
      'six packs'
    end
  end

  def quantity
    (bottle_number / 6).to_s
  end
end