import Dependencies
import Foundation

// MARK: - Dependency

private enum DependencyBKey: DependencyKey {
    static let liveValue: DependencyB = DependencyB()
}

extension DependencyValues {
    public var dependencyB: DependencyB {
        get { self[DependencyBKey.self] }
        set { self[DependencyBKey.self] = newValue }
    }
}

public class DependencyB {
    var varA: Int = 0
    
    public init() {
        // for example:
        // this could be calling out 3rd party library which we can not control!
        // and which does something like this
        // (one of the 3rd party libraries we are using is actualy doing this!)
        if Thread.isMainThread {
            varA = 2
        } else {
            DispatchQueue.main.sync {
                varA = 1
            }
        }
    }

    public func myFunction() {
        varA = 3
    }
    
}
