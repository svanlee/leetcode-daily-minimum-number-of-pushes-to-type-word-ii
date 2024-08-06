// Solution in TS
function minimumPushes(word: string): number {
    let freq: number[] = new Array(26).fill(0);
    for (let c of word.toLowerCase()) {
        freq[c.charCodeAt(0) - 'a'.charCodeAt(0)]++;
    }
    
    freq.sort((a, b) => a - b);
    
    let totalPresses: number = 0;
    let multiplier: number = 1;
    
    for (let i: number = 25; i >= 0; i--) {
        if (freq[i] === 0) break;
        
        if ((25 - i) % 8 === 0 && i !== 25) {
            multiplier++;
        }
        
        totalPresses += freq[i] * multiplier;
    }
    
    return totalPresses;
}