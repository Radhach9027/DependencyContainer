@propertyWrapper
public struct Inject<Dependency> {
    
    private var dependency: Dependency!
    
    public init(dependency: Dependency) {
        self.dependency = dependency
    }
    
    public var wrappedValue: Dependency {
        mutating get {
            if dependency == nil {
                let copy: Dependency = Dependencies.shared.resolve()
                self.dependency = copy
            }
            return dependency
        }
        mutating set {
            dependency = newValue
        }
    }
}
