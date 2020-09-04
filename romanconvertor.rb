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

    total = 0

    i = romanNumber.length
    while i > 0 do
    	if not "IVXLCDM".include? romanNumber[i-1] 
    		raise TypeError
    	end
    	total += singleLetterValues[romanNumber[i-1]]
    	i -= 1
    end

    return total
    
end

def toRoman(arabicNumber)
    if arabicNumber < 1 or arabicNumber > 3999
    	raise RangeError
    end
end