//
//  EntityRowView.swift
//  SplitViewSample
//
//  Created by Martin Poulsen on 2024-11-01.
//

import SwiftUI

struct EntityRowView: View {
    @ObservedObject var entity: EntityType

    var body: some View {
        HStack {
            Text(entity.name)
            Spacer()
            // Icons arranged in an HStack
            HStack(spacing: 16) { // Adjust spacing as needed
                Button(action: {
                    entity.isFavorite.toggle()
                }) {
                    Image(systemName: entity.isFavorite ? "star.fill" : "star")
                        .frame(width: 24, height: 24) // Set fixed size
                }
                .buttonStyle(.plain)

                Button(action: {
                    entity.isUnread.toggle()
                }) {
                    Image(systemName: entity.isUnread ? "envelope.fill" : "envelope.open")
                        .frame(width: 24, height: 24)
                }
                .buttonStyle(.plain)

                Button(action: {
                    entity.isGroup.toggle()
                }) {
                    Image(systemName: entity.isGroup ? "person.3.fill" : "person")
                        .frame(width: 24, height: 24)
                }
                .buttonStyle(.plain)
            }
            .frame(height: 24) // Ensure HStack aligns with icon size
        }
//        .padding(.vertical, 4)
    }
}
