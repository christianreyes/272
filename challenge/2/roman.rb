#!/usr/bin/env ruby

class Integer
    def to_roman
        if(self >0 and self < 4000)
            digits = self.to_s.split(//).reverse!
            out = String.new
            numerals = %w(I V X L C D M) 

            digits.each_with_index do |digit, index|
                digit = digit.to_i
                if digit < 4
                    digit.times do out = out + numerals[ index * 2 ] end
                elsif digit == 4
                    out = out + numerals[ index * 2 + 1]
                    out = out + numerals[ index * 2 ]
                elsif digit == 5
                    out = out + numerals[ index * 2 + 1 ]
                elsif digit > 5 and digit < 9
                    (digit-5).times do out = out + numerals[ index * 2 ] end
                    out = out + numerals[ index * 2 + 1]
                else
                    out = out + numerals[ index * 2 + 2 ]
                    out = out + numerals[ index * 2 ]
                end
            end

            return out.reverse
         else
            return nil
         end
   end

end

class String
    def from_roman
        num_REG = /^(M{0,4})?(CD|CM|D?C{0,3})?(XL|XC|L?X{0,3})?(IV|IX|V?I{0,3})?$/
        place_values =  num_REG.match(self)
        if(place_values)
            place_values = place_values.captures
        else
            return nil;
        end

        numbers =  {:I=>1, :V=>5, :X=>10, :L=>50,
                    :C=>100, :D=>500, :M=>1000}

        total = 0

        place_values.reverse!.each do |group|    
            pv_total = 0
            group.split(//).each do |numeral|
               val = numbers[numeral.to_sym]
               if(pv_total != 0 and val > pv_total)
                   pv_total = val - pv_total
               else
                   pv_total += val
               end
            end
            total += pv_total
        end

        return total
    end
end
