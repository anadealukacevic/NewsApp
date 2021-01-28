//
//  ArticleTableViewCell.swift
//  GoodNews
//
//  Created by Anadea Lukačević on 20/01/2021.
//

import UIKit
import SnapKit

class ArticleTableViewCell: UITableViewCell {
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    internal lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    internal lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(contentStackView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func makeConstraints() {
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(10)
            $0.bottom.equalTo(-10)
            $0.leading.equalTo(15)
            $0.trailing.equalTo(-15)
        }
    }
}
