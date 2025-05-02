import UIKit

class TaskViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var priorityControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func set(_ sender: UIButton) {
        guard let taskName = name.text, !taskName.isEmpty,
              let taskDesc = desc.text, !taskDesc.isEmpty else {
            print("Task name or description is empty.")
            return
        }
        let priority = priorityControl.titleForSegment(at: priorityControl.selectedSegmentIndex) ?? "None"
        let newTask: [String: String] = [
            "name": taskName,
            "description": taskDesc,
            "priority": priority
        ]
        var tasks = UserDefaults.standard.array(forKey: "detailedTasks") as? [[String: String]] ?? []
        tasks.append(newTask)
        UserDefaults.standard.set(tasks, forKey: "detailedTasks")
        print("Task saved to UserDefaults: \(newTask)")
        if let savedTasks = UserDefaults.standard.array(forKey: "detailedTasks") as? [[String: String]] {
            print("All tasks in UserDefaults after saving: \(savedTasks)")
        }
        self.navigationController?.popViewController(animated: true)
    }
}
