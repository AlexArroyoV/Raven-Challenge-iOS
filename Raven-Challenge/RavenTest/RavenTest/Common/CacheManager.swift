//
//  CacheManager.swift
//  RavenTest
//
//  Created for debugging challenge
//

import Foundation
import SwiftData

// ERROR: Múltiples problemas de memory management y SwiftData
class CacheManager {
    
    // ERROR: Mantener referencias fuertes a ModelContext puede causar problemas
    private var context: ModelContext
    
    // ERROR: Timer no se invalida causando leak
    private var cleanupTimer: Timer?
    
    // ERROR: Closure con retain cycle
    var onCacheCleared: (() -> Void)?
    
    init(context: ModelContext) {
        self.context = context
        setupCleanupTimer()
    }
    
    // ERROR: Timer retiene self fuertemente
    private func setupCleanupTimer() {
        cleanupTimer = Timer.scheduledTimer(withTimeInterval: 3600, repeats: true) { timer in
            // Self es capturado fuertemente
            self.clearOldCache()
            self.onCacheCleared?()
        }
    }
    
    func clearOldCache() {
        do {
            let descriptor = FetchDescriptor<ArticleEntity>(
                predicate: #Predicate { $0.isRead == true }
            )
            let articles = try context.fetch(descriptor)
            
            // ERROR: No se verifica si context aún es válido
            for article in articles {
                context.delete(article)
            }
            
            // ERROR: Save en contexto incorrecto o múltiples saves innecesarios
            try context.save()
            try context.save() // Save duplicado
            
        } catch {
            print("Error clearing cache: \(error)")
        }
    }
    
    // ERROR: deinit nunca se llama por el retain cycle del timer
    deinit {
        cleanupTimer?.invalidate()
        print("CacheManager deinitialized")
    }
}
