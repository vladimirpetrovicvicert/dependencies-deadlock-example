//
//  ExampleViewModel.swift
//  DependecyProblemExample
//
//  Created by Vladimir Petrovic on 22.3.23..
//

import Dependencies
import Foundation
import ExampleKit

@MainActor
class ExampleViewModel: ObservableObject {
    public enum State {
        case state1
        case state2
    }

    @Published public var state: State = .state1

    @Dependency(\.dependencyA) var myDependecyA
    @Dependency(\.dependencyC) var myDependecyC

    var info: String {
        myDependecyC.info()
    }
    
    func myAction() {
        Task {
            state = .state2
            await myDependecyA.functionThatDependOnB()
        }
    }
}

