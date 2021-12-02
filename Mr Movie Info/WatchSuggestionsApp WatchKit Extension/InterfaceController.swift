//
//  InterfaceController.swift
//  WatchSuggestionsApp WatchKit Extension
//
//  Created by Ruan van der Westhuizen on 2021/12/01.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {
    
    @IBOutlet private weak var suggestionLabel: WKInterfaceLabel!
    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    @IBOutlet weak var addToWatchlistButton: WKInterfaceButton!
    @IBOutlet weak var posterImageView: WKInterfaceImage!
    
    private var watchSession: WCSession?
    private var movieTitle = ""
    
    override func awake(withContext context: Any?) {
        if WCSession.isSupported() {
            watchSession = WCSession.default
            watchSession?.delegate = self
            watchSession?.activate()
        }
    }
    
    override func willActivate() { }
    override func didDeactivate() { }
    
    @IBAction func didTapAddToWatchlistButton() {
        sendMessage()
    }
    
    private func sendMessage() {
        if movieTitle.isEmpty {
            presentAlert(withTitle: "Error", message: "Movie Title wasn't set", preferredStyle: .alert, actions: [WKAlertAction(title: "OK", style: .default, handler: {
            })])
        } else {
            watchSession?.sendMessage(["movieTitle": movieTitle], replyHandler: nil, errorHandler: nil)
        }
    }
}

extension InterfaceController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let suggestion = message["suggestion"] as? [String] {
            movieTitle = suggestion[0]
            titleLabel.setText(suggestion[0])
            addToWatchlistButton.setTitle("View details of\n\(suggestion[0])")
            posterImageView.loadImage(urlString: suggestion[1])
        }
    }
}
