import UIKit
import WebKit
import SnapKit

class PlayVideo: UIViewController {
    
    let webView: WKWebView = {
           let webView = WKWebView()
            webView.translatesAutoresizingMaskIntoConstraints = false
            return webView
        }()
    
    let videoname : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22)
        label.textColor = .black
        label.text = "10 MIN FULLBODY WORKOUT AT HOME"
        label.numberOfLines = 3;
        label.textAlignment = .left
        return label
    }()
    
    let videodescription : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "If you want fat-burning, follow along this 10 minute fullbody home workout !"
        label.numberOfLines = 3;
        label.textAlignment = .left
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()

    }
    

    
    func youtubeVideoView(){
        let videoId = "N-15wUPnqpc"
        let embedHTML = "<html><body><iframe width=\"980\" height=\"500\"src=\"https://www.youtube.com/embed/\(videoId)?playsinline=1\" frameborder=\"0\" allowfullscreen></iframe></body></html>"
        webView.loadHTMLString(embedHTML, baseURL: nil)
        

        
    }
    func setUI(){
        view.backgroundColor = .white
        
        youtubeVideoView()
        
        view.addSubview(webView)
        view.addSubview(videoname)
        view.addSubview(videodescription)
        
        NSLayoutConstraint.activate([
        
            videoname.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            videoname.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            videoname.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            videodescription.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 260),
            videodescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            videodescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        
        ])
        
        
        webView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(10)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 300, height: 300))
        }
    }
}
