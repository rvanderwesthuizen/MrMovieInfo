//
//  TrailerViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/24.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController {
    @IBOutlet private weak var webView: WKWebView!
    @IBOutlet private weak var returnButton: UIButton!
    
    private var viewModel: TrailerViewModel!
    
    init(movieTitle: String) {
        viewModel = TrailerViewModel(movieTitle: movieTitle, repository: YoutubeRepository())
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        styleButton()
    }
    
    private func displayTrailer() {
        guard let id = viewModel.videoID else { return }
        guard let url = URL(string: "https://www.youtube.com/embed/\(id)") else { return }
        webView.load(URLRequest(url: url))
    }
    
    private func styleButton() {
        returnButton.tintColor = MyAppStyle.accentColor
        returnButton.titleLabel?.font = MyAppStyle.buttonTextFont
    }
    
    @IBAction func didTapReturnButton(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
}

extension TrailerViewController: ViewModelDelegate {
    func refreshViewContent(navigateToMovieDetailsFlag: Bool) {
        displayTrailer()
    }
    
    func didFailWithError(error: Error) {
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "OK")
    }
}
