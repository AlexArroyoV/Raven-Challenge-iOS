//
//  NetworkMonitor.swift
//  RavenTest
//
//  Created for debugging challenge
//

import Foundation
import Network

// ERROR: Retain cycle - closure captura self fuertemente
class NetworkMonitor {
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    var onNetworkChange: ((Bool) -> Void)?
    
    init() {
        setupMonitoring()
    }
    
    // ERROR: Self es capturado fuertemente en el closure
    private func setupMonitoring() {
        monitor.pathUpdateHandler = { path in
            let isConnected = path.status == .satisfied
            // Este closure retiene self fuertemente creando un retain cycle
            self.onNetworkChange?(isConnected)
            self.handleNetworkChange(isConnected: isConnected)
        }
        monitor.start(queue: queue)
    }
    
    private func handleNetworkChange(isConnected: Bool) {
        print("Network status changed: \(isConnected)")
    }
    
    deinit {
        monitor.cancel()
        print("NetworkMonitor deinitialized")
    }
}
