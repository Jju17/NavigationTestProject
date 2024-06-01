//
//  NavigationTestProjectApp.swift
//  NavigationTestProject
//
//  Created by Julien Rahier on 01/06/2024.
//

import ComposableArchitecture
import SwiftUI

@main
struct NavigationTestProjectApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(store: Store(initialState: AppFeature.State.tab(TabFeature.State())) {
                AppFeature()
                    ._printChanges()
            })
        }
    }
}
