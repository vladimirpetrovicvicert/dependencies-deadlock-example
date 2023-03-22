import Dependencies
import Foundation

// MARK: - Dependency

private enum DependencyAKey: DependencyKey {
    static let liveValue: DependencyA = DependencyA()
}

extension DependencyValues {
    public var dependencyA: DependencyA {
        get { self[DependencyAKey.self] }
        set { self[DependencyAKey.self] = newValue }
    }
}

public class DependencyA {
    
    // MARK: Properties
    
    @Dependency(\.dependencyB) var myDependencyB
 
    public init() {
        // do something
    }
    
    public func functionThatDependOnB() async {
        myDependencyB.myFunction()
    }
}
