import UIKit

class DashboardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var tasks: [[String: String]] {
        get {
            let savedTasks = UserDefaults.standard.array(forKey: "detailedTasks") as? [[String: String]] ?? []
            print("Tasks loaded from UserDefaults in Dashboard: \(savedTasks)")
            return savedTasks
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "detailedTasks")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear called in Dashboard")
        reloadData()
    }
    func reloadData() {
        tasks = UserDefaults.standard.array(forKey: "detailedTasks") as? [[String: String]] ?? []
        print("Tasks after reloadData in Dashboard: \(tasks)")
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        let task = tasks[indexPath.row]
        if let taskLabel = cell.viewWithTag(100) as? UILabel {
            taskLabel.text = task["name"]
        }
        if let descLabel = cell.viewWithTag(101) as? UILabel {
            descLabel.text = task["description"]
        }
        if let priorityLabel = cell.viewWithTag(102) as? UILabel {
            priorityLabel.text = task["priority"]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
           let point = sender.convert(CGPoint.zero, to: tableView)

           if let indexPath = tableView.indexPathForRow(at: point) {
               var currentTasks = tasks
               currentTasks.remove(at: indexPath.row)
               tasks = currentTasks
               tableView.reloadData()
               print("Deleted task at row \(indexPath.row)")
           } else {
               print("Couldn't find the row.")
           }
       }
}
