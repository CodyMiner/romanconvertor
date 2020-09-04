def fromRoman(romanNumber)
	singleLetterValues = {
        "I" => 1,
        "V" => 5,
        "X" => 10,
        "L" => 50,
        "C" => 100,
        "D" => 500,
        "M" => 1000
    }

    pairedLetterValues = {
    	"IV" => 4,
    	"IX" => 9,
    	"XL" => 40,
    	"XC" => 90,
    	"CD" => 400,
    	"CM" => 900
    }

    total = 0

    i = romanNumber.length - 2
    while i >= 0 do
    	pair = romanNumber[i..i+1]
    	if i+1 < romanNumber.length and pairedLetterValues[pair] != nil
    		total += pairedLetterValues[pair]
    		romanNumber = romanNumber.chomp(pair)  
    	end
    	i -= 1
    end

    j = romanNumber.length - 1
    while j >= 0 do
    	if not "IVXLCDM".include? romanNumber[j] 
    		raise TypeError
    	end
    	total += singleLetterValues[romanNumber[j]]
    	j -= 1
    end

    return total
    
end

def toRoman(arabicNumber)
	valueLetters = {
        1 => "I",
        5 => "V",
        10 => "X",
        50 => "L",
        100 => "C",
        500 => "D",
        1000 => "M"
    }

    singleLetters = "IVXLCDM"

    singleLetterValues = {
        "I" => 1,
        "V" => 5,
        "X" => 10,
        "L" => 50,
        "C" => 100,
        "D" => 500,
        "M" => 1000
    }

    if arabicNumber < 1 or arabicNumber > 3999
    	raise RangeError
    end

    output = ""
    i = singleLetters.length - 1
    while i >= 0 do
    	letter = singleLetters[i]
    	value = singleLetterValues[letter]
    	output += letter * (arabicNumber / value)
    	arabicNumber = arabicNumber % value
    	i -= 1
    end
    return output

end


puts toRoman(490)











