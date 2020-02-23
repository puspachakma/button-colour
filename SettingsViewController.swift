
import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var ClickBtn: UIButton!
    
    @IBOutlet weak var ClrChng: UILabel!
    
    
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if (sender.isOn == true){
            //            ClrChng.backgroundColor = UIColor.init(red: 118, green: 20, blue: 174, alpha: 0)
            //            UserDefaults.standard.set(true, forKey: "NavChange")
            
            
            self.navigationController!.navigationBar.barTintColor = UIColor.blue
            //  self.tabBarController!.tabBar.barTintColor = UIColor.blue
            // self.tabBarController?.tabBar.backgroundColor = UIColor.blue
            // self.tabBarController?.tabBar.barTintColor =  UIColor(displayP3Red: 118, green: 20, blue: 174, alpha: 1)
            
            //MARK: for tabbar
             UserDefaults.standard.set(true, forKey: "On")
            
        }
        else{
            self.navigationController?.navigationBar.barTintColor = UIColor.green
            
            //tabBar.barTintColor = UIColor.black
            //MARK: for tabbar
            UserDefaults.standard.set(false, forKey: "On")
            
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UserDefaults.standard.set(true, forKey: "key")
        tabBarController?.tabBar.barTintColor = UIColor.black
        
        ClickBtn.layer.cornerRadius = 15
        ClickBtn.backgroundColor = UIColor.green
        
        // self.tabBar.barTintColor = .blueColor()
        
    }
    
    
    @IBAction func goViewcontroller(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    @IBAction func ClickAction(_ sender: Any) {
        ChangeColor()
    }
    
    func ChangeColor() {
        if ClickBtn.backgroundColor == UIColor.green {
            ClickBtn.backgroundColor = UIColor.red
        }else{
            ClickBtn.backgroundColor = UIColor.green
        }
        
    }
    
}
