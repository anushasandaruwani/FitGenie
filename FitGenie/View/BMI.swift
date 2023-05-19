import UIKit

class BMI: UIViewController {
    
    let bmi : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
        label.textColor = .black
        label.text = "Your BMI"
        label.textAlignment = .center
        return label
    }()
    
    let label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "Discover your body mass index for a healthier you."
        label.numberOfLines = 3;
        label.textAlignment = .left
        return label
    }()
    
    let bmiImage : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "BMI"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    
    let yourBMI : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let dots : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Dots"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    
    let bmirange : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "18.5 - 24.9 Normal Range                16.0 - 18.4 Under Weight Range              25.0 - 29.9 Overweight Range"
        label.numberOfLines = 3;
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
        calBMI()
 
    }
    
    func calBMI(){
        let data = UserDefaults.standard
        
        let w = data.double(forKey: "weight")
        let h = data.double(forKey: "height")
        
        let bmi = (w/h/h) * 10000
        
        let bmiStr = String(format: "%.2f", bmi)
        
        data.set(bmiStr, forKey: "bmi")
        
        //let bm = data.string(forKey: "bmi")
        
        yourBMI.text = String(bmiStr)
        
        if(bmi<18.5){
            print("underweight")
        }
        else if(bmi<24.9){
            print("normal")
        }
        else  if(bmi<34.9){
            print("overweight")
        }
        else{
            print("weight:",w,":","heught:",h,"bmi",bmi)
        }
    }
    
    func setUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(bmi)
        view.addSubview(label)
        view.addSubview(yourBMI)
        view.addSubview(bmiImage)
        view.addSubview(bmirange)
        view.addSubview(dots)
        view.addSubview(nextbutton)
        
        nextbutton.addTarget(self, action: #selector(go), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            bmi.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            bmi.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            bmi.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            bmiImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bmiImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            bmiImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            bmiImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            bmiImage.heightAnchor.constraint(equalToConstant: 250),
            bmiImage.widthAnchor.constraint(equalToConstant: 250),
            
            yourBMI.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 420),
            yourBMI.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            yourBMI.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            yourBMI.heightAnchor.constraint(equalToConstant: 70),
            
            dots.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dots.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 520),
            dots.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            dots.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -250),
            dots.heightAnchor.constraint(equalToConstant: 65),
            dots.widthAnchor.constraint(equalToConstant: 65),
            
            bmirange.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 520),
            bmirange.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            bmirange.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            nextbutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 620),
            nextbutton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            nextbutton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            nextbutton.heightAnchor.constraint(equalToConstant: 45),

        ])
    }
    @objc func go(){
        let tabBarController = UITabBarController()
        
        
        
        let home = UINavigationController(rootViewController: ViewHomePage())
        let schedule = UINavigationController(rootViewController: ViewSchedulePage())
        let progress = UINavigationController(rootViewController: ViewProgressPage())
        let profile = UINavigationController(rootViewController: ViewProfilePage())
        
        home.title = "Home"
        schedule.title = "Schedule"
        progress.title = "Progress"
        profile.title = "Profile"
        
        tabBarController.setViewControllers([home,schedule,progress,profile], animated: false)
        
        guard let items = tabBarController.tabBar.items else {
            return
        }
        
        let images = ["house","calendar","chart.xyaxis.line","person.crop.circle"]
    
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
            items[x].badgeColor = UIColor.orange
        }
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.backgroundColor = .white
        tabBarAppearance.tintColor = .orange
        
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: true)
            }
}
