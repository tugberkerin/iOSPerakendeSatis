
import UIKit


public class TableViewCellWrapper<WrappedView: UIView & Configurable>: UITableViewCell, Configurable {
    //  Subviews
    private let wrappedView = WrappedView()

    //  Public
    @discardableResult
    public func configure(closure: (WrappedView) -> Void) -> Self {
        closure(wrappedView)
        return self
    }

    // Init

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    //  Prepare for reuse
    public override func prepareForReuse() {
        super.prepareForReuse()
        wrappedView.prepareForReuse()
    }

    //  Convenience
    private func setup() {
        with(self) {
            $0.selectionStyle = .none
            $0.backgroundColor = .clear
            $0.contentView.backgroundColor = .clear
        }

        with(wrappedView) {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            let constraint = [
                $0.topAnchor.constraint(equalTo: contentView.topAnchor),
                $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                $0.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ]
            NSLayoutConstraint.activate(constraint)
        }
    }
}

//  TableViewCellWrapper + Configurable
extension TableViewCellWrapper {
    public struct Model {
        public let wrappedModel: WrappedView.Model

        public init(model: WrappedView.Model) {
            self.wrappedModel = model
        }
    }

    public func configure(with model: Model) {
        wrappedView.configure(with: model.wrappedModel)
    }
}
