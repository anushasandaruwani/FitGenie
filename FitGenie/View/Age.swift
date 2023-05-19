import UIKit

class Age: UIViewController {
    
    let age : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
        label.textColor = .black
        label.text = "What is your age?"
        label.textAlignment = .center
        return label
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "It will help us to adjust the workout that best suits your age group."
        label.numberOfLines = 3;
        label.textAlignment = .left
        return label
    }()
    let image : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Age"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    let agelabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 91/255, alpha: 1.0)
        label.text = "Age"
        label.textAlignment = .center
        return label
    }()

    let agebox : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.2
        textField.layer.cornerRadius = 8
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 40, weight: .bold)
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        return textField
        }()
    let nextbutton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
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

    }
    func setUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(age)
        view.addSubview(label)
        view.addSubview(image)
        view.addSubview(agelabel)
        view.addSubview(agebox)
        view.addSubview(nextbutton)
        
        
        nextbutton.addTarget(self, action: #selector(go), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            age.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            age.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            age.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            image.heightAnchor.constraint(equalToConstant: 370),
            image.widthAnchor.constraint(equalToConstant: 350),
            
            agelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
            agelabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            agelabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -250),
            
            agebox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 440),
            agebox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            agebox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            agebox.heightAnchor.constraint(equalToConstant: 55),
            
            nextbutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 550),
            nextbutton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            nextbutton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            nextbutton.heightAnchor.constraint(equalToConstant: 45),
        ])
        
    }
    @objc func go(){
            navigationController?.pushViewController(HeightAndWeight(), animated: true)
        }

}
