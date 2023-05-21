
import UIKit
import FirebaseFirestore

class ViewDailySchedule: UIViewController{
    
    var stringPath = ""
    
    let db = Firestore.firestore() // Firebase
    
    var dataArray: [[String: Any]] = []
    var nameDataArray: [String] = []
    var descDataArray: [String] = []
    
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
        UIImage(named: "FullBody")!,
        UIImage(named: "Abs")!,
        UIImage(named: "Arm")!,
        UIImage(named: "Legs")!,
        UIImage(named: "Shoulder")!,
        UIImage(named: "FullBody")!,
        UIImage(named: "Abs")!
    ]
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36)
        label.textColor = .systemBlue
        label.text = "First View"
        label.textAlignment = .center
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = true
        tableView.register(CustomCellForSchedule.self, forCellReuseIdentifier: CustomCellForSchedule.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArray = []
        nameDataArray = []
        descDataArray = []
        
        readDocument(pathStr: stringPath)
        
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func setupUI() {
        view.backgroundColor = .white
        
       
        view.addSubview(label)
        
        view.addSubview(tableView)
        

        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            label.heightAnchor.constraint(equalToConstant: 40),
                
                tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    
    func readDocument(pathStr: String){
        
        db.collection(pathStr).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    self.dataArray.append(data)
                }
                
                self.saveNameArray()
                self.saveDescArray()
                
                self.tableView.reloadData()
            }
        }
    }
    
    func saveNameArray() {
        for data in dataArray {
            self.nameDataArray.append(data["name"] as! String)
        }
    }
    
    func saveDescArray() {
        for data in dataArray {
            self.descDataArray.append(data["desc"] as! String)
        }
    }

}

extension ViewDailySchedule: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameDataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellForSchedule.identifier, for: indexPath) as? CustomCellForSchedule else {
            fatalError("Failed to dequeue CustomCell")
        }

        let image = exerciseImages[indexPath.row]
        let label = nameDataArray[indexPath.row]
        let labelmini = descDataArray[indexPath.row]
        
        cell.configure(with: image, label: label, labelMini: labelmini)
        cell.contentView.backgroundColor = .white
        return cell
    }

}
