//
//  EntityType.swift
//  SplitViewSample
//
//  Created by Martin Poulsen on 2024-11-01.
//

import Foundation
import SwiftUI

class EntityType: ObservableObject, Identifiable, Hashable {
    static func == (lhs: EntityType, rhs: EntityType) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    let id = UUID()
    let name: String
    @Published var isFavorite: Bool
    @Published var isUnread: Bool
    @Published var isGroup: Bool

    init(name: String, isFavorite: Bool, isUnread: Bool, isGroup: Bool) {
        self.name = name
        self.isFavorite = isFavorite
        self.isUnread = isUnread
        self.isGroup = isGroup
    }
}
