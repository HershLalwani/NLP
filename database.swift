public class SetOfArrays {

    private var stopwordsArray = ["i", "me", "my", "myself", "we", "our", "ours", "ourselves", "you", "your", "yours", "yourself", "yourselves", "he", "him", "his", "himself", "she", "her", "hers", "herself", "it", "its", "itself", "they", "them", "their", "theirs", "themselves", "what", "which", "who", "whom", "this", "that", "these", "those", "am", "is", "are", "was", "were", "be", "been", "being", "have", "has", "had", "having", "do", "does", "did", "doing", "a", "an", "the", "and", "but", "if", "or", "because", "as", "until", "while", "of", "at", "by", "for", "with", "about", "against", "between", "into", "through", "during", "before", "after", "above", "below", "to", "from", "up", "down", "in", "out", "on", "off", "over", "under", "again", "further", "then", "once", "here", "there", "when", "where", "why", "how", "all", "any", "both", "each", "few", "more", "most", "other", "some", "such", "only", "own", "same", "so", "than", "too", "very", "can", "will", "just", "should", "now", "want", ".", ","]
    
    private var lemmaMatrix = [["go", "move", "went", "gone", "step", "walk", "chose"],
                               ["axe", "axe", "axr", "aze", "ace", "weapon"],
                               ["gun", "gin", "rifle", "shotgun"],
                               ["take", "grab", "snatch", "yoink", "yes", "yeah", "yep"],
                               ["no", "don't", "dont", "nope", "nay", "nah"],
                               ["fight", "shoot", "use", "swing"]]
    
    func getStopwords() -> [String] {
        return stopwordsArray
    }
    
    func getLemmaMatrix() -> [[String]] {
        return lemmaMatrix
    }
    
    func getGoArray() -> [String] {
        return lemmaMatrix[0]
    }

    func getSwordArray() -> [String] {
        return lemmaMatrix[1]
    }
    
    func getGunArray() -> [String] {
        return lemmaMatrix[2]
    }    
}
