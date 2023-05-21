import UIKit

class ViewProfilePage: UIViewController {
    
    let name : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
        label.textColor = .black
        label.text = "Anusha Sandaruwani"
        label.textAlignment = .center
        return label
    }()
    
    let level : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "Beginner"
        label.textAlignment = .center
        return label
    }()
    
    let profilePic : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ProfilePicture"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    
    let gender : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "Female"
        label.textAlignment = .center
        return label
    }()
    
    let age : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "26(Years)"
        label.textAlignment = .center
        return label
    }()
    
    let dot1 : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Dot"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    
    let height : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        label.text = "160cm"
        label.textAlignment = .left
        label.textColor = .black
        return label
        }()
    let height1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "Height(cm)"
        return label
        }()
    
    let weight : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        label.text = "45.5kg"
        label.textColor = .black
        return label
        }()
    let weight1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "Weight(kg)"
        return label
        }()
    
    let dot : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Dot"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30)
        label.layer.borderWidth = 0.2
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
    let bmi : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "BMI"
        label.textAlignment = .center
        return label
        }()
    
    let bmi1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.text = "16.0"
        label.textAlignment = .center
        return label
        }()
    
    let logout : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.backgroundColor = UIColor(red: 232/255, green: 207/255, blue: 190/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        let data = UserDefaults.standard
        
        let ageStr = data.string(forKey: "Age")
        let wStr = data.string(forKey: "weight")
        let hStr = data.string(forKey: "height")
        let bmiStr = data.string(forKey: "bmi")
        
        
        age.text = ageStr
        weight.text = wStr
        height.text = hStr
        bmi1.text = bmiStr

    }
    func setUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(name)
        view.addSubview(level)
        view.addSubview(profilePic)
        view.addSubview(gender)
        view.addSubview(age)
        view.addSubview(dot1)
        view.addSubview(height)
        view.addSubview(weight)
        view.addSubview(label)
        view.addSubview(height1)
        view.addSubview(weight1)
        view.addSubview(dot)
        view.addSubview(bmi)
        view.addSubview(bmi1)
        view.addSubview(logout)
        
        logout.addTarget(self, action: #selector(go), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            level.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            level.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            level.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            profilePic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePic.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            profilePic.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            profilePic.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            profilePic.heightAnchor.constraint(equalToConstant: 250),
            profilePic.widthAnchor.constraint(equalToConstant: 250),
            
            gender.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 350),
            gender.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            gender.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            
            age.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 350),
            age.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            age.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            dot1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dot1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 358),
            dot1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            dot1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            dot1.heightAnchor.constraint(equalToConstant: 8),
            dot1.widthAnchor.constraint(equalToConstant: 8),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 390),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            label.heightAnchor.constraint(equalToConstant: 100),
            
            height.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 410),
            height.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 75),
            height.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            weight.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 410),
            weight.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 275),
            weight.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            height1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 450),
            height1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 75),
            height1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            weight1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 450),
            weight1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 265),
            weight1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            dot.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dot.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 430),
            dot.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            dot.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            dot.heightAnchor.constraint(equalToConstant: 15),
            dot.widthAnchor.constraint(equalToConstant: 15),
            
            bmi.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 545),
            bmi.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            bmi.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            bmi1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 510),
            bmi1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            bmi1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            logout.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
            logout.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            logout.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            logout.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    
    @objc func go(){
            navigationController?.pushViewController(FirstScreen(), animated: true)
        }
}
