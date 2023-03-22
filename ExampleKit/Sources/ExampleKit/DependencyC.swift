import Dependencies
import Foundation

// MARK: - Dependency

private enum DependencyCKey: DependencyKey {
    static let liveValue: DependencyC = DependencyC()
}

extension DependencyValues {
    public var dependencyC: DependencyC {
        get { self[DependencyCKey.self] }
        set { self[DependencyCKey.self] = newValue }
    }
}

public class DependencyC {
    
    // MARK: Properties
    var propA: Int
    
    public init() {
        // do something
        propA = 0
    }
    
    public func someAction() async {
        propA = 1
    }
    
    public func info() -> String {
        return "some C info"
    }
}
