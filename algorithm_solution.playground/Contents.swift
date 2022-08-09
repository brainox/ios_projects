import UIKit

func findJudge(_ N: Int, _ trust: [[Int]]) -> Int? {
    guard N > 0 else { return 0 }
    guard trust.count > 0, trust[0].count > 0 else { return 1 }

    // who trust me?
    var trustIn = Array(repeating: 0, count: N)
    // I trust who?
    var trustOut = Array(repeating: 0, count: N)

    for a in trust {
        guard let tin = a.first, let tout = a.last else { return -1 }
        trustIn[tout-1] += 1
        trustOut[tin-1] += 1
    }

    var judgeIndex = -1

    for i in 0..<trustIn.count {
        // When N-1 trust me, and I trust no one,
        // I am the Judge.
        if trustOut[i] == 0 && trustIn[i] == N - 1 {
            judgeIndex = i+1
        }
    }
    //if judgeIndex is -1, no Judge at all.
    //otherwise, return judgeIndex
    return judgeIndex
}

findJudge(2, [[1,2]])




func reverseOnlyLetters(_ s: String) -> String {
    var s = Array(s)
    var ans: [Character] = []
    
    var j = ans.count - 1
    for (index, value) in s.enumerated() {
        if value.isLetter {
            while !(s[j].isLetter ){
                j -= 1
            }
            ans.append(s[j])
            j -= 1
        } else {
            ans.append(value)
        }
    }
    var result = ans.map {
        String($0)
    }
    print(result.joined(separator: ""))
    return result.joined(separator: "")
    }

reverseOnlyLetters("ab-cd")
