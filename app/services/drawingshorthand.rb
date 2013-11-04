class Drawingshorthand

  def self.decrypt(string)
    if string.include?(",") && string.include?("-")
      new.split_hyphen_and_comma(string)
    elsif string.include? ","
      new.split_comma(string)
    elsif string.include? "-"
      new.split_hyphen(string)
    else
      [string]
    end
  end

  # private

  def split_comma(string)
    string.split(",").map{|n| n.gsub(/\s+/, "")}
  end

  def split_hyphen(string)
    list = string.split("-")
    (list[0].to_i..list[1].to_i).to_a.map{ |n| n.to_s }
  end

  def split_hyphen_and_comma(string)
    array = []
    final = []

    string = string.gsub(/\s+/, "")
    array << string.scan(/\d+-\d+/)
    array << string.scan(/\d+(?=,)/)
    array << string.scan(/(?<=,)\d+/)

    array.flatten.uniq.sort.each do |str|
      if str.include? ","
        final << split_comma(str)
      elsif str.include? "-"
        final << split_hyphen(str)
      else
        final << str
      end
    end
    final.flatten.uniq.sort{ |x,y| x.to_i <=> y.to_i }
  end
end
