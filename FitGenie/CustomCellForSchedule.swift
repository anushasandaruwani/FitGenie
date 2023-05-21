import UIKit

class CustomCellForSchedule: UITableViewCell {

    static let identifier = "CustomCellForSchedule"
    
    private let myImageView : UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "questionmark")
        image.tintColor = .label
        return image
    }()
    
    private let myLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 26, weight: .thin)
        label.text = "Error"
        return label
    }()
    
    private let myLabelMini : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .thin)
        label.numberOfLines = 0
        label.text = "Error"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Configuring Table
    
    func configure(with image: UIImage, label: String, labelMini:String){
        self.myImageView.image = image
        self.myLabel.text = label
        self.myLabelMini.text = labelMini
    }
    
    
    private func setupUI(){
        self.contentView.addSubview(myImageView)
        self.contentView.addSubview(myLabel)
        self.contentView.addSubview(myLabelMini)
        
        //Constraints
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabelMini.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            myImageView.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
            myImageView.widthAnchor.constraint(equalToConstant: 80),
            myImageView.heightAnchor.constraint(equalToConstant: 80),
            
            myLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            myLabel.leftAnchor.constraint(equalTo: myImageView.rightAnchor, constant: 20),
            
            myLabelMini.topAnchor.constraint(equalTo: myLabel.topAnchor),
            myLabelMini.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            myLabelMini.leftAnchor.constraint(equalTo: myImageView.rightAnchor, constant: 20),
        ])

    }
}
