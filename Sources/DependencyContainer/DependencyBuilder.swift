@_functionBuilder public struct DependencyBuilder {
    public static func buildBlock(_ dependency: Dependency) -> Dependency { dependency }
    public static func buildBlock(_ dependencies: Dependency...) -> [Dependency] { dependencies }
}
