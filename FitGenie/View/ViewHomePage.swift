import UIKit

class ViewHomePage: UIViewController {
    
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

}
extension ViewHomePage : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.image.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("The TableView could not dequeue a CustomCell in ViewHomePage.")
        }
        
        let image = self.image[indexPath.row]
        let name = "Beginner"
        cell.configure(with: image, and: name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112.5
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("DEBUG PRINT:", indexPath.row)
    }
    
}
