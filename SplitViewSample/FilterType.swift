//
//  FilterType.swift
//  SplitViewSample
//
//  Created by Martin Poulsen on 2024-11-01.
//

import Foundation

enum FilterType: String, CaseIterable, Identifiable {
    case all = "All"
    case unread = "Unread"
    case favorites = "Favorites"
    case groups = "Groups"

    var id: String { rawValue }
}
