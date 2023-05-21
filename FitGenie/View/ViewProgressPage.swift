import UIKit
import SnapKit

class ViewProgressPage: UIViewController {
    
    
    private var chartView: ChartView!
    
    let progress: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 35)
        label.textColor = .black
        label.text = "Progress"
        label.textAlignment = .center
        return label
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 143/255, green: 143/255, blue: 137/255, alpha: 1.0)
        label.text = "Your body weight has undergone fluctuations in the past six months."
        label.textAlignment = .center
        return label
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Chart"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupChartView()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(progress)
        view.addSubview(label)
        view.addSubview(image)
        
        progress.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-30)
            make.centerX.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(progress.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
        }
        
        image.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-150)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 300, height: 300))
        }
    }
    
    // MARK:- Functions
    
    func setupChartView() {
        chartView = ChartView(frame: CGRect(x: 10, y: 280, width: 380, height: 180))
        chartView.backgroundColor = .white
        let data: [CGFloat] = [80, 40, 20, 77, 65, 45]
        
        chartView.updateChart(with: data)
        view.addSubview(chartView)
        
        chartView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(200)
        }

    }
}

class ChartView: UIView {
    
    private var dataEntries: [CGFloat] = []
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let chartWidth = rect.width
        let chartHeight = rect.height - 20
        
        let columnXPoint = { (column: Int) -> CGFloat in
            let spacing = chartWidth / CGFloat(self.dataEntries.count + 1)
            return CGFloat(column + 1) * spacing
        }
        
        let columnYPoint = { (value: CGFloat) -> CGFloat in
            let maxValue = self.dataEntries.max() ?? 0
            let yScale = (chartHeight - 20) / maxValue
            return chartHeight - value * yScale
        }
        
        // Draw bars for bar chart
        let barWidth: CGFloat = 30
        let barSpacing: CGFloat = 20
        var xPosition: CGFloat = 55
        
        for (_, value) in dataEntries.enumerated() {
            let columnHeight = columnYPoint(value)
            let barRect = CGRect(x: xPosition, y: columnHeight, width: barWidth, height: chartHeight - columnHeight)
            
            context.setFillColor(CGColor(red: 232/255, green: 207/255, blue: 190/255, alpha: 1.0))
            context.fill(barRect)
            context.fillPath()
            
            xPosition += barSpacing + barWidth
        }
        
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setLineWidth(2.0)
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: columnXPoint(0), y: columnYPoint(dataEntries[0])))
        
        for i in 1..<dataEntries.count {
            let nextPoint = CGPoint(x: columnXPoint(i), y: columnYPoint(dataEntries[i]))
            linePath.addLine(to: nextPoint)
        }
        
        context.addPath(linePath.cgPath)
        context.strokePath()
    }
    
    func updateChart(with data: [CGFloat]) {
        dataEntries = data
        setNeedsDisplay()
    }
}

