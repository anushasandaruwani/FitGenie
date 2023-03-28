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
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.backgroundColor = UIColor(red: 167/255, green: 206/255, blue: 190/255, alpha: 1.0)
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
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        label.text = "Already our user?"
        label.textAlignment = .center
        return label
        }()
    let line2 : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Line"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    let label2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.text = "Continue with your existing account"
        label.textAlignment = .center
        label.textColor = UIColor(red: 6/255, green: 57/255, blue: 112/255, alpha: 1.0)
        return label
        }()
    let arrow : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Arrow"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        
    }

    
    func setUI(){
        view.backgroundColor = .white
        view.addSubview(logo)
        view.addSubview(appname)
        view.addSubview(firstpage)
        view.addSubview(startButton)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(line1)
        view.addSubview(line2)
        view.addSubview(arrow)
        
        
        startButton.addTarget(self, action: #selector(go), for: .touchUpInside)
        
        
        
        NSLayoutConstraint.activate([
            
            
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            logo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            logo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -150),
            logo.heightAnchor.constraint(equalToConstant: 70),
            logo.widthAnchor.constraint(equalToConstant: 70),
            
            appname.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            appname.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            appname.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            appname.heightAnchor.constraint(equalToConstant: 50),
            appname.widthAnchor.constraint(equalToConstant: 50),
            
            
            firstpage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstpage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            firstpage.heightAnchor.constraint(equalToConstant: 460),
            firstpage.widthAnchor.constraint(equalToConstant: 460),
            
            startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500),
            startButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 50),
            
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 90),
            label1.heightAnchor.constraint(equalToConstant: 460),
            label1.widthAnchor.constraint(equalToConstant: 460),
            
            label2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 180),
            label2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            label2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            label2.heightAnchor.constraint(equalToConstant: 500),
            label2.widthAnchor.constraint(equalToConstant: 500),
            
            line1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -105),
            line1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            line1.heightAnchor.constraint(equalToConstant: 70),
            line1.widthAnchor.constraint(equalToConstant: 70),
            
            line2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -105),
            line2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            line2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 250),
            line2.heightAnchor.constraint(equalToConstant: 70),
            line2.widthAnchor.constraint(equalToConstant: 70),
            
            arrow.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            arrow.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            arrow.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 320),
            arrow.heightAnchor.constraint(equalToConstant: 20),
            arrow.widthAnchor.constraint(equalToConstant: 20),
            
            
        ])
    }
    
    @objc func go(){
            navigationController?.pushViewController(SignIn(), animated: true)
        }
}


