//
//  ViewControllersFactoryProtocol.swift
//  Reminder
//
//  Created by Matheus Gabriel on 29/03/25.
//

import Foundation

protocol ViewControllersFactoryProtocol: AnyObject {
  func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
  func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController
  func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController
  func makeRecipesViewController() -> NewReceiptController
  func makeMyReceiptsController(flowDelegate: MyReceiptsFlowDelegate) -> MyReceiptsViewController
}
