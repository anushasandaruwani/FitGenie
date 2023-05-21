import UIKit

class SignIn: UIViewController {
    
    let welcome : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
        label.textColor = .black
        label.text = "Welcome to FitGenie"
        label.textAlignment = .center
        return label
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "Log in with one of the following options and get started"
        label.numberOfLines = 3;
        label.textAlignment = .left
        return label
    }()
    let email : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 91/255, alpha: 1.0)
        label.text = "Email"
        label.textAlignment = .left
        return label
    }()

    let emailbox : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.2
        textField.layer.cornerRadius = 8
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 15)
        textField.textAlignment = .left
        return textField
        }()
    
    let password : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 91/255, alpha: 1.0)
        label.text = "Password"
        label.textAlignment = .left
        return label
    }()

    let passwordbox : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 0.2
        textField.layer.cornerRadius = 8
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 15)
        textField.textAlignment = .left
        return textField
        }()
    
    let signInImage : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "SignIn"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    
    let signin : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.backgroundColor = UIColor(red: 232/255, green: 207/255, blue: 190/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let label2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.text = "Don't have an account?"
        label.textAlignment = .center
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        return label
        }()
    
    let signup : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = UIColor(red: 232/255, green: 207/255, blue: 190/255, alpha: 1.0)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
    
    let hStack : UIStackView = {
            let stack = UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .horizontal
            stack.spacing = 20
            return stack
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        
        
    }
    
    func setUI(){
        
        view.backgroundColor = .white
        view.addSubview(welcome)
        view.addSubview(label)
        view.addSubview(email)
        view.addSubview(emailbox)
        view.addSubview(password)
        view.addSubview(passwordbox)
        view.addSubview(signin)
        view.addSubview(hStack)
        view.addSubview(signInImage)
        
        signup.addTarget(self, action: #selector(go), for: .touchUpInside)
        signin.addTarget(self, action: #selector(go1), for: .touchUpInside)
        
        
        hStack.addArrangedSubview(label2)
        hStack.addArrangedSubview(signup)
                
                
                
        
        NSLayoutConstraint.activate([
            
            welcome.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            welcome.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            welcome.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            signInImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            signInImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            signInImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            signInImage.heightAnchor.constraint(equalToConstant: 220),
            signInImage.widthAnchor.constraint(equalToConstant: 220),
            
            email.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 370),
            email.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            email.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            emailbox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
            emailbox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            emailbox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            emailbox.heightAnchor.constraint(equalToConstant: 50),
            
            password.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 470),
            password.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            password.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            passwordbox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500),
            passwordbox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            passwordbox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            passwordbox.heightAnchor.constraint(equalToConstant: 50),
            
            signin.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
            signin.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            signin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            signin.heightAnchor.constraint(equalToConstant: 45),
            
            hStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 650),
            hStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            hStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            hStack.heightAnchor.constraint(equalToConstant: 55),
        
        ])
        
    }
    @objc func go(){
            navigationController?.pushViewController(SignUp(), animated: true)
        }
    @objc func go1(){
        
            navigationController?.pushViewController(Gender(), animated: true)
        }
}
