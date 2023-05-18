import UIKit

class FitnessGoal: UIViewController {
    
    let fitnessgoal : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
        label.textColor = .black
        label.text = "What is your fitness goal?"
        label.numberOfLines = 2;
        label.textAlignment = .center
        return label
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .black
        label.text = "Knowing your goal helps us tailor your experience.."
        label.numberOfLines = 3;
        label.textAlignment = .left
        return label
    }()
    
    let stayhealthy: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 8
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
    let stayhealthy1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "Stay Healthy"
        label.textAlignment = .left
        return label
    }()
    let stayhealthy2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 91/255, alpha: 1.0)
        label.text = "I have a healthy lifestyle and I want to stick to it"
        label.numberOfLines = 2;
        label.textAlignment = .left
        return label
    }()
    let getfit: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 8
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
    let getfit1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "Get Fit"
        label.textAlignment = .left
        return label
    }()
    let getfit2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 91/255, alpha: 1.0)
        label.text = "I want to improve my overal fitness"
        label.numberOfLines = 2;
        label.textAlignment = .left
        return label
    }()
    let buildmuscle : UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 8
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
    let buildmuscle1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "Build Muscle"
        label.textAlignment = .left
        return label
    }()
    let buildmuscle2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 91/255, alpha: 1.0)
        label.text = "I want to see real muscle growth"
        label.numberOfLines = 2;
        label.textAlignment = .left
        return label
    }()
    let loseweight: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 8
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
    let loseweight1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "Lose Weight"
        label.textAlignment = .left
        return label
    }()
    let loseweight2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 91/255, alpha: 1.0)
        label.text = "I want to slim down and feel better"
        label.numberOfLines = 2;
        label.textAlignment = .left
        return label
    }()
    let nextbutton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
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
        
        view.addSubview(fitnessgoal)
        view.addSubview(label)
        view.addSubview(stayhealthy)
        view.addSubview(stayhealthy1)
        view.addSubview(stayhealthy2)
        view.addSubview(getfit)
        view.addSubview(getfit1)
        view.addSubview(getfit2)
        view.addSubview(buildmuscle)
        view.addSubview(buildmuscle1)
        view.addSubview(buildmuscle2)
        view.addSubview(loseweight)
        view.addSubview(loseweight1)
        view.addSubview(loseweight2)
        view.addSubview(nextbutton)
        
        
        nextbutton.addTarget(self, action: #selector(go), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            fitnessgoal.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            fitnessgoal.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            fitnessgoal.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            stayhealthy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 170),
            stayhealthy.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            stayhealthy.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            stayhealthy.heightAnchor.constraint(equalToConstant: 80),
            
            stayhealthy1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            stayhealthy1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            stayhealthy1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            stayhealthy2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 205),
            stayhealthy2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            stayhealthy2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            getfit.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 280),
            getfit.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            getfit.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            getfit.heightAnchor.constraint(equalToConstant: 80),
            
            getfit1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            getfit1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            getfit1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            getfit2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 325),
            getfit2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            getfit2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            buildmuscle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 390),
            buildmuscle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            buildmuscle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            buildmuscle.heightAnchor.constraint(equalToConstant: 80),
            
            buildmuscle1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 410),
            buildmuscle1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            buildmuscle1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            buildmuscle2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 435),
            buildmuscle2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            buildmuscle2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            loseweight.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500),
            loseweight.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            loseweight.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            loseweight.heightAnchor.constraint(equalToConstant: 80),
            
            loseweight1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 520),
            loseweight1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            loseweight1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            loseweight2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 545),
            loseweight2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            loseweight2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            nextbutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 620),
            nextbutton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            nextbutton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            nextbutton.heightAnchor.constraint(equalToConstant: 45),

        ])
    }
    @objc func go(){
            navigationController?.pushViewController(ActivityLevel(), animated: true)
        }
}
    

