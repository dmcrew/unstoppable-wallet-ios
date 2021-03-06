protocol IBalanceErrorView: class {
    func set(coinTitle: String)
    func setChangeSourceButton(hidden: Bool)
    func openReport(email: String, error: String)
}

protocol IBalanceErrorViewDelegate {
    func onLoad()
    func onTapRetry()
    func onTapChangeSource()
    func onTapReport()

    func onTapClose()
}

protocol IBalanceErrorInteractor {
    var contactEmail: String { get }
    func refresh(wallet: Wallet)
}

protocol IBalanceErrorInteractorDelegate: class {
}

protocol IBalanceErrorRouter {
    func close()
    func closeAndOpenPrivacySettings()
}
