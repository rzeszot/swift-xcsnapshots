import UIKit

class SafeAreaViewController: UIViewController {
  override func loadView() {
    view = UIView()
    view.backgroundColor = .systemBlue

    let content = UIView()
    content.backgroundColor = .systemRed

    view.addSubview(content)
    content.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      content.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      content.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      content.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      content.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
