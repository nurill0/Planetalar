//
//  HomeModel.swift
//  Planetalar
//
//  Created by Nurillo Domlajonov on 22/01/22.
//

import UIKit

struct PlanetDetailes{
    let title: String
    let imageName: String
}

struct Planetdata{
    let data: [PlanetDetailes] = [
    PlanetDetailes(title: "Quyosh", imageName: "1"),
    PlanetDetailes(title: "Merkuriy", imageName: "2"),
    PlanetDetailes(title: "Venera", imageName: "3"),
    PlanetDetailes(title: "Yer", imageName: "4"),
    PlanetDetailes(title: "Oy", imageName: "5"),
    PlanetDetailes(title: "Mars", imageName: "6"),
    PlanetDetailes(title: "Yupiter", imageName: "7"),
    PlanetDetailes(title: "Saturn", imageName: "8"),
    PlanetDetailes(title: "Uran", imageName: "9"),
    PlanetDetailes(title: "Neptun", imageName: "10")
    ]
    func getItem(index: Int)->PlanetDetailes{
        return data[index]
    }
    func getSize()->Int{
        return data.count
    }
}


struct DefinitionDetailes{
    let imageName: String
    let definitionText: String
    let audioName: String
}
struct DefinitionData{
    let data: [DefinitionDetailes] = [
    DefinitionDetailes(imageName: "1", definitionText: """
    Quyosh — quyosh tizimining markaziy qismi, qizigan plazma shardan tashkil topgan.Quyosh sistemasi — quyoshning gravitatsion taʼsir maydoni ichida harakatlanuvchi osmon jismlari (Quyosh, sayyoralar, sayyoralarning yo`ldoshlari kichik sayyoralar, kometalar, kosmik changlar) majmui.Quyoshga yaqinlashuvchi uzun davrli kometalar va shu sistemani qoplagan kosmik changlarni kuzatishdan olinadi
""", audioName: "1"),
    DefinitionDetailes(imageName: "2", definitionText: """
    Merkuriy - Quyosh sistemasidagi Quyoshga eng yaqin sayyora. Merkuriy quyosh chiqishi oldidan va botgandan soʻng uning yaqinida koʻrinadi. Merkuriyning diametri 4865 km.Merkuriyning Quyosh atrofida aylanish davri 88 sutka.Orbital harakatining tezligi 47,9 km/sek.
""", audioName: "2"),
    DefinitionDetailes(imageName: "3", definitionText: """
    Venera yoki Zuhra yulduzi — quyosh tizimining quyoshdan uzoqligi boʻyicha ikkinchi sayyora.Venera — yorqinligi boʻyicha osmondagi uchinchi jism.enera. orbitasida 35 km/sek tezlik bilan harakatlanib, Quyosh atrofini 224 sutka 14 soat 49 minutda aylanib chiqadi.Quyoshdan oʻrtacha uzoqligi 0,723 astronomik birlik ya`ni 108,3 mln km.
""", audioName: "3"),
    DefinitionDetailes(imageName: "4", definitionText: """
    Yer — Quyosh sistemasidagi quyoshdan uzoqligi jihatdan uchinchi (Merkuriy, Venera, sayyoralaridan keyin) sayyora. U oʻz oʻqi atrofida va aylanaga juda yaqin boʻlgan elliptik orbita boʻyicha Quyosh atrofida aylanib turadi. Hajmi va massasi jihatidan Yer katta sayyoralar ichida (Yupiter, Saturn, Uran, neptun keyin) beshinchi oʻrinda.
""", audioName: "4"),
    DefinitionDetailes(imageName: "5", definitionText: """
    Oy — Yerning yagona tabiiy yo`ldoshi. Yerdan oʻrtacha 384 400 km masofada joylashgan.Oy Yer atrofida gʻarbdan sharqqa harakatlanib, biror yulduzga nisbatan toʻla aylanish davri uning siderik (yoki yulduz) davri deb ataladi. Bu davr 27,32 oʻrtacha Quyosh sutkasiga teng . Oy orbitasining ekliptika tekisligi bilan kesishish nuqtalari uning chiqish va tushish tugunlari deyiladi.
""", audioName: "5"),
    DefinitionDetailes(imageName: "6", definitionText: """
    Mars — Quyosh sistemasiga kiruvchi 9 ta katta sayyoralardan biri. Marsning quyoshdan oʻrtacha uzoqligi 22794 million km, orbitasi Quyoshga nisbatan Merkuriy, Venera va Yer orbitalaridan keyin 4-oʻrinda joylashgan.Marsning Quyosh atrofida siderik aylanish davri 686 730 sutka va oʻz oʻqi atrofida aylanish davri esa 24 soat 37 min. 23 s.Orbitasining ekssentrisiteta kattaligi  tufayli Quyoshgacha boʻlgan masofasi 40 mln. km atrofida uzayib va qisqarib turadi.
""", audioName: "6"),
    DefinitionDetailes(imageName: "7", definitionText: """
    Yupiter — Quyosh sistemasidagi eng katta, Quyoshdan uzoqligi boʻyicha beshinchi sayyora.Quyosh atrofida siderik aylanish davri 4332,59 sutka (11,862 yil), orbita boʻylab oʻrtacha tezligi 13,01 km/s. Yerdan Quyoshga nisbatan qarama-qarshi turishi har 398,88 sutkada qaytariladi (sinodik davr), yaʼni bunday roʻpara turish vaziyati har gal avvalgisidan deyarli bir oy kech keladi.
""", audioName: "7"),
    DefinitionDetailes(imageName: "8", definitionText: """
    Saturn, Zuhal — Quyosh sistemasidagi 9 ta katta sayyoralardan biri; Quyoshdan uzoqligi boʻyicha 6-sayyora.Quyoshdan oʻrtacha uzoqligi 9,58 astronomik birlik (1429,3 mln. km) gateng. Kattaligi jihatidan Yupitertdan keyin 2-oʻrinda. Orbitasining ekssentrisiteta 0,056 boʻlgani tufayli bu masofa perigeliyda qisqarib, afeliyda uzayib turadi. S. Quyosh atrofini oʻz orbitasi boʻylab 29 yilu 167 kunda bir marta toʻla aylanib chiqadi.
""", audioName: "8"),
    DefinitionDetailes(imageName: "9", definitionText: """
    URAN — Quyosh sistemasiga kiruvchi 9 ta sayyoradan biri, Quyoshdan uzoqligi boʻyicha 7-sayyora. Quyoshdan uzoqligi 19,19 astronomik birlikga teng. Quyosh atrofida toʻla aylanish davri (siderik yoki yulduz aylanish davri) 30685 Yer sutkasiga teng . Uranning koʻrinma yulduz kattaligi 6t ga teng boʻlib, durbinda oson koʻrinadi.
""", audioName: "9"),
    DefinitionDetailes(imageName: "10", definitionText: """
    Neptun  Quyosh sistemasida Quyoshdan uzoqligi boʻyicha 8-sayyora. Koʻzga koʻrinmaydi.Fransuz astronomi U. Leveryening matematik hisoblari asosida 1846-yil nemis astronomi I. Galle kashf etgan. Quyoshdan oʻrtacha uzoqligi 30071 astronomik birlik. Quyosh atrofidagi aylanish davri 164788 yil, oʻz oʻqi atrofida 16 soatda aylanib chiqadi.
""", audioName: "10"),
    ]
    func getItem(index: Int)->DefinitionDetailes{
        return data[index]
    }
    func getSize()->Int{
        return data.count
    }
}
