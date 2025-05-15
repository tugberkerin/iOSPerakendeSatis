

public class Bindable<T> {
    public var value: T {
        didSet {
            listener?(oldValue, value)
        }
    }

    private var listener: ((_ oldValue: T, _ newValue: T) -> Void)?

    public init(_ value: T) {
        self.value = value
    }

    public func bind(_ closure: @escaping (_ oldValue: T, _ newValue: T) -> Void) {
        listener = closure
        closure(value, value)
    }
}
