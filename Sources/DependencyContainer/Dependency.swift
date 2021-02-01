public struct Dependency {
    
    public typealias ResolveBlock<T> = () -> T
    
    private(set) var value: Any!
    private let resolveBlock: ResolveBlock<Any>
    let name: String
    
    public init<T>(_ block: @escaping ResolveBlock<T>) {
        resolveBlock = block
        name = String(describing: T.self)
    }
    mutating func resolve() {
        value = resolveBlock()
    }
}
