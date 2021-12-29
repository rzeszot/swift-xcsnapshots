import UIKit

class StyleViewController: UIViewController {
  override func loadView() {
    view = UIView()
    view.backgroundColor = .systemBackground

    let content = UIView()
    content.backgroundColor = .label

    view.addSubview(content)
    content.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      content.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      content.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      content.widthAnchor.constraint(equalToConstant: 70),
      content.heightAnchor.constraint(equalToConstant: 70)
    ])
  }
}
