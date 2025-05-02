import UIKit

class NewTaskViewController: UIViewController {
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskPrioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var askDescriptionTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func LogTask(_ sender: Any) {
        guard let taskName = taskNameTextField.text, !taskName.isEmpty,
              let taskDescription = askDescriptionTextField.text, !taskDescription.isEmpty else {
            print("Please enter task name and description.")
            return
    }
        let priority = taskPrioritySegmentedControl.titleForSegment(at: taskPrioritySegmentedControl.selectedSegmentIndex) ?? "None"
        let newTask: [String: String] = [
            "name": taskName,
            "description": taskDescription,
            "priority": priority
        ]
        var tasks = UserDefaults.standard.array(forKey: "detailedTasks") as? [[String: String]] ?? []
        tasks.append(newTask)
        UserDefaults.standard.set(tasks, forKey: "detailedTasks")
        print("New task saved: \(newTask)")
        navigationController?.popViewController(animated: true)
    }
}
