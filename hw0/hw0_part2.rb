# hw0_part2.rb
# Define a method hello(name) that takes a string representing a name
# and returns the string "Hello, " concatenated with the name.
def hello(name)
    return 'Hello, ' + name
end

raise 'hello("world")' unless hello("world") == 'Hello, world'

# Define a method starts_with_consonant?(s) that takes a string and
# returns true if it starts with a consonant and false otherwise.
# (For our purposes, a consonant is any letter other than
# A, E, I, O, U.) NOTE: be sure it works for both upper and
# lower case and for nonletters!
def starts_with_consonant?(s)
    return false if s.empty?
    # all consonants
    # 1. ('a'..'z').to_a = range to array [a, b, c, ... , z]
    # 2. .delete_if = deletes letter from array if vowel
    # 3. .reduce( :+ ) = concats the letters array
    consonants = ('a'..'z').to_a.delete_if { |letter| 'aeiou'.include? letter }.reduce( :+ )
    # Case-insensitive (ends in /i)
    regexp_string = '/^[' + consonants + ']/i'
    regexp = eval( regexp_string )
    return (regexp =~ s) != nil
end

raise 'starts_with_consonant?("abcdef")' unless starts_with_consonant?("abcdef") == false
raise 'starts_with_consonant?("")' unless starts_with_consonant?("") == false
raise 'starts_with_consonant?("zsyzw")' unless starts_with_consonant?("zsyzw") == true

# Define a method binary_multiple_of_4?(s) that takes a string and returns true 
# if the string represents a binary number that is a multiple of 4.
# NOTE: be sure it returns false if the string is not a valid binary number!
def binary_multiple_of_4?(s)
    return false if s.empty?
    return false if !( /^[01]*$/ =~ s )
    return (Integer('0b' + s) % 4) == 0
end

raise 'binary_multiple_of_4?("")' unless binary_multiple_of_4?("") == false
raise 'binary_multiple_of_4?("asfghsdfh")' unless binary_multiple_of_4?("asfghsdfh") == false
raise 'binary_multiple_of_4?("0101010aaa010")' unless binary_multiple_of_4?("0101010aaa010") == false
raise 'binary_multiple_of_4?("111")' unless binary_multiple_of_4?("111") == false
raise 'binary_multiple_of_4?("100")' unless binary_multiple_of_4?("100") == true
