@propertyWrapper
public class Inject<Value> {
    public let name: String?
    public var storage: Value?
    
    public var wrappedValue: Value {
        storage ?? {
            let value: Value = Dependencies.root.resolve(for: name)
            storage = value
            return value
        }()
    }
    
    public init() {
        self.name = nil
    }
    
    public init(_ name: String) {
        self.name = name
    }
}
