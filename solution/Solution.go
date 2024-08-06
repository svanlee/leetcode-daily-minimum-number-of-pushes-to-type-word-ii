// Solution in GO
func minimumPushes(word string) int {
    freq := make([]int, 26)
    for _, c := range word {
        freq[c-'a']++
    }
    
    sort.Ints(freq)
    
    totalPresses := 0
    multiplier := 1
    
    for i := 25; i >= 0; i-- {
        if freq[i] == 0 {
            break
        }
        
        if (25 - i) % 8 == 0 && i != 25 {
            multiplier++
        }
        
        totalPresses += freq[i] * multiplier
    }
    
    return totalPresses
}