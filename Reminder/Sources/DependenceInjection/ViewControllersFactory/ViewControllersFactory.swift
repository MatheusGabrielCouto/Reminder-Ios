//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Matheus Gabriel on 29/03/25.
//

import Foundation
import UIKit

final class ViewControllersFactory: ViewControllersFactoryProtocol {
  
  func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
    let contentView = SplashView()
    let viewController = SplashViewController(contentView: contentView ,flowDelegate: flowDelegate)
    return viewController
  }
  
  func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController {
    let contentView = LoginBottomSheetView()
    let viewController = LoginBottomSheetViewController(contentView: contentView, flowDelegate: flowDelegate)
    return viewController
  }
  
  func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController {
    let contentView = HomeView()
    let viewController = HomeViewController(contentView: contentView, flowDelegate: flowDelegate)
    return viewController
    
  }
  
  func makeRecipesViewController() -> NewReceiptController {
    let viewController = NewReceiptController()
    return viewController
  }
  
  func makeMyReceiptsController(flowDelegate: MyReceiptsFlowDelegate) -> MyReceiptsViewController {
    let contentView = MyReceiptsView()
    let viewController = MyReceiptsViewController(contentView: contentView, flowDelegate: flowDelegate)
    
    return viewController
  }
  
}
