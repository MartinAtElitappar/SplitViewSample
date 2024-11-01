//
//  EntityDetailView.swift
//  SplitViewSample
//
//  Created by Martin Poulsen on 2024-11-01.
//

import SwiftUI

struct EntityDetailView: View {
    @ObservedObject var entity: EntityType

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Detail View")
                .font(.largeTitle)
                .padding(.bottom, 20)

            Text("Name: \(entity.name)")
                .font(.title2)

            Toggle("Favorite", isOn: $entity.isFavorite)
            Toggle("Unread", isOn: $entity.isUnread)
            Toggle("Group", isOn: $entity.isGroup)

            Spacer()
        }
        .padding()
    }
}
