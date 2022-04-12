def caesar_cipher(string, shift)
  string_ascii = string.bytes

  if shift.positive?
    shift = shift % 26
  else
    shift = shift % -26
  end

  string_ascii_new = string_ascii.map do |int|
    case int.is_a?(Integer)
    when int.between?(65, 90)
     if (int + shift) < 65
      int = 91 + (int - 65) + shift
     elsif (int + shift) > 90
      int = 65 + (int - 91) + shift
     else
      int = int + shift
     end
    when int.between?(97, 122)
      if (int + shift) < 97
        int = 123 + (int - 97) + shift
      elsif (int + shift) > 122
        int = 97 + (int - 123) + shift
      else
        int = int + shift
      end
    else
      int = int
    end
  end

  string_chr = string_ascii_new.map { |int| int.chr }
  
  return string_chr.join("")
end