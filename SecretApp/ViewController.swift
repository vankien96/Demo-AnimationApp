
import UIKit
extension UIImage {
    func tint(with color: UIColor) -> UIImage {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        
        image.draw(in: CGRect(origin: .zero, size: size))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        cell.setup(model: tableData[indexPath.row])
        return cell
    }
}

class ViewController: UIViewController {
    
    @IBOutlet var viewTemperature: UIView!
    @IBOutlet var viewDate: UIView!
    @IBOutlet var imgWeather: UIImageView!
    @IBOutlet var btnMenu: UIButton!
    @IBOutlet var btnSearch: UIButton!
    @IBOutlet var btnAlarm: UIButton!
    @IBOutlet var btnMessage: UIButton!
    @IBOutlet var btnNew: UIButton!
    @IBOutlet var btnAdd: UIButton!
    @IBOutlet var btnAddSmall: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var checkButton:Int = 0
    var tableData: [Model] = []
    
    @IBOutlet var backContain: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        Data.getData { (data) in
            self.tableData = data
            self.tableView.reloadData()
        }
        viewDate.transform = CGAffineTransform(translationX: -viewDate.frame.width, y: 0)
        viewTemperature.transform = CGAffineTransform(translationX: viewTemperature.frame.width, y: 0)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAround(_:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(tap)
    }
    func tapAround(_ tap:UITapGestureRecognizer){
        print("tap around")
        if checkButton == 1{
            checkButton = 0
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.btnAddSmall.transform = CGAffineTransform(rotationAngle: CGFloat(0))
                self.backContain.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                self.btnAdd.backgroundColor = #colorLiteral(red: 0.9255, green: 0.3294, blue: 0.3647, alpha: 1)
            }, completion: { (true) in
            })
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        btnAdd.layer.cornerRadius = 25
        backContain.layer.cornerRadius = 160
        self.backContain.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        self.btnAdd.backgroundColor = #colorLiteral(red: 0.9255, green: 0.3294, blue: 0.3647, alpha: 1)
        btnAdd.setTitleColor(UIColor.white, for: .normal)
        btnAddSmall.setImage(btnAddSmall.currentImage?.tint(with: UIColor.white), for: .normal)
        btnNew.setImage(btnNew.currentImage?.tint(with: UIColor.white), for: .normal)
        btnMessage.setImage(btnMessage.currentImage?.tint(with: UIColor.white), for: .normal)
        btnAlarm.setImage(btnAlarm.currentImage?.tint(with: UIColor.white), for: .normal)
        btnMenu.setImage(btnMenu.currentImage?.tint(with: UIColor.white), for: .normal)
        btnSearch.setImage(btnSearch.currentImage?.tint(with: UIColor.white), for: .normal)
        imgWeather.image = UIImage(named: "sun")?.tint(with: UIColor.white)
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.8, options: [.curveLinear], animations: { 
            self.viewDate.transform = .identity
            self.viewTemperature.transform = .identity
        }, completion: nil)
        self.animationCell()
    }
    func animationCell(){
        let cells = tableView.visibleCells
        
        for cell in cells{
            cell.transform = CGAffineTransform(translationX: cell.frame.width, y: 0)
        }
        var delay = 0.5
        for cell in cells{
            UIView.animate(withDuration: 0.5, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
                cell.transform = .identity
            }, completion: nil)
            delay += 0.3
        }
    }
    @IBAction func clickOnButton(_ sender: Any) {
        if checkButton == 0 {
            checkButton = 1
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: { 
                self.btnAddSmall.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/4))
                self.backContain.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.btnAdd.backgroundColor = #colorLiteral(red: 0.7647, green: 0.3294, blue: 0.3647, alpha: 1)
            }, completion: { (true) in
            })
        }else{
            checkButton = 0
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.btnAddSmall.transform = CGAffineTransform(rotationAngle: CGFloat(0))
                self.backContain.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                self.btnAdd.backgroundColor = #colorLiteral(red: 0.9255, green: 0.3294, blue: 0.3647, alpha: 1)
            }, completion: { (true) in
            })
        }
        self.btnMessage.transform = CGAffineTransform(translationX: 7.5, y: 7.5)
        self.btnNew.transform = CGAffineTransform(translationX: 0, y: 10)
        self.btnAlarm.transform = CGAffineTransform(translationX: 10, y: 0)
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            if self.checkButton == 1 {
                self.btnMessage.transform = .identity
                self.btnNew.transform = .identity
                self.btnAlarm.transform = .identity
            }
        }, completion: { (true) in
        })
    }
}
