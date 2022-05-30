//
//  EJBlockRenderer.swift
//  EditorJSKit_Example
//
//  Created by Ivan Glushko on 12/06/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

///
public protocol EJAbstractBlockRenderer {
    associatedtype View
    
    func render(block: EJAbstractBlock, indexPath: IndexPath, style: EJBlockStyle?) throws -> View
    func size(forBlock: EJAbstractBlock, itemIndex: Int, style: EJBlockStyle?, superviewSize: CGSize) throws -> CGSize
}

///
public protocol EJCollectionRendererAdaptable {
    func render(collectionView: UICollectionView, block: EJAbstractBlock, indexPath: IndexPath, style: EJBlockStyle?) throws -> UICollectionViewCell
    func size(forBlock: EJAbstractBlock, itemIndex: Int, style: EJBlockStyle?, superviewSize: CGSize) throws -> CGSize
    func insets(forBlock block: EJAbstractBlock) -> UIEdgeInsets
    func spacing(forBlock block: EJAbstractBlock) -> CGFloat
}

///
extension EJCollectionRendererAdaptable {
    func insets(forBlock block: EJAbstractBlock) -> UIEdgeInsets { return .zero }
    func spacing(forBlock block: EJAbstractBlock) -> CGFloat { return 0 }
}

///
public protocol EJCollectionRendererAdaptableContent: EJCollectionRendererAdaptable {
    // When conform make sure to use explicit type
    // cellClass: AnyClass = MyCollectionViewCell.self
    var cellClass: AnyClass { get set }
    var collectionView: UICollectionView? { get set }
}

///
public protocol EJCollectionBlockRenderer: EJAbstractBlockRenderer {
    var collectionView: UICollectionView { get }
    var startSectionIndex: Int { get }
    
    func insets(forBlock block: EJAbstractBlock) -> UIEdgeInsets
    func spacing(forBlock block: EJAbstractBlock) -> CGFloat
}


///
public enum EJError: String, Error {
    case missmatch
    case errorInDownloadTask
    case noCollectionView
}
