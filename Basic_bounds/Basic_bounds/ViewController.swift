//
//  ViewController.swift
//  Basic_bounds
//
//  Created by Kang Minsang on 2023/09/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 하단 콘솔내용 표시
        let console = ConsoleLabel()
        self.view.addSubview(console)
        NSLayoutConstraint.activate([
            console.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            console.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            console.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // 상위뷰
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.frame = CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: 300, height: 300))
        self.view.addSubview(view)
        
        // 하위뷰
        let subView = UIView()
        subView.backgroundColor = .green
        subView.frame = CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: 200, height: 200))
        view.addSubview(subView)
        
        // bounds, frame 각각 출력
        console.print("Before move (0, 0)")
        console.print("A bounds: \(view.bounds)")
        console.print("A frame: \(view.frame)")
        console.print("B bounds: \(subView.bounds)")
        console.print("B frame: \(subView.frame)")
        
        // bounds.origin 변화를 위한 액션
        let moveBoundsOriginAction = UIAction { _ in
            UIView.animate(withDuration: 3) {
                view.bounds.origin = CGPoint(x: 50, y: 50)
            }
            console.clear()
            console.print("After move (50, 50)")
            console.print("A bounds: \(view.bounds)")
            console.print("A frame: \(view.frame)")
            console.print("B bounds: \(subView.bounds)")
            console.print("B frame: \(subView.frame)")
        }
        
        // 변화를 위한 버튼
        let button = UIButton(configuration: .filled())
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
        ])
        
        button.setTitle("bounds.origin from (0, 0) to (50, 50)", for: .normal)
        button.addAction(moveBoundsOriginAction, for: .touchUpInside)
        
        /* rotation 코드 부분 */
        
        console.clear()
        console.print("Before rotation")
        console.print("A bounds: \(view.bounds)")
        console.print("A frame: \(view.frame)")
        console.print("B bounds: \(subView.bounds)")
        console.print("B frame: \(subView.frame)")
        
        // view 회전을 위한 액션
        let rotationAction = UIAction { _ in
            UIView.animate(withDuration: 3) {
                view.transform = CGAffineTransform(rotationAngle: -.pi / 4)
            }
            console.clear()
            console.print("After rotation")
            console.print("A bounds: \(view.bounds)")
            console.print("A frame: \(view.frame)")
            console.print("B bounds: \(subView.bounds)")
            console.print("B frame: \(subView.frame)")
        }
        
        button.setTitle("rotate view", for: .normal)
        button.removeAction(moveBoundsOriginAction, for: .touchUpInside)
        button.addAction(rotationAction, for: .touchUpInside)
    }
}
