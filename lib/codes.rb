module Codes

  def easy_code
    code_array = []
    4.times { code_array << rand(1..4) }
    code_array = code_array.join.gsub("1", "r").gsub("2", "g").gsub("3", "b")
    code_array.gsub("4", "y")
  end

  def medium_code
    code_array = []
    6.times { code_array << rand(1..5) }
    code_array = code_array.join.gsub("1", "r").gsub("2", "g").gsub("3", "b")
    code_array.gsub("4", "y").gsub("5", "o")
  end

  def hard_code
    code_array = []
    8.times { code_array << rand(1..6) }
    code_array = code_array.join.gsub("1", "r").gsub("2", "g").gsub("3", "b")
    code_array.gsub("4", "y").gsub("5", "o").gsub("6", "p")
  end
end
