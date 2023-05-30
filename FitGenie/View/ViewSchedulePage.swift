import UIKit
import FirebaseFirestore

class ViewSchedulePage: UIViewController {
    
    let database = Firestore.firestore()
    
    var goal: String = "stay-fit"
    
    let schedule : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
        label.textColor = .black
        label.text = "Schedule"
        label.textAlignment = .center
        return label
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "Begin with exercises that match your fitness level."
        label.numberOfLines = 3;
        label.textAlignment = .left
        return label
    }()
    
    
    let desc: [String] = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
    ]
    
    let exerciseImages: [UIImage] = [
        UIImage(named: "Abs")!,
        UIImage(named: "FullBody")!,
        UIImage(named: "Arm")!,
        UIImage(named: "Legs")!,
        UIImage(named: "Shoulder")!,
        UIImage(named: "Abs")!,
        UIImage(named: "Arm")!
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = true
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getGoal()
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(schedule)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            
            schedule.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            schedule.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            schedule.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 270),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func getGoal(){
           let userdefs = UserDefaults.standard
           let email = userdefs.value(forKey: "email")
           
        print("email address:",email as Any)
           
           database.collection("user_data")
               .whereField("email", isEqualTo: email as Any)
               .getDocuments { snapshot, error in
                   if let error = error {
                       print("Error fetching user data:", error)
                       return
                   }
                   
                   guard let documents = snapshot?.documents else {
                       print("No documents found")
                       return
                   }
                   
                   if let docData = documents.first?.data() {
                       let goalData = docData["goal"] as? String ?? "stay-healthy"
                       self.goal = goalData
                       print("Goal:",self.goal)
                   }
               }
    }
    
}

extension ViewSchedulePage: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return desc.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("Failed to dequeue CustomCell")
        }

        let image = exerciseImages[indexPath.row]
        let label = desc[indexPath.row]
        cell.configure(with: image, and: label)
        cell.contentView.backgroundColor = .white
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedRow = indexPath.row
        
        if(selectedRow == 0){
            //monday
            let pathString = "/exercises/" + self.goal + "/day-one"
            getNextVC(pathStr: pathString,day: "Monday")
        }else if(selectedRow == 1){
            //tuesday
            let pathString = "/exercises/" + self.goal + "/day-two"
            getNextVC(pathStr: pathString,day: "Tuesday")
        }else if(selectedRow == 2){
            //wednesday
            let pathString = "/exercises/" + self.goal + "/day-three"
            getNextVC(pathStr: pathString,day: "Wednesday")
        }else if(selectedRow == 3){
            //thursday
            let pathString = "/exercises/" + self.goal + "/day-four"
            getNextVC(pathStr: pathString,day: "Thursday")
        }else if(selectedRow == 4){
            //friday
            let pathString = "/exercises/" + self.goal + "/day-five"
            getNextVC(pathStr: pathString,day: "Friday")
            
        }else if(selectedRow == 5){
            //saturday
            let pathString = "/exercises/" + self.goal + "/day-six"
            getNextVC(pathStr: pathString,day: "Saturday")
        }else if(selectedRow == 6){
            //sunday
            let pathString = "/exercises/" + self.goal + "/day-seven"
            getNextVC(pathStr: pathString,day: "Sunday")
        }
    }
    
    @objc func getNextVC(pathStr:String, day:String){
        let vc = ViewDailySchedule()
        vc.stringPath = pathStr
        vc.label.text = day
        navigationController?.pushViewController(vc, animated: true)
    }
}
