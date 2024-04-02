import Curses

public class NLP {
    
    var filteredTokens : [String] = []
    
    var lemmatizedTokens : [String] = []

    // Stems the array to remove any stopwords and suffixes
    func stemming(stringArray: [String]) -> [String] {
        
        for word in stringArray {
            var newWord = word.lowercased()
            
            if !(SetOfArrays().getStopwords().contains(newWord)) {
                if newWord.length > 5 && (newWord.suffix(3) == "ing" || newWord.suffix(3) == "ion") {
                    newWord = String(newWord.prefix(newWord.length - 3))
                } else if newWord.length > 2 && newWord.suffix(2) == "ed" {
                    newWord = String(newWord.prefix(newWord.length - 2))
                }
                filteredTokens.append(newWord)
            }
        }
        return filteredTokens
    }
    
    // Lemmatizes the array to get the root meaning of the words
    func lemmatization(stringArray: [String]) -> [String] {
        
        for word in stringArray {
            var newWord = word
            
            for i in 0 ... SetOfArrays().getLemmaMatrix().count - 1 {
                if SetOfArrays().getLemmaMatrix()[i].contains(newWord) {
                    newWord = SetOfArrays().getLemmaMatrix()[i][0]
                }   
            }
            lemmatizedTokens.append(newWord)
        }
        return lemmatizedTokens
    }
}
