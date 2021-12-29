import UIKit

class DirectionViewController: UIViewController {
  override func loadView() {
    view = UIView()
    view.backgroundColor = .blue

    let content = UIView()
    content.backgroundColor = .red
    view.addSubview(content)
    content.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      content.widthAnchor.constraint(equalToConstant: 70),
      content.heightAnchor.constraint(equalToConstant: 70),
      content.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      content.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
    ])

    let still = UIView()
    still.backgroundColor = .yellow
    view.addSubview(still)
    still.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      still.widthAnchor.constraint(equalToConstant: 70),
      still.heightAnchor.constraint(equalToConstant: 70),
      still.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
      still.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
    ])
  }
}
