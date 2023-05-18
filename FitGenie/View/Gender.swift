
import UIKit

class Gender: UIViewController {

    

    let gender : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
        label.textColor = .black
        label.text = "What is your gender?"
        label.textAlignment = .center
        return label
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.text = "Knowing your gender can help us tailor the intensity for you based on different metabolic rates."
        label.numberOfLines = 3;
        label.textAlignment = .left
        return label
    }()
    let malebutton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "Male"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let femalebutton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "Female"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let male: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Male", for: .normal)
        button.layer.borderWidth = 0.2
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
    let female: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Female", for: .normal)
        button.layer.borderWidth = 0.2
        button.setTitleColor(.black, for: .normal)
        //button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    func setUI(){
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(gender)
        view.addSubview(label)
        view.addSubview(malebutton)
        view.addSubview(femalebutton)
        view.addSubview(male)
        view.addSubview(female)
        
        male.addTarget(self, action: #selector(go), for: .touchUpInside)
        malebutton.addTarget(self, action: #selector(go), for: .touchUpInside)
        female.addTarget(self, action: #selector(go), for: .touchUpInside)
        femalebutton.addTarget(self, action: #selector(go), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            gender.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            gender.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            gender.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            malebutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            malebutton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            malebutton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -220),
            malebutton.heightAnchor.constraint(equalToConstant: 300),
            
            femalebutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            femalebutton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 230),
            femalebutton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            femalebutton.heightAnchor.constraint(equalToConstant: 300),
            
            male.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 520),
            male.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            male.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -200),
            male.heightAnchor.constraint(equalToConstant: 60),
            
            female.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 520),
            female.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 210),
            female.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            female.heightAnchor.constraint(equalToConstant: 60),

        ])
        
    }
    @objc func go(){
            navigationController?.pushViewController(Age(), animated: true)
        }
  

}
