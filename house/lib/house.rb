class House

  def recite
    1.upto(segments.length).map {|i| line(i)}.join("\n")
  end

  def random_recite
    1.upto(random_segments.length).map {|i| random_line(i)}.join("\n")
  end

  def line(num)
    "This is %s%s.\n" % [segments_minus_one.last(num-1).join, segments.last(1).join(" ")]
  end
  
  def random_line(num)
    "This is %s %s.\n" % [randomize_segments(num), segments.last(1).join(" ")]
  end

  private

  def randomize_segments(num)
    shuffled_array(0, num-2).map {|i| segments[i]}.join(" ")
  end

  def shuffled_array(lower_bound, upper_bound)
    lower_bound.upto(upper_bound).map {|i| i}.shuffle
  end

  def segments_minus_one
    [ "the horse and the hound and the horn that belonged to ",
      "the farmer sowing his corn that kept ",
      "the rooster that crowed in the morn that woke ",
      "the priest all shaven and shorn that married ",
      "the man all tattered and torn that kissed ",
      "the maiden all forlorn that milked ",
      "the cow with the crumpled horn that tossed ",
      "the dog that worried ",
      "the cat that killed ",
      "the rat that ate ", 
      "the malt that lay in "]
  end

  def segments
    [ "the horse and the hound and the horn that belonged to",
      "the farmer sowing his corn that kept",
      "the rooster that crowed in the morn that woke",
      "the priest all shaven and shorn that married",
      "the man all tattered and torn that kissed",
      "the maiden all forlorn that milked",
      "the cow with the crumpled horn that tossed",
      "the dog that worried",
      "the cat that killed",
      "the rat that ate", 
      "the malt that lay in", 
      "the house that Jack built"]
  end

  def random_segments
    [ "the horse and the hound and the horn that belonged to",
      "the farmer sowing his corn that kept",
      "the rooster that crowed in the morn that woke",
      "the priest all shaven and shorn that married",
      "the man all tattered and torn that kissed",
      "the maiden all forlorn that milked",
      "the cow with the crumpled horn that tossed",
      "the dog that worried",
      "the cat that killed",
      "the rat that ate", 
      "the malt that lay in"]
  end
end