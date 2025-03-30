//
//  ReminderFlwController.swift
//  Reminder
//
//  Created by Matheus Gabriel on 29/03/25.
//

import Foundation
import UIKit

class ReminderFlowController {
  // MARK: Properties
  private var navigationController: UINavigationController?
  private let viewControllerFactory: ViewControllersFactoryProtocol
  
  
  // MARK: Init
  public init() {
    self.viewControllerFactory = ViewControllersFactory()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: StartFlow
  func start() -> UINavigationController? {
    let startViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self)
    self.navigationController = UINavigationController(rootViewController: startViewController)
    return navigationController
  }
 
}

// MARK: Splash
extension ReminderFlowController: SplashFlowDelegate {
  func openLoginBottomSheet() {
    let loginBottomSheet = viewControllerFactory.makeLoginBottomSheetViewController(flowDelegate: self)
    loginBottomSheet.modalPresentationStyle = .overCurrentContext
    loginBottomSheet.modalTransitionStyle = .crossDissolve
    navigationController?.present(loginBottomSheet, animated: false) {
      loginBottomSheet.animateShow()
    }
    func navigateToHome() {
      self.navigationController?.dismiss(animated: false)
      let viewController = UIViewController()
      viewController.view.backgroundColor = .red
      self.navigationController?.pushViewController(viewController, animated: true)
    }
  }
}


//MARK: Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
  func navigateToHome() {
    self.navigationController?.dismiss(animated: false)
    let viewController = UIViewController()
    viewController.view.backgroundColor = .red
    self.navigationController?.pushViewController(viewController, animated: true)
  }  
}
