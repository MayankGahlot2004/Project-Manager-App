import UIKit

class ProjectViewController: UIViewController {
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    @IBOutlet weak var taskPriorityLabel: UILabel!
    var taskName: String?
    var taskDescription: String?
    var taskPriority: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        taskNameLabel.text = taskName
        taskDescriptionLabel.text = taskDescription
        taskPriorityLabel.text = taskPriority
    }
}
