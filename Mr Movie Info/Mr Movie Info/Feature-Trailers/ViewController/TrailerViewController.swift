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
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    private lazy var viewModel = TrailerViewModel(repository: YoutubeRepository(), delegate: self)
    
    init(movieTitle: String) {
        super.init(nibName: nil, bundle: nil)
        viewModel.setupWith(title: movieTitle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleButton()
        
        activityIndicator.color = MyAppStyle.accentColor
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }
    
    private func displayTrailer() {
        guard let id = viewModel.videoID else { return }
        guard let url = URL(string: "https://www.youtube.com/embed/\(id)") else { return }
        webView.load(URLRequest(url: url))
        activityIndicator.stopAnimating()
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
        activityIndicator.stopAnimating()
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "OK")
    }
}
