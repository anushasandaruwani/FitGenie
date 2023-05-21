
import UIKit
import WebKit
import SnapKit

class PlayVideo: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //Variables
    
    var timer: Timer?
    var elapsedTime: TimeInterval = 0.0
    var videoId = "Aq7qermvmXM"
    
    //Components
    
    let webView: WKWebView = {
       let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    let labelWorkout : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.text = "Shoulder Workout"
        label.textAlignment = .left
        return label
    }()
    
    let labelDesc : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "Building your shoulders are all part of creating a defined upper body and should definitely be part of your training"
        label.textAlignment = .left
        return label
    }()
    
    //Get the weights
    
    let labelWeight : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        label.text = "Weight"
        label.textAlignment = .center
        return label
    }()
    
    let weightPicker: UIPickerView = {
            let picker = UIPickerView()
            picker.translatesAutoresizingMaskIntoConstraints = false
            return picker
    }()

    let weightData = stride(from: 0.0, to: 200.5, by: 0.5).map { String(format: "%.1f kg", $0) }
        
    
    let hStackWeight : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    //Get the reps
    
    let labelReps : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        label.text = "Reps"
        label.textAlignment = .center
        return label
    }()
    
    let repetitionsPicker: UIPickerView = {
            let picker = UIPickerView()
            picker.translatesAutoresizingMaskIntoConstraints = false
            return picker
    }()

    let repetitionsData = Array(1...25)
    
    let hStackReps : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    //Get the sets
    
    let labelSets : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        label.text = "Sets"
        label.textAlignment = .center
        return label
    }()
    
    let setsPicker: UIPickerView = {
            let picker = UIPickerView()
            picker.translatesAutoresizingMaskIntoConstraints = false
            return picker
    }()

    let setData = Array(1...10)
    
    let hStackSets : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()


    
    let startButton : UIButton = {
        let button = UIButton()
        button.setTitle("          Start          ", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 232/255, green: 207/255, blue: 190/255, alpha: 1.0)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repetitionsPicker.delegate = self
        repetitionsPicker.dataSource = self
        
        setsPicker.delegate = self
        setsPicker.dataSource = self
        
        //weight
        
        weightPicker.delegate = self
        weightPicker.dataSource = self
        
        setupUI()
    }
    
    func youtubeVideoView(){
        
      
        let embedHTML = "<html><body><iframe width=\"980\" height=\"500\" src=\"https://www.youtube.com/embed/\(videoId)?playsinline=1\" frameborder=\"0\" allowfullscreen></iframe></body></html>"
        webView.loadHTMLString(embedHTML, baseURL: nil)
    }
    
    func setupUI(){
        view.backgroundColor = .white
      
        youtubeVideoView()
        
        view.addSubview(webView)
        view.addSubview(labelWorkout)
        view.addSubview(labelDesc)
        
        hStackReps.addArrangedSubview(labelReps)
        hStackReps.addArrangedSubview(repetitionsPicker)
        
        view.addSubview(hStackReps)
        
        hStackSets.addArrangedSubview(labelSets)
        hStackSets.addArrangedSubview(setsPicker)
        
        
        view.addSubview(hStackSets)
        
        hStackWeight.addArrangedSubview(labelWeight)
        hStackWeight.addArrangedSubview(weightPicker)
        
        view.addSubview(hStackWeight)
        view.addSubview(startButton)
        
        //Button Action
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside) // Add target action
        
        
        //Constraints
        
        labelWorkout.snp.makeConstraints { make in
            make.top.equalTo(webView.snp.bottom).offset(10)
            make.centerX.equalTo(view)
        }

        labelDesc.snp.makeConstraints { make in
            make.top.equalTo(labelWorkout.snp.bottom).offset(5)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.centerX.equalTo(view)
        }
        
        webView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(10)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 300, height: 300))
        }
        
        hStackReps.snp.makeConstraints { make in
            make.top.equalTo(labelDesc.snp.bottom).offset(-20)
            make.left.equalTo(view.snp.left).offset(30)
            make.right.equalTo(view.snp.right).offset(-30)
        }

        repetitionsPicker.snp.makeConstraints { make in
 
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        hStackSets.snp.makeConstraints { make in
            make.top.equalTo(hStackReps.snp.bottom).offset(5)
            make.left.equalTo(view.snp.left).offset(30)
            make.right.equalTo(view.snp.right).offset(-30)
        }
        
        setsPicker.snp.makeConstraints { make in
 
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        hStackWeight.snp.makeConstraints { make in
            make.top.equalTo(hStackSets.snp.bottom).offset(5)
            make.left.equalTo(view.snp.left).offset(30)
            make.right.equalTo(view.snp.right).offset(-30)
        }
        
        weightPicker.snp.makeConstraints { make in
 
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        startButton.snp.makeConstraints { make in
            make.top.equalTo(hStackWeight.snp.bottom).offset(15)
            make.centerX.equalTo(view)
            
        }
        
    }
        
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if pickerView == repetitionsPicker {
                return repetitionsData.count
            } else if pickerView == setsPicker {
                return setData.count
            }else if pickerView == weightPicker {
                return weightData.count
            }
            else {
                return 0
            }
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            
            if pickerView == repetitionsPicker {
                label.text = "\(repetitionsData[row])"
            } else if pickerView == setsPicker {
                label.text = "\(setData[row])"
            }else if pickerView == weightPicker {
                label.text = "\(weightData[row])"
            }
            
            return label
        }
    
    //Functions for startButton
    
    @objc func startButtonTapped() {
            // Create and present the UIAlertController
            let alertController = UIAlertController(title: "Workout Stopwatch", message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Finish", style: .default, handler: { (_) in
                self.stopTimer()
                self.finishStopwatch(alertController)
            }))
            present(alertController, animated: true, completion: nil)
            
            // Start the stopwatch
            startTimer()
        }
        
        func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (_) in
                self.elapsedTime += 1.0
                if let alertController = self.presentedViewController as? UIAlertController {
                    alertController.message = self.formatElapsedTime(self.elapsedTime)
                }
            }
        }
        
        func stopTimer() {
            timer?.invalidate()
            timer = nil
            
        }
        
        func formatElapsedTime(_ elapsedTime: TimeInterval) -> String {
            let minutes = Int(elapsedTime / 60)
            let seconds = Int(elapsedTime.truncatingRemainder(dividingBy: 60))
            return String(format: "%02d:%02d", minutes, seconds)
        }
    
    func finishStopwatch(_ alertController: UIAlertController) {
            alertController.dismiss(animated: true, completion: nil)
            
            print("Total elapsed time: \(formatElapsedTime(elapsedTime))")
            elapsedTime = 0.0
        }


}
