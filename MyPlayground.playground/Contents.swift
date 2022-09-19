import UIKit
import RxSwift
import RxCocoa

let bag = DisposeBag()

func test1() -> Single<String> {
    return Single<String>.create { singles in
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            singles(.failure(NSError(domain: "error1", code: 0, userInfo: nil)))
        }
        return Disposables.create()
    }
}

func test2() -> Single<String> {
    return Single<String>.create { singles in
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            singles(.failure(NSError(domain: "error2", code: 0, userInfo: nil)))
        }
        return Disposables.create()
    }
}
let a = Observable.just(1)
let b = Observable.just(2)
func test() {
    Observable.zip(test1().asObservable(),test2().asObservable())
        .subscribe { _ in
            print("void")
        } onError: { error in
            print(error)
        } onCompleted: {
            print("completed")
        } onDisposed: {
            print("disposed")
        }
        .disposed(by: bag)
}

test()
