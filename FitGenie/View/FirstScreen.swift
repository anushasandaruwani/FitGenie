import UIKit

class FirstScreen: UIViewController {
    
    let logo : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "LOGO"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    
    let appname : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40)
        label.textColor = .black
        label.text = "FitGenie"
        label.textAlignment = .center
        return label
        }()
    let firstpage : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "FirstPageIMG"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.backgroundColor = UIColor(red: 232/255, green: 207/255, blue: 190/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
    let line1 : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Line"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    let label1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.text = "Already our user?"
        label.textAlignment = .center
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        return label
        }()
    let line2 : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Line"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    let signin: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue with your existing account", for: .normal)
        button.backgroundColor = UIColor(red: 232/255, green: 207/255, blue: 190/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
    let arrow : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Arrow"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        setUI()
        
        
    }

    
    func setUI(){
        view.backgroundColor = .white
        view.addSubview(logo)
        view.addSubview(appname)
        view.addSubview(firstpage)
        view.addSubview(startButton)
        view.addSubview(label1)
        view.addSubview(signin)
        view.addSubview(line1)
        view.addSubview(line2)
        view.addSubview(arrow)
        
        

        startButton.addTarget(self, action: #selector(go), for: .touchUpInside)
        signin.addTarget(self, action: #selector(go), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            logo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            logo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -150),
            logo.heightAnchor.constraint(equalToConstant: 70),
            
            appname.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            appname.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            appname.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            firstpage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstpage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            firstpage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -10),
            firstpage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10),
            firstpage.heightAnchor.constraint(equalToConstant: 350),
            firstpage.widthAnchor.constraint(equalToConstant: 350),
            
            startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 480),
            startButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            startButton.heightAnchor.constraint(equalToConstant: 45),
            
            line1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 545),
            line1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -100),
            line1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -140),
            line1.heightAnchor.constraint(equalToConstant: 70),
            
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 350),
            label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            label1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            label1.heightAnchor.constraint(equalToConstant: 460),
          
            line2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 545),
            line2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -10),
            line2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 250),
            line2.heightAnchor.constraint(equalToConstant: 70),
            
            signin.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
            signin.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            signin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            signin.heightAnchor.constraint(equalToConstant: 100),
            
            arrow.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 641),
            arrow.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            arrow.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 310),
            arrow.heightAnchor.constraint(equalToConstant: 20),
            
            
        ])
    }
    
    @objc func go(){
            navigationController?.pushViewController(SignIn(), animated: true)
        }
}


