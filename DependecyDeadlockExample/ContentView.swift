//
//  ContentView.swift
//  DependecyProblemExample
//
//  Created by Vladimir Petrovic on 22.3.23..
//

import SwiftUI
import SwiftUINavigation

struct ContentView: View {
    @StateObject var viewModel = ExampleViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Switch($viewModel.state) {
                CaseLet(/ExampleViewModel.State.state1) { _ in
                    Text("STATE 1")
                }
                CaseLet(/ExampleViewModel.State.state2) { _ in
                    Text(viewModel.info)
                }
            }
            Button("TAP ME") {
                viewModel.myAction()
            }
            .padding(.top,30)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
