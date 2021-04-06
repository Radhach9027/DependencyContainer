import Foundation

open class Dependencies {
    private var modules = [String: Dependency]()
    
    public init(@ModuleBuilder _ modules: () -> [Dependency]) {
        modules().forEach { add(module: $0) }
    }
    
    public init(@ModuleBuilder _ module: () -> Dependency) {
        add(module: module())
    }
    
    open func build() {
        Self.root = self
    }
    
    fileprivate init() {}
    deinit { modules.removeAll() }
}

private extension Dependencies {
    static var root = Dependencies()
    
    func add(module: Dependency) {
        modules[module.name] = module
    }
    
    func resolve<T>(for name: String? = nil) -> T {
        let name = name ?? String(describing: T.self)
        
        guard let component: T = modules[name]?.resolve() as? T else {
            fatalError("Dependency '\(T.self)' not resolved!")
        }
        
        return component
    }
}

public extension Dependencies {
    
    @_functionBuilder struct ModuleBuilder {
        public static func buildBlock(_ modules: Dependency...) -> [Dependency] { modules }
        public static func buildBlock(_ module: Dependency) -> Dependency { module }
    }
}
