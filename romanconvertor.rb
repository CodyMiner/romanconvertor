def fromRoman(romanNumber)
    myRomanNumber = romanNumber.dup

    singleLetterValues = {
        "I" => 1,
        "V" => 5,
        "X" => 10,
        "L" => 50,
        "C" => 100,
        "D" => 500,
        "M" => 1000
    }

    myRomanNumber.sub! "CM", "DCCCC" #these are the only 6 subtraction pairs possible
    myRomanNumber.sub! "CD", "CCCC"
    myRomanNumber.sub! "XC", "LXXXX"
    myRomanNumber.sub! "XL", "XXXX"
    myRomanNumber.sub! "IX", "VIIII"
    myRomanNumber.sub! "IV", "IIII"

    total = 0
    j = myRomanNumber.length - 1
    while j >= 0 do
    	letter = myRomanNumber[j]
    	if not "IVXLCDM".include? letter 
    		raise TypeError
    	end
    	total += singleLetterValues[letter]
    	j -= 1
    end

    return total  
end

def toRoman(arabicNumber)
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

    output.sub! "DCCCC", "CM"
    output.sub! "CCCC",  "CD"
    output.sub! "LXXXX", "XC"
    output.sub! "XXXX",  "XL"
    output.sub! "VIIII", "IX"
    output.sub! "IIII",  "IV"

    return output
end