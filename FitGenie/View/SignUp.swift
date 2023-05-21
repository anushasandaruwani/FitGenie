import UIKit

class SignUp: UIViewController {

    let welcome : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
        label.textColor = .black
        label.text = "Create an account"
        label.textAlignment = .center
        return label
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "Sign up any way you like and start working out"
        label.numberOfLines = 3;
        label.textAlignment = .left
        return label
    }()
    
    let signUpImage : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "SignUp"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        textField.font = .systemFont(ofSize: 40, weight: .bold)
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
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
        textField.font = .systemFont(ofSize: 40, weight: .bold)
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        return textField
        }()
    
    let google: UIButton = {
        let button = UIButton()
        button.setTitle("     Continue with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.borderWidth = 0.2
        button.setImage(UIImage(named: "Google"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
    
    let apple: UIButton = {
        let button = UIButton()
        button.setTitle("  Continue with Apple", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.borderWidth = 0.2
        button.setImage(UIImage(named: "Apple"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
    
    let label2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.text = "Already have an account?"
        label.textAlignment = .center
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        return label
        }()
    
    let signup : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign in", for: .normal)
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
        view.addSubview(signUpImage)
        view.addSubview(email)
        view.addSubview(emailbox)
        view.addSubview(password)
        view.addSubview(passwordbox)
        view.addSubview(google)
        view.addSubview(apple)
        view.addSubview(hStack)
        
        signup.addTarget(self, action: #selector(go), for: .touchUpInside)
        
        hStack.addArrangedSubview(label2)
        hStack.addArrangedSubview(signup)
                
                
                
        
        NSLayoutConstraint.activate([
            
            welcome.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            welcome.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            welcome.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            signUpImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            signUpImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            signUpImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            signUpImage.heightAnchor.constraint(equalToConstant: 250),
            signUpImage.widthAnchor.constraint(equalToConstant: 250),
            
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
            
//            google.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 470),
//            google.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
//            google.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
//            google.heightAnchor.constraint(equalToConstant: 45),
//            
//            apple.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 540),
//            apple.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
//            apple.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
//            apple.heightAnchor.constraint(equalToConstant: 45),
            
            hStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
            hStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 42),
            hStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            hStack.heightAnchor.constraint(equalToConstant: 55),
        
        ])
        
    }
    
    @objc func go(){
            navigationController?.pushViewController(SignIn(), animated: true)
        }

}
