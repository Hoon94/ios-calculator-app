# 🧮 계산기

## 📖 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)
8. [팀 회고](#-팀-회고)

</br>

## 🍀 소개
hoon과 Hemg가 팀으로 기본적인 연산을 수행하는 계산기를 만들었습니다.

* 주요 개념: `protocols` ,  `extensions`, `Error Handling` , `closures` , `advancedoperators`, `inheritance`, `subscripts`, `Generics`, `NumberFormatter`

</br>

## 👨‍💻 팀원
| Hemg | hoon |
| :--------: | :--------: |
| <Img src = "https://user-images.githubusercontent.com/101572902/235090676-acefc28d-a358-486b-b9a6-f9c84c52ae9c.jpeg" width="200" /> |<Img src="https://i.imgur.com/zXoi5OC.jpg" width="200">
|[Github Profile](https://github.com/hemg2) |[Github Profile](https://github.com/Hoon94)



</br>

## ⏰ 타임라인
|날짜|내용|
|:--:|--|
|2023.06.12.| - 서로의 코드 리뷰 <br> - `merge` 할 코드 분류 |
|2023.06.13.| - hoon, Hemg 코드 합치기 |
|2023.06.14.| - operand 입력 버튼 액션 나누기 <br> - `NumberFormatter` 사용 <br> - 예외 처리 추가 | 
|2023.06.15.| - 예외 처리 추가 <br> - 불필요한 코드 삭제를 위한 전체 리팩토링|
|2023.06.16.| - 가독성을 위해 logical not(!) 연산자 사용 수정 <br> - README 작성 |

</br>

## 👀 시각화된 프로젝트 구조

### Diagram
<p align="center">
<img width="800" src="https://cdn.discordapp.com/attachments/1080783877594947597/1119154262077865984/UML_Diagramfinal.jpg">
</p>

</br>

## 💻 실행 화면 

| AC, CE 버튼 | +/- 버튼 연산 | 정상연산 |
|:--------:|:--------:|:--------:|
|<img src="https://hackmd.io/_uploads/r1kXttYDn.gif" width="250">|<img src="https://hackmd.io/_uploads/ByFvKKKvn.gif" width="240">|<img src="https://hackmd.io/_uploads/SycOFtYP3.gif" width="250">|

| 소수 계산 | 나누기 반올림 | 0 나누기 NaN |
|:--------:|:--------:|:--------:|
|<img src="https://hackmd.io/_uploads/rkN9tYtDh.gif" width="250">|<img src="https://hackmd.io/_uploads/HJljFKKw2.gif" width="250">|<img src="https://hackmd.io/_uploads/SyRjKKFD2.gif" width="250">|
</br>

## 🧨 트러블 슈팅

1️⃣ **`pull request`와 `merge`** <br>
-
🔒 **문제점** <br>
- 처음 콜라보레이터로 팀원을 등록하고 이전 계산기 1을 기준으로 다른 팀원의 코드를 합치는 방식으로 진행하였습니다. 수정한 내용에 대해 commit을 하고 반영하고 싶은 branch에 PR을 보냄으로써 수정한 내용을 merge 할지에 대한 처리를 할 수 있었습니다. merge를 진행할 때에는 현재 repository의 소유자 또는 콜라보레이터로 등록한 멤버만이 승인을 할 수 있었습니다. merge를 할 때 한 명의 멤버가 PR을 확인하고 이를 승인합니다. 이런 경우 확인하는 멤버의 실수를 통해 불필요한 내용 또는 오류가 merge 될 수 있었습니다.

🔑 **해결방법** <br>
- pr을 보내는 branch에 조건들을 설정할 수 있었습니다. merge를 진행할 때 `Require approvals`를 사용하여 승인을 해야하는 리뷰어의 수를 정할 수 있었고 이를 통해 한 명이 merge를 하는 경우에 대한 실수를 여러명의 검증을 통해 줄일수 있었습니다.


<br>

2️⃣ **예외 처리** <br>
-
🔒 **문제점** <br>
- 계산기를 다양한 경우에 대해 테스트하던 중 많은 엣지 케이스들이 존재하였습니다.

🔑 **해결방법** <br>
- 문제가 발생한 케이스에 대해 하나씩 테스트를 진행하며 수정하였습니다. 대표적으로 다음과 같은 경우에 대한 예외 처리들을 진행하였습니다.
    1. 부호(+/-)를 붙일 때 소수 부분 처리 (before: -2.3 -> -2, after: -2.3 -> -2.3)
    2. 처음 0일 때 00은 입력받지 않는다 (before: 0 -> 00, after: 0 -> 0)
    3. 입력창에서 소수점일 때 뒤에 0, 00 추가 (before: 2. -> 2, after: 2. -> 2.0 or 2.00)
    4. numberformatter를 사용한 쉼표 표현 (before: 1000, after: 1,000)
    5. "음수 × 0"이면 결괏값은 부호가 없는 "0" (before: -9 * 0 -> -0, after: -9 * 0 -> 0)
    6. 소수 부분에서 필요 없는 0 처리 (before: 2.1200 -> 2.1200, after: 2.1200 -> 2.12)
    7. 나누기 0인 경우 결과가 NaN이 나오고 AC, CE 버튼 외에는 전부 사용 불가
    8. 결과를 출력하면 AC, CE, +/-, 사칙연산 외에는 전부 사용 불가
    9. 실수에서 소수점을 기준으로 자연수에는 "," 처리
    10. 최대 입력받는 자릿수는 16자리로 제한

<br>

3️⃣ **중복 코드** <br>
-
🔒 **문제점** <br>
- `touchUpOperandButton`에서 너무 많은 조건문을 사용하여 이를 줄이고자 기능을 분리하기 위해 `0`, `00` 버튼을 새로운 액션으로 진행했습니다. 그래서 `touchUpZeroButton`과 `touchUpDoubleZeroButton`을 새로 추가하였습니다. 하지만 이 두 함수는 내부 구현에서 큰 차이가 없었습니다.

    ```swift 
    let realNumber = (currentOperand + zero).split(with: ".")

    if realNumber.count == 2 {
        operandLabel.text = (numberFormatter.string(for: Double(realNumber[0])) ?? "0") + "." + realNumber[1]
    } else {
        operandLabel.text = numberFormatter.string(from: NSNumber(value: newOperand))
    }
    ```


🔑 **해결방법** <br>
- 네이밍을 유지하여 각각의 메서드에 대한 동작을 확실히 표현하며 내부 로직만을 메서드로 분리하였습니다. 내부 로직을 메서드로 분리함으로써 다른 곳에서도 재활용성을 높여 중복된 코드를 줄일 수 있었습니다.

    ```swift
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        inputZero(1)
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        inputZero(2)
    }

    private func inputZero(_ count: Int) {
        guard validateOperandInput(with: count), currentOperand != "0" else {
            isPlaceholder = false
            return
        }
        
        let newOperand = currentOperand + String(repeating: "0", count: count)
        let realNumber = newOperand.split(with: ".")
        
        guard let numberValue = Double(realNumber[0]),
              let integerNumber = numberFormatter.string(from: NSNumber(value: numberValue)) else {
            return
        }
        
        if realNumber.count == 1 {
            operandLabel.text = integerNumber
        } else {
            operandLabel.text = integerNumber + "." + String(realNumber[1])
        }
    }
    
    private func validateOperandInput(with textCount: Int) -> Bool {
        guard !isResult else {
            return false
        }
        
        return currentOperand.count + textCount < 16
    }
    ```

<br>


## 📚 참고 링크
- [🍎Apple Docs: protocols](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/protocols/)
- [🍎Apple Docs: extensions](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/extensions/)
- [🍎Apple Docs: Error Handling](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/errorhandling/)
- [🍎Apple Docs: closures](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/)
- [🍎Apple Docs: advancedoperators](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/advancedoperators/)
- [🍎Apple Docs: inheritance](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance/)
- [🍎Apple Docs: subscripts](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/subscripts/)
- [🍎Apple Docs: API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
- [🍎Apple Docs: NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)
- [🍎Apple Docs: Generics](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/generics/)
</br>

## 👥 팀 회고
- [팀 회고 링크](https://github.com/Hoon94/ios-calculator-app/blob/Calculator2_step2/%ED%8C%80%ED%9A%8C%EA%B3%A0.md)
