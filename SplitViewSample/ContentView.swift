//
//  ContentView.swift
//  SplitViewSample
//
//  Created by Martin Poulsen on 2024-11-01.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataController = DataController()

    var body: some View {
        NavigationSplitView {
            // Primary Pane - Filters
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(FilterType.allCases) { filter in
                        Button(action: {
                            dataController.selectedFilter = filter
                            // Update selection if necessary
                            let filteredEntities = dataController.entitiesForSelectedFilter()
                            if let selectedEntity = dataController.selectedEntity,
                               !filteredEntities.contains(selectedEntity) {
                                dataController.selectedEntity = filteredEntities.first
                            }
                            // If no entity is selected yet, select the first one
                            else if dataController.selectedEntity == nil {
                                dataController.selectedEntity = filteredEntities.first
                            }
                        }) {
                            Text(filter.rawValue)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .background(dataController.selectedFilter == filter ? Color.blue.opacity(0.2) : Color.clear)
                                .cornerRadius(8)
                        }
                    }
                }
                
            }
            .padding()
            .frame(height: 50)

            // Secondary Pane - List of Entities
            List(selection: $dataController.selectedEntity) {
                ForEach(dataController.entitiesForSelectedFilter()) { entity in
                    NavigationLink(value: entity) {
                        EntityRowView(entity: entity)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationSplitViewColumnWidth(min: 280, ideal: 320, max: 400)
            .navigationDestination(for: EntityType.self) { entity in
                EntityDetailView(entity: entity)
            }

        } detail: {
            // Detail Pane
            if let entity = dataController.selectedEntity {
                EntityDetailView(entity: entity)
            } else {
                NoEntityView()
            }
        }
    }
}

#Preview {
    ContentView()
}
