import UIKit
import FirebaseFirestore

class ViewHomePage: UIViewController {
    
    //Variables
    
    let database = Firestore.firestore() //Firebase Decl
    
    var workoutArray: [[String: Any]] = []
    var nameArray: [String] = []
    var descriptionArray: [String] = []
    var pictureArray: [String] = []
    var videoArray: [String] = []
    
    var dayOfWeek: String = "Monday"
    var goal: String = "stay-healthy"
    
    //Components
    
    let hey : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
        label.textColor = .black
        label.text = "Hey, "
        label.textAlignment = .left
        return label
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "Let's make your body stronger today!"
        label.numberOfLines = 3;
        label.textAlignment = .left
        return label
    }()
    
    let homeImage : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "HomePage"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    //Variables
    private let image : [UIImage] = [
        
        UIImage(named: "Abs")!,
        UIImage(named: "Arm")!,
        UIImage(named: "Shoulder")!,
        UIImage(named: "Legs")!,
        UIImage(named: "FullBody")!,
        
    ]
    // UI Components
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tableView
    }()
    //Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let currentDate = Date()
        dayOfWeek = dateFormatter.string(from: currentDate)
        
        self.getGoal()
        
        self.setUI()
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    private func setUI(){
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(hey)
        view.addSubview(label)
        view.addSubview(homeImage)
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            
            hey.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            hey.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            hey.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            homeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -50),
            homeImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 92),
            homeImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            homeImage.heightAnchor.constraint(equalToConstant: 200),
            homeImage.widthAnchor.constraint(equalToConstant: 300),
            
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 280),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
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
                    self.getExercise()
                }
            }        }
    
    func getExercise(){
        
        let path = "/exercises/"
        print("Hi",self.dayOfWeek)
        if(self.dayOfWeek == "Monday"){
            let day = "/day-one"
            let completePath = path + self.goal + day
            readDocument(pathStr: completePath)
        }
        else if(self.dayOfWeek == "Tuesday"){
            let day = "/day-two"
            let completePath = path + self.goal + day
            print("Path String :", completePath)
            readDocument(pathStr: completePath)
        }
        else if(self.dayOfWeek == "Wednesday"){
            let day = "/day-three"
            let completePath = path + self.goal + day
            readDocument(pathStr: completePath)
        }
        else if(self.dayOfWeek == "Thursday"){
            let day = "/day-four"
            let completePath = path + self.goal + day
            readDocument(pathStr: completePath)
        }
        else if(self.dayOfWeek == "Friday"){
            let day = "/day-five"
            let completePath = path + self.goal + day
            readDocument(pathStr: completePath)
        }
        else if(self.dayOfWeek == "Saturday"){
            let day = "/day-six"
            let completePath = path + self.goal + day
            readDocument(pathStr: completePath)
        }
        else if(self.dayOfWeek == "Sunday"){
            let day = "/day-seven"
            let completePath = path + self.goal + day
            readDocument(pathStr: completePath)
        }
        else{
            let day = "/day-one"
            let completePath = path + self.goal + day
            readDocument(pathStr: completePath)
        }    }
    
    func readDocument(pathStr:String){
        
        database.collection(pathStr).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    self.workoutArray.append(data)
                }
                
                self.saveNameArray()
                self.saveDescArray()
                self.savePicArray()
                self.saveVideoArray()
                
                self.printArrayData()
                
                self.tableView.reloadData()
            }
        }
    }
    
    func saveNameArray() {
        for data in workoutArray {
            self.nameArray.append(data["name"] as! String)
        }
    }
    
    func saveDescArray() {
        for data in workoutArray {
            self.descriptionArray.append(data["desc"] as! String)
        }
    }
    
    func savePicArray() {
        for data in workoutArray {
            self.pictureArray.append(data["pic"] as! String)
        }
    }
    
    func saveVideoArray() {
        for data in workoutArray {
            self.videoArray.append(data["video"] as! String)
        }
    }
    
    func printArrayData() {
        print("Name data array:")
        for data in workoutArray {
            print(data)
        }
    }
}
extension ViewHomePage : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("The TableView could not dequeue a CustomCell in ViewHomePage.")
        }
        
        let image = self.pictureArray[indexPath.row]
        let pic = UIImage(named: image)
        let label = self.nameArray[indexPath.row]
        cell.configure(with: pic!, and: label)
        cell.contentView.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112.5
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("DEBUG PRINT:", indexPath.row)
        
        let nameD = nameArray[indexPath.row]
        let descD = descriptionArray[indexPath.row]
        let videoD = videoArray[indexPath.row]
        
        print(nameD,":",descD,":",videoD)
        
        getNext(name: nameD, desc: descD, video: videoD)
    }
    
    @objc func getNext(name:String,desc:String,video:String) {
        let vc = PlayVideo()
        vc.labelWorkout.text = name
        vc.labelDesc.text = desc
        vc.videoId = video
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

