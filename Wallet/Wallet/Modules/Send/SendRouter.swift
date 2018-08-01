import UIKit
import WalletKit
import GrouviActionSheet

class SendRouter {
    weak var viewController: UIViewController?
}

extension SendRouter: ISendRouter {

    func startScan() {
        print("start scan")
    }

}

extension SendRouter {

    static func module(coin: Coin) -> ActionSheetController {
        let router = SendRouter()
        let interactor = SendInteractor(coin: coin, databaseManager: DatabaseManager())
        let presenter = SendPresenter(interactor: interactor, router: router, coinCode: coin.code)
        let sendAlertModel = SendAlertModel(viewDelegate: presenter, coin: coin)
        let viewController = ActionSheetController(withModel: sendAlertModel, actionStyle: .sheet(showDismiss: false))

        interactor.delegate = presenter
        presenter.view = sendAlertModel
        router.viewController = viewController

        return viewController
    }

}
