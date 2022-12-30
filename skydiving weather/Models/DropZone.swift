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
    var longitude: Float
    var latitude: Float
    
    init(id: UUID = UUID(), name: String, longitude: Float, latitude: Float) {
        self.id = id
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
        
    }
}

    extension Dropzone {
        static let frenchDropzones: [Dropzone] = [
            Dropzone(name: "Savoie Parachutisme", longitude: 45.6333, latitude: 5.9),
            Dropzone(name: "CERPS Gap-Tallard", longitude: 44.567, latitude: 6.083),
            Dropzone(name: "Vendée Evasion Parachutisme", longitude: 46.500, latitude: -1.783),
            Dropzone(name: "Europhénix 17 Royan parachutisme", longitude: 45.629, latitude: -1.028),
            Dropzone(name: "Abalone Parachutisme", longitude: 48.865, latitude: -1.556),
            Dropzone(name: "FlyAdrenaline", longitude: 50.155, latitude: 1.813),
            Dropzone(name: "Bouloc Skydive", longitude: 44.2553, latitude: 1.1382),
            Dropzone(name: "Skydive Frétoy", longitude: 49.5833, latitude: 3),
            Dropzone(name: "XLR Parachutisme", longitude: 45.511, latitude: -1.125),
            Dropzone(name: "Pau Skydive ccal", longitude: 43.433, latitude: -0.283),
            Dropzone(name: "Ecole de Parachutisme Du Valinco", longitude: 41.6753, latitude: 8.903),
            Dropzone(name: "Abeille Parachutisme", longitude: 49.4938, latitude: 0.1077),
            Dropzone(name: "Chute Libre Dordogne", longitude: 44.8022, latitude: 1.2146),
            Dropzone(name: "Big'Air Parachutisme Rochefort", longitude: 45.8667, latitude: -0.9667),
            Dropzone(name: "Mont Blanc Skydive", longitude: 45.9238, latitude: 6.8693),
            Dropzone(name: "Aero Tandem Celtic", longitude: 47.75, latitude: -2.6833),
            Dropzone(name: "Parachute Péronne", longitude: 49.9333, latitude: 2.9333),
            Dropzone(name: "Vertical T'Air Parachutisme", longitude: 44.6287, latitude: -1.1406),
            Dropzone(name: "Dragon Fly Parachutisme", longitude: 44.6201, latitude: 4.3899),
            Dropzone(name: "Skydive-Occitanie", longitude: 43.1976, latitude: 2.7614),
            Dropzone(name: "Skydive Roanne", longitude: 46.0333, latitude: 4),
            Dropzone(name: "Parachutisme 38", longitude: 45.3333, latitude: 5.35),
            Dropzone(name: "Parachutisme 42", longitude: 45.5833, latitude: 4.3167),
            Dropzone(name: "Para-Club du Puy", longitude: 45.0682, latitude: 3.7499),
            Dropzone(name: "Auvergne Parachutisme", longitude: 45.7797, latitude: 3.0863),
            Dropzone(name: "École de Parachutisme de Lyon Corbas", longitude: 45.6679, latitude: 4.8963),
            Dropzone(name: "Ecole de Parachutisme Besançon Franche-Comté", longitude: 47.2107, latitude: 6.067),
            Dropzone(name: "École Parachutisme Nord Franche Comté", longitude: 47.5167, latitude: 6.8),
            Dropzone(name: "Parachutisme71", longitude: 46.8186, latitude: 4.8336),
            Dropzone(name: "EFP Le Blanc", longitude: 47.8622, latitude: 1.9),
            Dropzone(name: "TOURS'N JUMP", longitude: 47.4167, latitude: 0.6667),
            Dropzone(name: "Centre Ecole Régional de Parachutisme", longitude: 48.5834, latitude: 7.743),
            Dropzone(name: "École Française de Parachutisme Lille Bondues", longitude: 50.702, latitude: 3.095),
            Dropzone(name: "Lens Parachutisme", longitude: 50.4855, latitude: 2.8305),
            Dropzone(name: "Air Libre Parachutisme", longitude: 49.8716, latitude: 1.0682),
            Dropzone(name: "Skydive Pujaut", longitude: 44, latitude: 4.7833),
            Dropzone(name: "Saumur Ecole de Parachutisme", longitude: 47.2667, latitude: -0.25),
            Dropzone(name: "Parachutisme Laval", longitude: 48.0667, latitude: -0.7667),
            Dropzone(name: "Parachute Club d'Aix en Provence", longitude: 43.5283, latitude: 5.4497)
            
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
