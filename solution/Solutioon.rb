def minimum_pushes(word)
    # Create an array to store the frequency of each letter
    freq = Array.new(26, 0)
    
    # Count the frequency of each letter in the word
    word.downcase.each_char { |c| freq[c.ord - 97] += 1 }
    
    # Sort the frequencies in ascending order
    freq.sort!
    
    # Initialize the total number of key presses
    total_presses = 0
    
    # Initialize the multiplier for the key presses
    multiplier = 1
    
    # Iterate over the frequencies in reverse order
    (25).downto(0) do |i|
        # If the frequency is 0, break the loop
        if freq[i] == 0
            break
        end
        
        # If the key position is a multiple of 8 (i.e., a new key row), increment the multiplier
        if (25 - i) % 8 == 0 && i != 25
            multiplier += 1
        end
        
        # Calculate the total number of key presses for the current letter
        total_presses += freq[i] * multiplier
    end
    
    # Return the total number of key presses
    total_presses
end