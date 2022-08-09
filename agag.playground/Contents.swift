import UIKit
//
//
//func generateParenthesis(_ n: Int) -> [String] {
//    var ans: [String] = []
//    func backtrack(_ s: [String] = [], _ left: Int = 0, _ right: Int = 0) {
//        var s = s
//        var left = left
//        var right = right
//        if (s.count == 2*n) {
//            ans.append(s.joined(separator: ""))
//            return
//        }
//        if (left < n) {
//            s.append("(")
//            backtrack(s, left+1, right)
//            s.popLast()
//        }
//        if (right < left) {
//            s.append(")")
//            backtrack(s, left, right+1)
//            s.popLast()
//        }
//
//    }
//    backtrack()
//    print(ans)
//    return ans
//
//}
//
//generateParenthesis(3)
//
//
////public int twoSumLessThanK(int[] A, int K) {
////        // Sort the array first
////        Arrays.sort(A);
////
////        // Put pointers at begin/end and shrink
////        int l = 0, r = A.length - 1;
////        int ans = -1;
////        while(l < r) {
////            if(A[l] + A[r] < K) {
////                ans = Math.max(ans, A[l] + A[r]);
////                l++;
////            } else {
////                r--;
////            }
////        }
////
////        return ans;
////    }
//
////def twoSumLessThanK(self, A, K):
////      ans = -1
////      if len(A)==1:
////         return -1
////      for i in range(len(A)):
////         for j in range(i+1,len(A)):
////            temp = A[i]+ A[j]
////            if temp<K:
////               ans = max(ans,temp)
////      return ans
//
//
////func bruteForceTwoSum(array: [Int], sum: Int) -> Bool {
////
////    for i in 0..<array.count {
////// Iterates through every object in the array; iterating over an array means accessing each element of array one by one.
////        for j in 0..<array.count where j != i {
//////the not statement(!) is to exlude the value of the current location from the number youre comparing
////            if array[j] + array[i] == sum {
////                print("True: \(array[i]) + \(array[j])")
////                return true
////            } else {
////                print("False: \(array[i]) + \(array[j])")
////            }
////        }
////    }
////
////    return false
////}
//
//
//
//func twoSumLessThanK(_ A: [Int], _ K: Int) -> Int {
//    var a = A
//    a.sort()
//    var ans = -1
//    var maxAns: [Int] =  []
//
//
//    for i in 0..<a.count {
//        for j in 0..<a.count where j != i {
//            if a[j] + a[i] <= K {
//                ans = a[j] + a[i]
//                maxAns.append(ans)
//            }
//        }
//    }
//
//
////    var l = 0
////    var r = a.count - 1
////    var ans = -1
////
////    for i in a {
////        for j in (i+1..<a.count){
////            var temp = a[i] + a[j]
////            if temp < K{
////                ans = max(ans, temp)
////            }
////        }
////    }
////
////
////    print(ans)
//    let final = maxAns.max() ?? -1
//    return final
//}
//
//twoSumLessThanK([34,24,1,24,75,33,54,8], 60)
//twoSumLessThanK([10,20,30], 15)
//
//
//
//

//func rotate(array: [Int], k: Int) {
//    var array = array
//    // Check for edge cases
//    if k == 0 || array.count <= 1 {
//        return // The resulting array is similar to the input array
//    }
//
//    // Calculate the effective number of rotations
//    // -> "k % length" removes the abs(k) > n edge case
//    // -> "(length + k % length)" deals with the k < 0 edge case
//    // -> if k > 0 the final "% length" removes the k > n edge case
//    let length = array.count
//    let rotations = (length + k % length) % length
//
//    // 1. Reverse the whole array
//    let reversed: Array = array.reversed()
//
//    // 2. Reverse first k numbers
//    let leftPart: Array = reversed[0..<rotations].reversed()
//
//    // 3. Reverse last n-k numbers
//    let rightPart: Array = reversed[rotations..<length].reversed()
//
//    array = leftPart + rightPart
//    print(array)
//}
//rotate(array: [1,2,3,4,5,6,7], k: 3)

//
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
//
//findJudge(2, [[1,2]])
//let y = [15, 2, 67, 4, 5]
//let sum = y.filter({ $0 < 10}).map({$0 * 2}).reduce(5, +)
//print(sum)


//def reverseOnlyLetters(self, S):
//        ans = []
//        j = len(ans) - 1
//        for i, x in enumerate(S):
//            if x.isalpha():
//                while not S[j].isalpha():
//                    j -= 1
//                ans.append(S[j])
//                j -= 1
//            else:
//                ans.append(x)
//
//        return "".join(ans)
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
