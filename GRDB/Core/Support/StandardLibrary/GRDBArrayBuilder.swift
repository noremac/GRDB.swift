@resultBuilder
public enum GRDBArrayBuilder<Element> {
  public typealias Component = [Element]

  public static func buildExpression(_ expression: Element) -> Component {
    [expression]
  }

  public static func buildExpression(_ expression: Element?) -> Component {
    expression.map {
      [$0]
    } ?? []
  }

  public static func buildBlock(_ components: Component...) -> Component {
    components.flatMap(\.self)
  }

  public static func buildOptional(_ component: Component?) -> Component {
    component ?? []
  }

  public static func buildEither(first component: Component) -> Component {
    component
  }

  public static func buildEither(second component: Component) -> Component {
    component
  }

  public static func buildArray(_ components: [Component]) -> Component {
    components.flatMap(\.self)
  }

  public static func buildLimitedAvailability(_ component: Component) -> Component {
    component
  }
}
