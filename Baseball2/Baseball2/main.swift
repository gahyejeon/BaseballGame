//
//  main.swift
//  Baseball2
//
//  Created by 내꺼다 on 6/14/24.
//

import Foundation

let game = BaseballGame()
game.start() // BaseballGame 인스턴스를 만들고 start 함수를 구현하기


// BaseballGame.swift 파일 생성
struct BaseballGame {
    func start() {
        let answer = makeAnswer() // 정답을 만드는 함수
        print("Game Start! 1에서 9까지 서로 다른 임의의 수 3개를 맞춰보세요!")
        // 정답이 될 때까지 반복되는 구문 만들기
        var isCorrectAnswer = false    // 초기상태는 정답을 맞추지 못한 상태인 것을 나타내줌
        
        while !isCorrectAnswer {
            if let userInput = checkInput() {
                let result = confirmNumbers(answer: answer, userInput: userInput)
                
                if result.strike == 0 && result.ball == 0 {
                    print("Nothing")
                } else {
                    print("\(result.strike)스트라이크 \(result.ball)볼")
                }
                
                if result.strike == 3 {
                    isCorrectAnswer = true
                    print("정답입니다!")
                } else {
                    print("Nothing")
                }
            } else {
                print("올바르지 않은 입력값 입니다.")
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
        print("3자리 숫자를 입력해주세요: ", terminator: "")
        if let input = readLine() {    // readLine 사용 입력을 문자열로 받음
            let numbers = input.compactMap { $0.wholeNumberValue }
            if numbers.count == 3 && Set(numbers).count == 3 && numbers.allSatisfy({ (1...9).contains($0) }) {   // 3자리로 입력되었는지, 서로 다른 숫자인지, 1-9 범위 안에 있는 숫자인지 확인. 전부 true 여야 함
                return numbers
            }
        }
        return nil  // 유효하지 않은 입력일 경우 nil 반환
    }
    
    // strike, ball 설정
    func confirmNumbers(answer: [Int], userInput: [Int]) -> (strike: Int, ball: Int ) {
        var strike = 0
        var ball = 0
        
        for (index, num) in userInput.enumerated() {    // for-in루프 사용하여 숫자와 인덱스를 가져옴
            if answer[index] == num {
                strike += 1
            } else if answer.contains(num) {
                ball += 1
            }
        }
        return (strike, ball)
    }
}



// 실행했을 때 스트라이크와 볼이 나오는데 Nothing도 함께 출력되고있다..
