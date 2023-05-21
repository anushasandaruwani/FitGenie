import UIKit

class ViewSchedulePage: UIViewController {
    
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
            getNextVC(pathStr: "/exercises/get-fit/day-one",day: "Monday")
        }else if(selectedRow == 1){
            //tuesday
            getNextVC(pathStr: "/exercises/get-fit/day-two",day: "Tuesday")
        }else if(selectedRow == 2){
            //wednesday
            getNextVC(pathStr: "/exercises/get-fit/day-three",day: "Wednesday")
        }else if(selectedRow == 3){
            //thursday
            getNextVC(pathStr: "/exercises/get-fit/day-four",day: "Thursday")
        }else if(selectedRow == 4){
            //friday
            getNextVC(pathStr: "/exercises/get-fit/day-five",day: "Friday")
            
        }else if(selectedRow == 5){
            //saturday
            getNextVC(pathStr: "/exercises/get-fit/day-six",day: "Saturday")
        }else if(selectedRow == 6){
            //sunday
            getNextVC(pathStr: "/exercises/get-fit/day-seven",day: "Sunday")
        }
    }
    
    @objc func getNextVC(pathStr:String, day:String){
        let vc = ViewDailySchedule()
        vc.stringPath = pathStr
        vc.label.text = day
        navigationController?.pushViewController(vc, animated: true)
    }
}
