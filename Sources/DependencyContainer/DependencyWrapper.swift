@propertyWrapper
struct Inject<Dependency> {
    private var dependency: Dependency!
    init() {}

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
