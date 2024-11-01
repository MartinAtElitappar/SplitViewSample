//
//  DataController.swift
//  SplitViewSample
//
//  Created by Martin Poulsen on 2024-11-01.
//

import Foundation
import SwiftUI
import Combine

class DataController: ObservableObject {
    @Published var allEntities: [EntityType] = []
    @Published var selectedFilter: FilterType = .all
    @Published var selectedEntity: EntityType?

    private var cancellables = Set<AnyCancellable>()

    init() {
        // Create test data
        allEntities = [
            EntityType(name: "Chat with Alice", isFavorite: false, isUnread: true, isGroup: false),
            EntityType(name: "Family Group", isFavorite: true, isUnread: false, isGroup: true),
            EntityType(name: "Work Project", isFavorite: false, isUnread: true, isGroup: true),
            EntityType(name: "Bob", isFavorite: true, isUnread: false, isGroup: false),
            EntityType(name: "Friends Group", isFavorite: true, isUnread: true, isGroup: true),
            EntityType(name: "Carol", isFavorite: false, isUnread: true, isGroup: false),
            // Add more entities as needed
        ]

        // Observe changes in entities
        observeEntities()
    }

    private func observeEntities() {
        // Cancel any existing subscriptions
        cancellables.removeAll()

        // Merge the objectWillChange publishers of all entities
        let entityPublishers = allEntities.map { $0.objectWillChange }
        Publishers.MergeMany(entityPublishers)
            .sink { [weak self] _ in
                // Notify that DataController will change
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }

    func entitiesForSelectedFilter() -> [EntityType] {
        switch selectedFilter {
        case .all:
            return allEntities
        case .unread:
            return allEntities.filter { $0.isUnread }
        case .favorites:
            return allEntities.filter { $0.isFavorite }
        case .groups:
            return allEntities.filter { $0.isGroup }
        }
    }
}
