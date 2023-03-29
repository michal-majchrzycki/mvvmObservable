import UIKit

class ViewController: UIViewController {
    private let viewModel = ListViewModel()
    let textToDisplay: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    private func setupBinders() {
        viewModel.user.bind { [weak self] response in
            self?.textToDisplay.text =
            "Name: " + (response?.unsafelyUnwrapped.firstName ?? "")
            + "\n"
            + "Last name: " + (response?.unsafelyUnwrapped.lastName ?? "")
            + "\n"
            + "Age: " + "\(response?.unsafelyUnwrapped.age ?? 0)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textToDisplay)
        textToDisplay.frame = view.bounds
        setupBinders()
        viewModel.getUser()
    }
}

