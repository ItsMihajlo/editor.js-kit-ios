//
//  DelimiterNativeView.swift
//  EditorJSKit
//
//  Created by Иван Глушко on 20/06/2019.
//  Copyright © 2019 Иван Глушко. All rights reserved.
//

import UIKit

///
open class DelimiterNativeView: UIView, EJBlockStyleApplicable {
    // MARK: - UI Properties
    public let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        let style = EJKit.shared.style.getStyle(forBlockType: EJNativeBlockType.delimiter) as? DelimiterNativeStyle
        let insets = style?.labelInsets ?? .zero
        
        addSubview(label)
        
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: leftAnchor,constant: insets.left),
            label.rightAnchor.constraint(equalTo: rightAnchor, constant: -insets.right),
            label.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom)
            ])
    }
    
    public func configure(item: DelimiterBlockContentItem) {
        label.text = item.text
    }
    
    public func apply(style: EJBlockStyle) {
        guard let style = style as? DelimiterBlockNativeStyle else { return }
        label.textColor = style.color
        label.font = style.font
        label.textAlignment = style.textAlignment
        //
        backgroundColor = style.backgroundColor
        layer.cornerRadius = style.cornerRadius
    }
    
    
    public static func estimatedSize(for item: DelimiterBlockContentItem, style: EJBlockStyle?, boundingWidth: CGFloat) -> CGSize {
        guard let castedStyle = EJKit.shared.style.getStyle(forBlockType: EJNativeBlockType.delimiter) as? DelimiterBlockNativeStyle else { return .zero }
        var newBoundingWidth = boundingWidth - (castedStyle.insets.left + castedStyle.insets.right)
        newBoundingWidth -= castedStyle.labelInsets.left + castedStyle.labelInsets.right
        var height = item.text.size(using: castedStyle.font, boundingWidth: newBoundingWidth).height
        height += castedStyle.labelInsets.bottom + castedStyle.labelInsets.top
        return CGSize(width: boundingWidth, height: height)
    }
    
}
