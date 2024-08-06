// Solution in CPP
#include <execution> // Include the <execution> header for parallel execution policies

// Disable synchronization of C++ streams with C streams and untie cin from cout
auto f = []
{
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);
    return 0;
}();

class Solution
{
public:
    int minimumPushes(string word)
    {
        // Create an array to store the frequency of each character
        array<int, 26> f{};

        // Count the frequency of each character in the word
        for (char c : word)
        {
            f[c - 'a']++;
        }

        // Sort the frequencies in descending order using parallel execution
        sort(execution::par_unseq, f.begin(), f.end(), greater{});

        // Calculate the total pushes using parallel execution and a lambda function
        return transform_reduce(execution::par_unseq, f.begin(), f.end(), 0, plus{}, [f = &f[0]](int const &x)
                                { 
            // Calculate the index of the current frequency
            int i = &x - f;
            // Return the product of the frequency and the push count
            return x * (i / 8 + 1); });
    }
};