// Solution in JS
/**
 * @param {string} word
 * @return {number}
 */
var minimumPushes = function(word) {
    let freq = new Array(26).fill(0);
    for (let c of word.toLowerCase()) {
        freq[c.charCodeAt(0) - 'a'.charCodeAt(0)]++;
    }
    
    freq.sort((a, b) => a - b);
    
    let totalPresses = 0;
    let multiplier = 1;
    
    for (let i = 25; i >= 0; i--) {
        if (freq[i] === 0) break;
        
        if ((25 - i) % 8 === 0 && i !== 25) {
            multiplier++;
        }
        
        totalPresses += freq[i] * multiplier;
    }
    
    return totalPresses;
};