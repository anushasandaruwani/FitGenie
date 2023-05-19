import UIKit

class ActivityLevel: UIViewController {
    
    let activitylevel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
        label.textColor = .black
        label.text = "How fit are you right now?"
        label.numberOfLines = 2;
        label.textAlignment = .center
        return label
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "Based on your current activity level."
        label.numberOfLines = 3;
        label.textAlignment = .left
        return label
    }()
    let beginner: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 8
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let beginner1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "Absolute Beginner"
        label.textAlignment = .left
        return label
    }()
    let beginner2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 91/255, alpha: 1.0)
        label.text = "I can't do 10 sit-ups in a row or a single push-up"
        label.numberOfLines = 2;
        label.textAlignment = .left
        return label
    }()
    let moderatelyfit: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 8
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let moderatelyfit1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "Moderately fit"
        label.textAlignment = .left
        return label
    }()
    let moderatelyfit2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 91/255, alpha: 1.0)
        label.text = "I can do at least 15 sit-ups in a row and 5 push-ups"
        label.numberOfLines = 2;
        label.textAlignment = .left
        return label
    }()
    let fit : UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 8
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let fit1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "Fit"
        label.textAlignment = .left
        return label
    }()
    let fit2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 91/255, alpha: 1.0)
        label.text = "I can do more than 25 sit-ups and 10 push-ups easily"
        label.numberOfLines = 2;
        label.textAlignment = .left
        return label
    }()
    let ingreateshape : UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 8
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let ingreateshape1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "In Greate Shape"
        label.textAlignment = .left
        return label
    }()
    let ingreateshape2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor(red: 95/255, green: 95/255, blue: 91/255, alpha: 1.0)
        label.text = "I can do more than 35 sit-ups and 15 push-ups easily without a break"
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
        
        view.addSubview(activitylevel)
        view.addSubview(label)
        view.addSubview(beginner)
        view.addSubview(beginner1)
        view.addSubview(beginner2)
        view.addSubview(moderatelyfit)
        view.addSubview(moderatelyfit1)
        view.addSubview(moderatelyfit2)
        view.addSubview(fit)
        view.addSubview(fit1)
        view.addSubview(fit2)
        view.addSubview(ingreateshape)
        view.addSubview(ingreateshape1)
        view.addSubview(ingreateshape2)
        view.addSubview(nextbutton)
        
        nextbutton.addTarget(self, action: #selector(go), for: .touchUpInside)
        
        beginner.addTarget(self, action: #selector(level1), for: .touchUpInside)
        moderatelyfit.addTarget(self, action: #selector(level2), for: .touchUpInside)
        fit.addTarget(self, action: #selector(level3), for: .touchUpInside)
        ingreateshape.addTarget(self, action: #selector(level4), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            activitylevel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            activitylevel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            activitylevel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            beginner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 170),
            beginner.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            beginner.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            beginner.heightAnchor.constraint(equalToConstant: 80),
            
            beginner1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 180),
            beginner1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            beginner1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            beginner2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 205),
            beginner2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            beginner2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            moderatelyfit.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 280),
            moderatelyfit.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            moderatelyfit.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            moderatelyfit.heightAnchor.constraint(equalToConstant: 80),
            
            moderatelyfit1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 290),
            moderatelyfit1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            moderatelyfit1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            moderatelyfit2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 315),
            moderatelyfit2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            moderatelyfit2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            fit.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 390),
            fit.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            fit.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            fit.heightAnchor.constraint(equalToConstant: 80),
            
            fit1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
            fit1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            fit1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            fit2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 425),
            fit2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            fit2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            ingreateshape.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500),
            ingreateshape.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            ingreateshape.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            ingreateshape.heightAnchor.constraint(equalToConstant: 80),
            
            ingreateshape1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 510),
            ingreateshape1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            ingreateshape1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            ingreateshape2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 535),
            ingreateshape2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            ingreateshape2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            
            nextbutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 620),
            nextbutton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            nextbutton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            nextbutton.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    @objc func go(){
        navigationController?.pushViewController(BMI(), animated: true)
    }
    
    @objc func level1(){
        beginner.backgroundColor = UIColor(red: 250/255, green: 239/255, blue: 235/255, alpha: 1.0)
        moderatelyfit.backgroundColor = .clear
        fit.backgroundColor = .clear
        ingreateshape.backgroundColor = .clear
        
        
    }
    
    @objc func level2(){
        beginner.backgroundColor = .clear
        moderatelyfit.backgroundColor = UIColor(red: 250/255, green: 239/255, blue: 235/255, alpha: 1.0)
        fit.backgroundColor = .clear
        ingreateshape.backgroundColor = .clear
        
        
    }
    @objc func level3(){
        beginner.backgroundColor = .clear
        moderatelyfit.backgroundColor = .clear
        fit.backgroundColor = UIColor(red: 250/255, green: 239/255, blue: 235/255, alpha: 1.0)
        ingreateshape.backgroundColor = .clear
        
        
    }
    
    @objc func level4(){
        beginner.backgroundColor = .clear
        moderatelyfit.backgroundColor = .clear
        fit.backgroundColor = .clear
        ingreateshape.backgroundColor = UIColor(red: 250/255, green: 239/255, blue: 235/255, alpha: 1.0)
        
        
    }
    
}

