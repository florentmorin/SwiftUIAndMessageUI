//
//  ContentView.swift
//  MailDemo
//
//  Created by Florent Morin on 29/06/2019.
//  Copyright © 2019 Morin Innovation. All rights reserved.
//

import SwiftUI
import MessageUI

/// Main View
struct ContentView: View {

    /// The delegate required by `MFMailComposeViewController`
    private let mailComposeDelegate = MailDelegate()

    /// The delegate required by `MFMessageComposeViewController`
    private let messageComposeDelegate = MessageDelegate()


    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                self.presentMailCompose()
            }) {
                Text("Send email")
            }
            Spacer()
            Button(action: {
                self.presentMessageCompose()
            }) {
                Text("Send message")
            }
            Spacer()
        }
    }

}

// MARK: The mail part
extension ContentView {

    /// Delegate for view controller as `MFMailComposeViewControllerDelegate`
    private class MailDelegate: NSObject, MFMailComposeViewControllerDelegate {

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            // Customize here
            controller.dismiss(animated: true)
        }

    }

    /// Present an mail compose view controller modally in UIKit environment
    private func presentMailCompose() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        let vc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController

        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = mailComposeDelegate

        // Customize here

        vc?.present(composeVC, animated: true)
    }
}

// MARK: The message part
extension ContentView {

    /// Delegate for view controller as `MFMessageComposeViewControllerDelegate`
    private class MessageDelegate: NSObject, MFMessageComposeViewControllerDelegate {
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            // Customize here
            controller.dismiss(animated: true)
        }

    }

    /// Present an message compose view controller modally in UIKit environment
    private func presentMessageCompose() {
        guard MFMessageComposeViewController.canSendText() else {
            return
        }
        let vc = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController

        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = messageComposeDelegate

        // Customize here

        vc?.present(composeVC, animated: true)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
