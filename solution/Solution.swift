class Solution {
    func minimumPushes(_ word: String) -> Int {
        var freq: [Int] = Array(repeating: 0, count: 26)
        for c in word.lowercased() {
            freq[Int(c.unicodeScalars.first!.value) - 97] += 1
        }
        
        freq.sort()
        
        var totalPresses: Int = 0
        var multiplier: Int = 1
        
        for i in stride(from: 25, through: 0, by: -1) {
            if freq[i] == 0 { break }
            
            if (25 - i) % 8 == 0 && i != 25 {
                multiplier += 1
            }
            
            totalPresses += freq[i] * multiplier
        }
        
        return totalPresses
    }
}