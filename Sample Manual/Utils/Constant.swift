//
//  Constant.swift
//  Sample Manual
//
//  Created by Jan Sebastian on 12/10/23.
//

import Foundation
import UIKit
import IGListKit


enum ContentArticleType: Codable {
    case None , Latest
}

struct Constant {
    
    static let lorenIpsum = """
    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Clients</a></li>
        <li><a href="#">Contact Us</a></li>
      </ul>
    </nav>
    <p class=\"baca\"><strong><span class=\"more\">Baca juga: </span> <a title=\"Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas\" href=\"\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas</a></strong></p>
    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
    
    <table style=\"border:1px solid black;\">
      <tr>
        <th style=\"border:1px solid black;\">Company</th>
        <th style=\"border:1px solid black;\">Contact</th>
        <th style=\"border:1px solid black;\">Country</th>
      </tr>
      <tr>
        <td style=\"border:1px solid black;\">Alfreds Futterkiste</td>
        <td style=\"border:1px solid black;\">Maria Anders</td>
        <td style=\"border:1px solid black;\">Germany</td>
      </tr>
      <tr>
        <td style=\"border:1px solid black;\">Centro comercial Moctezuma</td>
        <td style=\"border:1px solid black;\">Francisco Chang</td>
        <td style=\"border:1px solid black;\">Mexico</td>
      </tr>
    </table>
    """
    
    
    static let listColor: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple]
    
    struct FontName {
        static let questrial = "Questrial-Regular"
        static let CrimsonText = "CrimsonText-Regular"
        static let CrimsonTextBold = "CrimsonText-Bold"
        static let OpenSans = "OpenSans-Regular"
        static let OpenSansBold = "OpenSans-Bold"
        static let OpenSansItalic = "OpenSans_Condensed-Italic"
        static let RobotoText = "Roboto-Regular"
        static let RobotoTextBold = "Roboto-Bold"
    }
    
    struct FontType {
        static let fontKecil_kecil = 9
        static let fontKecil = 15
        static let fontKecilTitle = 22
        
        static let fontSedang_kecil = 12
        static let fontSedang = 19
        static let fontSedangTitle = 28
        
        static let fontBesar_kecil = 17
        static let fontBesar = 27
        static let fontBesarTitle = 29
        
        static let fontSangatBesar_kecil = 20
        static let fontSangatBesar = 31
        static let fontSangatBesarTitle = 32
        
        static let fontItemMax = 22
        static let fontItemMin = 16
        
        
        // for iPad
        
        static let fontKecil_keciliPad = 12
        static let fontKeciliPad = 19
        static let fontKecilTitleiPad = 28
        
        static let fontSedang_keciliPad = 17
        static let fontSedangiPad = 27
        static let fontSedangTitleiPad = 29
        
        static let fontBesar_keciliPad = 20
        static let fontBesariPad = 31
        static let fontBesarTitleiPad = 32
        
        static let fontSangatBesar_keciliPad = 23
        static let fontSangatBesariPad = 35
        static let fontSangatBesarTitleiPad = 38
        
        static let fontItemMaxiPad = 70
        static let fontItemMiniPad = 50
    }
}

enum FontType: String {
    case Kecil = "Kecil", Sedang = "Sedang", Besar = "Besar", SangatBesar = "SangatBesar"
}

extension FontType {
    var name: String {
        switch self {
        case .Kecil:
            return "Kecil"
        case .Sedang:
            return "Sedang"
        case .Besar:
            return "Besar"
        case .SangatBesar:
            return "Sangat Besar"
        }
    }
}

enum ArticleMap {
    case Title
    case Body
    case Tags
    case BacaJuga
    case OtherItem
    case SourceArticle
    case Komentar
}

public protocol Diffable: Equatable {
    
    /**
     Returns a key that uniquely identifies the object.
     
     - returns: A key that can be used to uniquely identify the object.
     
     - note: Two objects may share the same identifier, but are not equal.
     
     - warning: This value should never be mutated.
     */
    var diffIdentifier: String { get }
}

/**
 Performs a diff operation between two sets of `ItemDiffable` results.
 */
public struct DiffUtility {
    
    public struct DiffResult {
        public typealias Move = (from: Int, to: Int)
        public let inserts: [Int]
        public let deletions: [Int]
        public let updates: [Int]
        public let moves: [Move]
        
        public let oldIndexForID: (_ id: String) -> Int
        public let newIndexForID: (_ id: String) -> Int
    }
    
    public static func diff<T: Diffable>(originalItems: [T], newItems: [T]) -> DiffResult {
        let old = originalItems.map({ DiffableBox(value: $0, identifier: $0.diffIdentifier as NSObjectProtocol, equal: ==) })
        let new = newItems.map({ DiffableBox(value: $0, identifier: $0.diffIdentifier as NSObjectProtocol, equal: ==) })
        let result = ListDiff(oldArray: old, newArray: new, option: .equality)
        
        let inserts = Array(result.inserts)
        let deletions = Array(result.deletes)
        let updates = Array(result.updates)
        
        let moves: [DiffResult.Move] = result.moves.map({ (from: $0.from, to: $0.to) })
        
        let oldIndexForID: (_ id: String) -> Int = { id in
            return result.oldIndex(forIdentifier: NSString(string: id))
        }
        let newIndexForID: (_ id: String) -> Int = { id in
            return result.newIndex(forIdentifier: NSString(string: id))
        }
        return DiffResult(inserts: inserts, deletions: deletions, updates: updates, moves: moves, oldIndexForID: oldIndexForID, newIndexForID: newIndexForID)
    }
}

final class DiffableBox<T: Diffable>: ListDiffable {
    
    let value: T
    let identifier: NSObjectProtocol
    let equal: (T, T) -> Bool
    
    init(value: T, identifier: NSObjectProtocol, equal: @escaping(T, T) -> Bool) {
        self.value = value
        self.identifier = identifier
        self.equal = equal
    }
    
    // IGListDiffable
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if let object = object as? DiffableBox<T> {
            return true
        }
        return true
    }
}
