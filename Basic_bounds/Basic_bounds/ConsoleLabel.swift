//
//  ConsoleLabel.swift
//  Basic_bounds
//
//  Created by Kang Minsang on 2023/09/22.
//

import UIKit

class ConsoleLabel: UIView {
    var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    var consoleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBackground
        label.font = .monospacedSystemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
        self.configure()
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.backgroundView)
        NSLayoutConstraint.activate([
            self.backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        self.backgroundView.addSubview(self.consoleLabel)
        NSLayoutConstraint.activate([
            self.consoleLabel.topAnchor.constraint(equalTo: self.backgroundView.topAnchor, constant: 8),
            self.consoleLabel.leadingAnchor.constraint(equalTo: self.backgroundView.leadingAnchor, constant: 8),
            self.consoleLabel.trailingAnchor.constraint(equalTo: self.backgroundView.trailingAnchor, constant: -8),
            self.consoleLabel.bottomAnchor.constraint(equalTo: self.backgroundView.bottomAnchor, constant: -8)
        ])
    }
}

extension ConsoleLabel {
    func print(_ new: Any) {
        if let text = self.consoleLabel.text {
            self.consoleLabel.text = "\(text)\n\(new)"
        } else {
            self.consoleLabel.text = "\(new)"
        }
    }
    
    func clear() {
        self.consoleLabel.text = nil
    }
}
