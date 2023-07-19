//
//  Extensions.swift
//  SunBeltRentals
//
//  Created by Sarath NS on 13/05/22.
//

import Foundation
import UIKit

extension UITextField {
    
    enum PaddingSpace {
        case left(CGFloat)
        case right(CGFloat)
        case equalSpacing(CGFloat)
    }
    
    func addPadding(padding: PaddingSpace) {
        
        leftViewMode = .always
        layer.masksToBounds = true
        
        switch padding {
            
        case .left(let spacing):
            let leftPaddingView = UIView(
                frame: CGRect(
                    x: 0,
                    y: 0,
                    width: spacing,
                    height: frame.height
                )
            )
            leftView = leftPaddingView
            leftViewMode = .always
            
        case .right(let spacing):
            let rightPaddingView = UIView(
                frame: CGRect(
                    x: 0,
                    y: 0,
                    width: spacing,
                    height: frame.height
                )
            )
            rightView = rightPaddingView
            rightViewMode = .always
            
        case .equalSpacing(let spacing):
            let equalPaddingView = UIView(
                frame: CGRect(
                    x: 0,
                    y: 0,
                    width: spacing,
                    height: frame.height
                )
            )
            // left
            leftView = equalPaddingView
            leftViewMode = .always
            // right
            rightView = equalPaddingView
            rightViewMode = .always
        }
    }
}

extension UIColor {
    convenience init(_ r: Double,_ g: Double,_ b: Double,_ a: Double) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}

extension UIViewController  {
    func add(asChildViewController viewController: UINavigationController, baseView: UIView) {
        addChild(viewController)
        baseView.addSubview(viewController.view)
        viewController.view.frame = baseView.bounds
        viewController.didMove(toParent: self)
    }
    
    func remove(asChildViewController viewController: UINavigationController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}

extension UIWindow {
    func topViewController() -> UIViewController? {
        var top = self.rootViewController
        while true {
            if let presented = top?.presentedViewController {
                top = presented
            } else if let nav = top as? UINavigationController {
                top = nav.visibleViewController
            } else if let tab = top as? UITabBarController {
                top = tab.selectedViewController
            } else {
                break
            }
        }
        return top
    }
}

extension UIStoryboard {
    func instantiateConcreteViewController<T>(identifier: String = String(describing: T.self)) -> T where T: UIViewController {
        guard let viewController = instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Developer error. Not Found view controller ")
        }
        return viewController
    }
}

extension UIViewController {
    func add(asChildViewController viewController: UIViewController, baseView: UIView) {
        addChild(viewController)
        baseView.addSubview(viewController.view)
        viewController.view.frame = baseView.bounds
        viewController.didMove(toParent: self)
    }
    
    func remove(asChildViewController viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
