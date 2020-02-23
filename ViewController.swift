//
//  ViewController.swift
//  TabbarIrfan
//
//  Created by apple on 2/18/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController,UITabBarDelegate {
    
    
    
    
    func mapView()  {
        let camera = GMSCameraPosition.camera(withLatitude: 23.805292, longitude: 90.369785, zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 23.805292, longitude: 90.369785)
        marker.map = mapView
        
    }
    
      var fvc = UIViewController()

    @IBOutlet weak var tabBar: UITabBar!
    
    @IBOutlet weak var containerView: UIView!
    
    
    
    let SlideInHandlr = SooninSlideInHandler()
    
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch item.tag {
        case 0:
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            fvc = vc
            self.add(vc, frame: self.containerView.frame)
            
            break
            
        case 1:
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
            fvc = vc
            self.add(vc, frame: self.containerView.frame)
            break
        case 2:
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            fvc = vc
            self.add(vc, frame: self.containerView.frame)
            break
            case 3:
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            fvc = vc
            self.add(vc, frame: self.containerView.frame)
            break
            case 4:
                       fvc.remove()
                       let vc = storyboard?.instantiateViewController(withIdentifier: "LogOutViewController") as! LogOutViewController
                       fvc = vc
                       self.add(vc, frame: self.containerView.frame)
                       break
        default:
            break
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let vc = SettingsViewController()
        //MARK: TABbar transparent
        self.tabBar.unselectedItemTintColor = UIColor(red: 17.0/255.0, green: 70.0/255.0, blue: 95.0/255.0, alpha: 0.4)
               self.tabBar.barTintColor = UIColor(red: 17.0/255.0, green: 70.0/255.0, blue: 95.0/255.0, alpha: 0.5)
        
        let a = UserDefaults.standard.bool(forKey: "On")
      // let b = UserDefaults.standard.bool(forKey: "Off")
        
       // print(a)
        
        
        if a == true {
            print("i am true")
            tabBar.barTintColor = UIColor.blue
        }else if a == false {
            tabBar.barTintColor = UIColor.green
            print("i am false")
        }else{
           // tabBar.barTintColor = UIColor.red
            print("nothoing found")
        }
        
      
        
        tabBar.delegate = self
        SlideInHandlr.selectionDelegate = self
        UserDefaults.standard.bool(forKey: "NavChange")
//        UINavigationBar.appearance().barTintColor = UIColor.black
      //  self.navigationController?.navigationBar.translucent = true

//        self.navigationController!.navigationBar.barTintColor = UIColor.blue
       
       
        
       //  self.tabBarController?.tabBar.barTintColor = UIColor.red
    }

    @IBAction func SlideShowAction(_ sender: Any) {
        
        var myMenuSetting : [Setting] = []
           myMenuSetting.append(Setting(name: "Home", imageName: "home"))
           myMenuSetting.append(Setting(name: "About", imageName: "about"))
           myMenuSetting.append(Setting(name: "Settings", imageName: "settings"))
           myMenuSetting.append(Setting(name: "Social", imageName: "social"))
           myMenuSetting.append(Setting(name: "LogOut", imageName: "login"))
        
           
           SlideInHandlr.settings = myMenuSetting
           SlideInHandlr.menuBackColor = UIColor.white

           SlideInHandlr.showSlideInMenu(menuSide: .Left)
        
    }
    
}
extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)
        if let frame = frame {
            child.view.frame = frame
        }
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()

   }

}
extension ViewController: SelectionDelegate{
    func didTapSelect(menuSelection: String, description: String) {
//          print("select : \(ShowLabelBtn)")
//              self.ShowLabelBtn.text = description
        if menuSelection == "Home"{
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            fvc = vc
            self.add(vc, frame: self.containerView.frame)
            
        }
        if menuSelection == "About"{
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
            fvc = vc
            self.add(vc, frame: self.containerView.frame)
            
        }
        if menuSelection == "Settings"{
            fvc.remove()
            let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            fvc = vc
            self.add(vc, frame: self.containerView.frame)
            
        }
        if menuSelection == "Social"{
                   fvc.remove()
                   let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                   fvc = vc
                   self.add(vc, frame: self.containerView.frame)
                   
               }
        if menuSelection == "LogOut"{
                   fvc.remove()
                   let vc = storyboard?.instantiateViewController(withIdentifier: "LogOutViewController") as! LogOutViewController
                   fvc = vc
                   self.add(vc, frame: self.containerView.frame)
                   
               }
    }
    
    
}
