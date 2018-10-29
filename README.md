

## 설명

ViewController를 추가할떄 BaseViewController를 상속받아 생성한다

BaseViewController에는 기본적으로 가로, 세로에 반응 하는 코드가 적용되어 있다.


## 적용 방법

class ViewController: BaseViewController {

            override func viewDidLoad() {
                super.viewDidLoad()
                self.initOrientalChangeNoti()

            }

            override func initSubViews() {
                super.initSubViews()
                print("Subviews addsubView")
            }

            override func initLayoutPortrait() {
                super.initLayoutPortrait()
                print("세로")
            }

            override func initLayoutLandScape() {
                super.initLayoutLandScape()
                print("가로")
            }


}



## License
없습니다.
