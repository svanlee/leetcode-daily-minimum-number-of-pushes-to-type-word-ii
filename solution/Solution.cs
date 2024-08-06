// Solution in CS
public class Solution
{
    public int MinimumPushes(string word)
    {
        // Create an array to store the frequency of each letter
        int[] freq = new int[26];

        // Count the frequency of each letter in the word (convert to lowercase to ignore case)
        foreach (char c in word.ToLower())
        {
            freq[c - 'a']++;
        }

        // Sort the frequencies in ascending order
        Array.Sort(freq);

        // Initialize variables to keep track of the total presses and the current multiplier
        int totalPresses = 0;
        int multiplier = 1;

        // Assign letters to keys, starting from the most frequent
        for (int i = 25; i >= 0; i--)
        {
            // If the frequency is 0, break the loop
            if (freq[i] == 0) break;

            // If we've reached a new key, increment the multiplier
            if ((25 - i) % 8 == 0 && i != 25)
            {
                multiplier++;
            }

            // Calculate the total presses for the current letter
            totalPresses += freq[i] * multiplier;
        }

        // Return the total number of key presses
        return totalPresses;
    }
}