//
//  CustomLabel.swift
//  Basic_bounds
//
//  Created by Kang Minsang on 2023/09/23.
//

import UIKit

class BlackLabel: UILabel {
    /// 코드로 View를 생성시 불리는 필수 생성자, override 키워드로 재정의 필요
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// Storyboard 또는 Xib으로 생성시 불리는 필수 생성자, required 키워드를 그대로 명시
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 사용하기 편리하게 필요한 값들을 파라미터로 받을 수 있는 생성자
    convenience init(text: String) {
        self.init(frame: .zero)
        self.configure(text: text)
    }
    
    /// customView 관련 초기화작업 부분
    private func configure(text: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.text = text
    }
}
