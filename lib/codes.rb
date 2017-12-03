module Codes

  def easy_code
    x = []
    4.times { x << rand(1..4) }
    x = x.join.gsub("1", "r").gsub("2", "g").gsub("3", "b").gsub("4", "y")
  end

  def medium_code
    x = []
    6.times { x << rand(1..5) }
    x = x.join.gsub("1", "r").gsub("2", "g").gsub("3", "b").gsub("4", "y")
    x.gsub("5", "o")
  end

  def hard_code
    x = []
    8.times { x << rand(1..6) }
    x = x.join.gsub("1", "r").gsub("2", "g").gsub("3", "b").gsub("4", "y")
    x.gsub("5", "o").gsub("6", "p")
  end
end
