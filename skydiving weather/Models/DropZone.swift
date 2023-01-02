//
//  DropZone.swift
//  skydiving weather
//
//  Created by Léa Lescure on 23/12/2022.
//

import Foundation

struct Dropzone: Identifiable {
    let id: UUID
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(id: UUID = UUID(), name: String, latitude: Double, longitude: Double) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension Dropzone {
    static let frenchDropzones: [Dropzone] = [
            Dropzone(name: "Savoie Parachutisme", latitude: 45.6333, longitude: 5.9),
            Dropzone(name: "CERPS Gap-Tallard", latitude: 44.567, longitude: 6.083),
            Dropzone(name: "Vendée Evasion Parachutisme", latitude: 46.500, longitude: -1.783),
            Dropzone(name: "Europhénix 17 Royan parachutisme", latitude: 45.629, longitude: -1.028),
            Dropzone(name: "Abalone Parachutisme", latitude: 48.865, longitude: -1.556),
            Dropzone(name: "FlyAdrenaline", latitude: 50.155, longitude: 1.813),
            Dropzone(name: "Bouloc Skydive", latitude: 44.2553, longitude: 1.1382),
            Dropzone(name: "Skydive Frétoy", latitude: 49.5833, longitude: 3),
            Dropzone(name: "XLR Parachutisme", latitude: 45.511, longitude: -1.125),
            Dropzone(name: "Pau Skydive ccal", latitude: 43.433, longitude: -0.283),
            Dropzone(name: "Ecole de Parachutisme Du Valinco", latitude: 41.6753, longitude: 8.903),
            Dropzone(name: "Abeille Parachutisme", latitude: 49.4938, longitude: 0.1077),
            Dropzone(name: "Chute Libre Dordogne", latitude: 44.8022, longitude: 1.2146),
            Dropzone(name: "Big'Air Parachutisme Rochefort", latitude: 45.8667, longitude: -0.9667),
            Dropzone(name: "Mont Blanc Skydive", latitude: 45.9238, longitude: 6.8693),
            Dropzone(name: "Aero Tandem Celtic", latitude: 47.75, longitude: -2.6833),
            Dropzone(name: "Parachute Péronne", latitude: 49.9333, longitude: 2.9333),
            Dropzone(name: "Vertical T'Air Parachutisme", latitude: 44.6287, longitude: -1.1406),
            Dropzone(name: "Dragon Fly Parachutisme", latitude: 44.6201, longitude: 4.3899),
            Dropzone(name: "Skydive-Occitanie", latitude: 43.1976, longitude: 2.7614),
            Dropzone(name: "Skydive Roanne", latitude: 46.0333, longitude: 4),
            Dropzone(name: "Parachutisme 38", latitude: 45.3333, longitude: 5.35),
            Dropzone(name: "Parachutisme 42", latitude: 45.5833, longitude: 4.3167),
            Dropzone(name: "Para-Club du Puy", latitude: 45.0682, longitude: 3.7499),
            Dropzone(name: "Auvergne Parachutisme", latitude: 45.7797, longitude: 3.0863),
            Dropzone(name: "École de Parachutisme de Lyon Corbas", latitude: 45.6679, longitude: 4.8963),
            Dropzone(name: "Ecole de Parachutisme Besançon Franche-Comté", latitude: 47.2107, longitude: 6.067),
            Dropzone(name: "École Parachutisme Nord Franche Comté", latitude: 47.5167, longitude: 6.8),
            Dropzone(name: "Parachutisme71", latitude: 46.8186, longitude: 4.8336),
            Dropzone(name: "EFP Le Blanc", latitude: 47.8622, longitude: 1.9),
            Dropzone(name: "TOURS'N JUMP", latitude: 47.4167, longitude: 0.6667),
            Dropzone(name: "Centre Ecole Régional de Parachutisme", latitude: 48.5834, longitude: 7.743),
            Dropzone(name: "École Française de Parachutisme Lille Bondues", latitude: 50.702, longitude: 3.095),
            Dropzone(name: "Lens Parachutisme", latitude: 50.4855, longitude: 2.8305),
            Dropzone(name: "Air Libre Parachutisme", latitude: 49.8716, longitude: 1.0682),
            Dropzone(name: "Skydive Pujaut", latitude: 44, longitude: 4.7833),
            Dropzone(name: "Saumur Ecole de Parachutisme", latitude: 47.2667, longitude: -0.25),
            Dropzone(name: "Parachutisme Laval", latitude: 48.0667, longitude: -0.7667),
            Dropzone(name: "Parachute Club d'Aix en Provence", latitude: 43.5283, longitude: 5.4497)
        ]
        
        static let frenchDropzonesList: [String] = [
            "Savoie Parachutisme",
            "CERPS Gap-Tallard",
            "Vendée Evasion Parachutisme",
            "Europhénix 17 Royan parachutisme",
            "Abalone Parachutisme",
            "FlyAdrenaline",
            "Bouloc Skydive",
            "Skydive Frétoy",
             "XLR Parachutisme",
             "Pau Skydive ccal",
             "Ecole de Parachutisme Du Valinco",
             "Abeille Parachutisme",
             "Chute Libre Dordogne",
             "Big'Air Parachutisme Rochefort",
             "Mont Blanc Skydive",
             "Aero Tandem Celtic",
             "Parachute Péronne",
             "Vertical T'Air Parachutisme",
             "Dragon Fly Parachutisme",
             "Skydive-Occitanie",
             "Skydive Roanne",
             "Parachutisme 38",
             "Parachutisme 42",
             "Para-Club du Puy",
             "Auvergne Parachutisme",
             "École de Parachutisme de Lyon Corbas",
             "Ecole de Parachutisme Besançon Franche-Comté",
             "École Parachutisme Nord Franche Comté",
             "Parachutisme71",
             "EFP Le Blanc",
             "TOURS'N JUMP",
             "Centre Ecole Régional de Parachutisme",
             "École Française de Parachutisme Lille Bondues",
             "Lens Parachutisme",
             "Air Libre Parachutisme",
             "Skydive Pujaut",
             "Saumur Ecole de Parachutisme",
             "Parachutisme Laval",
             "Parachute Club d'Aix en Provence",
        ]
}
