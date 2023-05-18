import UIKit

class HeightAndWeight: UIViewController {

    let heightandweight : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
        label.textColor = .black
        label.text = "What is your height and weight?"
        label.numberOfLines = 2;
        label.textAlignment = .center
        return label
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "We need this information to create the best possible plan for you."
        label.numberOfLines = 3;
        label.textAlignment = .left
        return label
    }()
    let height : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 91/255, alpha: 1.0)
        label.text = "Height (Centimeter)"
        label.textAlignment = .center
        return label
    }()

    let heightbox : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.2
        textField.layer.cornerRadius = 8
        return textField
        }()
    
    let weight : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 91/255, alpha: 1.0)
        label.text = "Weight (Kilogram)"
        label.textAlignment = .center
        return label
    }()

    let weightbox : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.2
        textField.layer.cornerRadius = 8
        return textField
        }()
    let nextbutton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.backgroundColor = UIColor(red: 232/255, green: 207/255, blue: 190/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()

    }
    func setUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(heightandweight)
        view.addSubview(label)
        view.addSubview(nextbutton)
        view.addSubview(height)
        view.addSubview(heightbox)
        view.addSubview(weight)
        view.addSubview(weightbox)
        
        nextbutton.addTarget(self, action: #selector(go), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            heightandweight.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            heightandweight.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            heightandweight.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            height.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 230),
            height.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            height.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -150),
            
            heightbox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 265),
            heightbox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            heightbox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            heightbox.heightAnchor.constraint(equalToConstant: 55),
            
            weight.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 360),
            weight.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -20),
            weight.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -140),
            
            weightbox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 395),
            weightbox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            weightbox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            weightbox.heightAnchor.constraint(equalToConstant: 55),
            
            nextbutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 550),
            nextbutton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            nextbutton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            nextbutton.heightAnchor.constraint(equalToConstant: 45),
        ])
        
    }
    @objc func go(){
            navigationController?.pushViewController(FitnessGoal(), animated: true)
        }

}

