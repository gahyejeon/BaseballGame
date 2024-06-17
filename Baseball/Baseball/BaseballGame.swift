//
//  BaseballGame.swift
//  Baseball
//
//  Created by 내꺼다 on 6/17/24.
//

import Foundation

struct BaseballGame {
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수
        print("Game Start! 1에서 9까지 서로 다른 임의의 수 3개를 맞춰보세요!")
        // 정답이 될 때까지 반복되는 구문 만들기
        
        var isCorrectAnswer = false   //초기상태는 정답을 맞추지 못한 상태인 것을 나타내줌
        
        while !isCorrectAnswer {
            if let userInput = checkInput() {
                if userInput == answer {
                    isCorrectAnswer = true
                    print("정답입니다: \(answer)")
                } else {
                    print("틀렸습니다.")
                }
            } else {
                print("잘못된 입력입니다. 올바르게 입력해주세요(1에서 9까지의 서로 다른 임의의 수 3개를 입력하세요")
            }
        }
    }
    
    func makeAnswer() -> [Int] {
        var numbers = Array(1...9)  // 함수 내부를 구현하기
        numbers.shuffle()    // 랜덤 숫자 설정
        return Array(numbers.prefix(3))   // 랜덤 숫자 3개 반환
    }
    

// 유저가 3자리 숫자를 제대로 입력했는지 확인하는 함수 작성, 서로 다른 숫자가 맞는지 숫자가 1-9까지 범위인지
    func checkInput() -> [Int]? {
        print("3자리 숫자를 입력해주세요: ", terminator: "") // terminator에 빈 문자열 전달
        if let input = readLine() {    // readLine 사용 입력을 문자열로 받음
            let numbers = input.compactMap { $0.wholeNumberValue }
            if numbers.count == 3 && Set(numbers).count == 3 && numbers.allSatisfy({ (1...9).contains($0) }) {   // 3자리로 입력되었는지, 서로 다른 숫자인지, 1-9 범위 안에 있는 숫자인지 확인. 전부 true 여야 함
                return numbers
            }
        }
        return nil  // 유효하지 않은 입력일 경우 nil 반환
    }
}


// 돌아가긴 하는데 내가 정답을 알수가없어서 계속 정답이 안나온다..
/*
 compactMap 함수 사용
 wholeNumberValue는 Character형식의 속성 해당 문자가 0부터 9까지 유효한 숫자인 경우에만 해당 숫자 반환
 Set(numbers).count == 3 이 부분으로 배열 numbers에 중복된 숫자가 없는지 확인 중복된 수 있으면 count 3 이 안됨.
 { (1...9).contains($0) } 클로저를 이용하여 각 요소($0)가 숫자범위에 있는지 확인
 */


