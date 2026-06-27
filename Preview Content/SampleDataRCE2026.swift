//
//  SampleDataRCE2026.swift
//  RCE
//
//  Created for the RCE project.
//  Data for the 2026 Rencontres du Ciel et de l'Espace (RCE) program.
//  Based on the 2024 RCE program, adapted for 2026 dates (13, 14, 15 November).
//

import SwiftUI
import SwiftData

/// Provides sample data for the 2026 RCE (Rencontres du Ciel et de l'Espace) program.
/// This is based on the 2024 program, with dates updated to 13-15 November 2026.
enum SampleDataRCE2026 {
    static func createRCE2026Data() -> ModelContainer {
        let container = try! ModelContainer(
            for: Conference.self,
            configurations: ModelConfiguration(url: URL(fileURLWithPath: "/dev/null"))
        )

        // MARK: - Thèmes
        let planetologie = Theme(name: "Planétologie", color: .orange)
        let cometes = Theme(name: "Comètes et astéroïdes", color: .gray)
        let solaire = Theme(name: "Solaire", color: .yellow)
        let cosmologie = Theme(name: "Cosmologie", color: .indigo)
        let spectroscopie = Theme(name: "Spectroscopie", color: .purple)
        let vieExoplanetes = Theme(name: "Vie, exoplanètes et océans", color: .cyan)
        let espace = Theme(name: "Espace", color: .blue)
        let observatoire = Theme(name: "Observatoire, instruments et accessoires", color: .brown)
        let observations = Theme(name: "Observations et travaux", color: .green)
        let photographie = Theme(name: "Photographie et imagerie astronomique", color: .pink)
        let sciencesPartic = Theme(name: "Sciences participatives", color: .mint)
        let diffuser = Theme(name: "Diffuser et partager l'astronomie", color: .teal)
        let astronomie = Theme(name: "Astronomie", color: .blue)

        // MARK: - Salles
        let amphi1 = Room(name: "Amphithéâtre Gaston Berger")
        let amphi2 = Room(name: "Amphithéâtre Louis Armand")
        let salle1 = Room(name: "Salle 1")
        let salle2 = Room(name: "Salle 2")
        let salle3 = Room(name: "Salle 3")
        let salle4 = Room(name: "Salle 4")
        let salleAB = Room(name: "Salle AB")

        // MARK: - Conférenciers
        let cuillandre = Speaker(firstName: "Jean-Charles", lastName: "Cuillandre")
        let cruzalebes = Speaker(firstName: "Pierre", lastName: "Cruzalèbes")
        let dauvergne = Speaker(firstName: "Jean-Luc", lastName: "Dauvergne")
        let niel = Speaker(firstName: "Camille", lastName: "Niel")
        let lekic = Speaker(firstName: "Anica", lastName: "Lekic")
        let godard = Speaker(firstName: "Jean-Paul", lastName: "Godard")
        let strajnic = Speaker(firstName: "Jean", lastName: "Strajnic")
        let martel = Speaker(firstName: "Étienne", lastName: "Martel")
        let ancelle = Speaker(firstName: "Jacques", lastName: "Ancelle")
        let cayrel = Speaker(firstName: "Marc", lastName: "Cayrel")
        let griton = Speaker(firstName: "Léa", lastName: "Griton")
        let graffand = Speaker(firstName: "Jean-François", lastName: "Graffand")
        let garde = Speaker(firstName: "Olivier", lastName: "Garde")
        let cochard = Speaker(firstName: "François", lastName: "Cochard")
        let aubry = Speaker(firstName: "Sébastien", lastName: "Aubry")
        let buil = Speaker(firstName: "Christian", lastName: "Buil")
        let bertrand = Speaker(firstName: "Guillaume", lastName: "Bertrand")
        let leLain = Speaker(firstName: "Mathieu", lastName: "Le Lain")
        let mauclaire = Speaker(firstName: "Benjamin", lastName: "Mauclaire")
        let pelletier = Speaker(firstName: "Patrick", lastName: "Pelletier")
        let michel = Speaker(firstName: "Patrick", lastName: "Michel")
        let dovidio = Speaker(firstName: "Francesco", lastName: "D'Ovidio")
        let roche = Speaker(firstName: "Arnaud", lastName: "Roche")
        let gheno = Speaker(firstName: "Paul", lastName: "Gheno")
        let roy = Speaker(firstName: "Damien", lastName: "Roy")
        let leGue = Speaker(firstName: "Alain", lastName: "Le Gué")
        let langlois = Speaker(firstName: "Maud", lastName: "Langlois")
        let cottin = Speaker(firstName: "Hervé", lastName: "Cottin")
        let duprat = Speaker(firstName: "Jean", lastName: "Duprat")
        let fossé = Speaker(firstName: "David", lastName: "Fossé")
        let bretMorel = Speaker(firstName: "Serge", lastName: "Bret-Morel")
        let faboIndurain = Speaker(firstName: "Cristina", lastName: "Fabo Indurain")
        let suc = Speaker(firstName: "Vincent", lastName: "Suc")
        let heully = Speaker(firstName: "Philippe", lastName: "Heully")
        let hammer = Speaker(firstName: "François", lastName: "Hammer")
        let maquet = Speaker(firstName: "Lucie", lastName: "Maquet")
        let doressoundiram = Speaker(firstName: "Alain", lastName: "Doressoundiram")
        let hennes = Speaker(firstName: "Christian", lastName: "Hennes")
        let pothier = Speaker(firstName: "Yann", lastName: "Pothier")
        let richard = Speaker(firstName: "Cyril", lastName: "Richard")
        let blateyron = Speaker(firstName: "François", lastName: "Blateyron")
        let montarges = Speaker(firstName: "Miguel", lastName: "Montargès")
        let henarejos = Speaker(firstName: "Philippe", lastName: "Henarejos")
        let dvorkin = Speaker(firstName: "Irina", lastName: "Dvorkin")
        let hanonDegroote = Speaker(firstName: "Thierry", lastName: "Hanon-Degroote")
        let biree = Speaker(firstName: "Lionel", lastName: "Birée")
        let millet = Speaker(firstName: "Didier", lastName: "Millet")
        let foschino = Speaker(firstName: "Sacha", lastName: "Foschino")
        let beaudoin = Speaker(firstName: "Emmanuel", lastName: "Beaudoin")
        let durand = Speaker(firstName: "Sébastien", lastName: "Durand")
        let bourasseau = Speaker(firstName: "Laurent", lastName: "Bourasseau")
        let biver = Speaker(firstName: "Nicolas", lastName: "Biver")
        let kobs = Speaker(firstName: "Jonathan", lastName: "Kobs")
        let leDu = Speaker(firstName: "Pascal", lastName: "Le Dû")
        let viger = Speaker(firstName: "Loïck", lastName: "Viger")
        let desmars = Speaker(firstName: "J.", lastName: "Desmars")
        let lallemand = Speaker(firstName: "R.", lastName: "Lallemand")
        let chariot = Speaker(firstName: "Éric", lastName: "Chariot")
        let leroy = Speaker(firstName: "Arnaud", lastName: "Leroy")
        let langin = Speaker(firstName: "Guillaume", lastName: "Langin")
        let midavaine = Speaker(firstName: "Thierry", lastName: "Midavaine")
        let gely = Speaker(firstName: "Jean-François", lastName: "Gely")
        let kabac = Speaker(firstName: "Marion", lastName: "Kabac")
        let lecleire = Speaker(firstName: "Jean-Marc", lastName: "Lecleire")
        let legodec = Speaker(firstName: "Yannick", lastName: "Legodec")
        let lecureuil = Speaker(firstName: "Patrick", lastName: "Lecureuil")
        let outters = Speaker(firstName: "Nicolas", lastName: "Outters")
        let gilet = Speaker(firstName: "Pierre", lastName: "Gilet")
        let legault = Speaker(firstName: "Thierry", lastName: "Legault")
        let charnay = Speaker(firstName: "Benjamin", lastName: "Charnay")
        let vaubaillon = Speaker(firstName: "Jérémie", lastName: "Vaubaillon")
        let viladrich = Speaker(firstName: "Christian", lastName: "Viladrich")
        let cirou = Speaker(firstName: "Alain", lastName: "Cirou")
        let pasco = Speaker(firstName: "Xavier", lastName: "Pasco")
        let martin = Speaker(firstName: "Jean-Luc", lastName: "Martin")
        let desnoux = Speaker(firstName: "Valérie", lastName: "Desnoux")
        let champeau = Speaker(firstName: "Cédric", lastName: "Champeau")
        let cordier = Speaker(firstName: "Bertrand", lastName: "Cordier")
        let cornu = Speaker(firstName: "Florence", lastName: "Cornu")
        let chardin = Speaker(firstName: "Gabriel", lastName: "Chardin")
        let freissinet = Speaker(firstName: "Caroline", lastName: "Freissinet")
        let deComite = Speaker(firstName: "Francesco", lastName: "De Comité")
        let dubuche = Speaker(firstName: "Valérie", lastName: "Dubuche")
        let wunsche = Speaker(firstName: "Anaël", lastName: "Wunsche")
        let daniel = Speaker(firstName: "D.", lastName: "Daniel")
        let lainey = Speaker(firstName: "Valéry", lastName: "Lainey")
        let roucelle = Speaker(firstName: "Cécile", lastName: "Roucelle")
        let cessateur = Speaker(firstName: "Gaël", lastName: "Cessateur")
        let ory = Speaker(firstName: "Michel", lastName: "Ory")
        let mandon = Speaker(firstName: "Lucia", lastName: "Mandon")
        let hennebelle = Speaker(firstName: "P.", lastName: "Hennebelle")
        let defrance = Speaker(firstName: "Remy", lastName: "Defrance")
        let janvier = Speaker(firstName: "Miho", lastName: "Janvier")
        let lionnet = Speaker(firstName: "Pierre", lastName: "Lionnet")
        let vauclair = Speaker(firstName: "Sébastien", lastName: "Vauclair")
        let blanck = Speaker(firstName: "Gwenael", lastName: "Blanck")
        let oger = Speaker(firstName: "Jean-Paul", lastName: "Oger")
        let oudoux = Speaker(firstName: "Maxime", lastName: "Oudoux")
        let legrand = Speaker(firstName: "Christian", lastName: "Legrand")
        let pittet = Speaker(firstName: "Jean-François", lastName: "Pittet")
        let robert = Speaker(firstName: "Vincent", lastName: "Robert")
        let riazelo = Speaker(firstName: "Alain", lastName: "Riazelo")
        let chatain = Speaker(firstName: "Audrey", lastName: "Chatain")
        let forget = Speaker(firstName: "François", lastName: "Forget")
        let gysembergh = Speaker(firstName: "Victor", lastName: "Gysembergh")
        let marquet = Speaker(firstName: "Étienne", lastName: "Marquet")
        let tequi = Speaker(firstName: "Matthieu", lastName: "Téqui")
        let ubaud = Speaker(firstName: "Stéphane", lastName: "Ubaud")
        let elbaz = Speaker(firstName: "David", lastName: "Elbaz")
        let meunier = Speaker(firstName: "Antoine", lastName: "Meunier")
        let trangosi = Speaker(firstName: "Renaud", lastName: "Trangosi")
        let soum = Speaker(firstName: "Jean-Noël", lastName: "Soum")
        let millot = Speaker(firstName: "Alice", lastName: "Millot")
        let changeat = Speaker(firstName: "Quentin", lastName: "Changeat")
        let bonnetBidaud = Speaker(firstName: "Jean-Marc", lastName: "Bonnet-Bidaud")
        let bazin = Speaker(firstName: "Cyrille", lastName: "Bazin")
        let loubiere = Speaker(firstName: "Claire", lastName: "Loubière")
        let celle = Speaker(firstName: "Hadrien", lastName: "Celle")
        let balledant = Speaker(firstName: "Jérémy", lastName: "Balledant")
        let porcel = Speaker(firstName: "Florence", lastName: "Porcel")
        let galard = Speaker(firstName: "Jérôme", lastName: "Galard")
        let bellon = Speaker(firstName: "A.", lastName: "Bellon")

        // MARK: - Helper
        let cal = Calendar.current

        func date(_ day: Int, _ hour: Int, _ minute: Int) -> Date {
            cal.date(from: DateComponents(year: 2026, month: 11, day: day, hour: hour, minute: minute))!
        }

        func conf(
            title: String,
            summary: String = "",
            day: Int,
            startH: Int, startM: Int,
            endH: Int, endM: Int,
            room: Room,
            speakers: [Speaker],
            theme: Theme
        ) -> Conference {
            let s = date(day, startH, startM)
            let e = date(day, endH, endM)
            return Conference(
                title: title,
                summary: summary,
                date: s,
                startTime: s,
                endTime: e,
                room: room,
                speakers: speakers,
                theme: theme
            )
        }

        // MARK: - Conférences Vendredi 13 novembre 2026

        // --- Amphithéâtre Gaston Berger ---
        let c01 = conf(title: "Euclid, ce que révèlent les premières images",
                       day: 13, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: amphi1, speakers: [cuillandre], theme: cosmologie)

        let c02 = conf(title: "Hommage à Hubert Reeves",
                       day: 13, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: amphi1, speakers: [], theme: astronomie)

        let c03 = conf(title: "Comment est né le Système solaire?",
                       summary: "Animé par David Fossé",
                       day: 13, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: amphi1, speakers: [langlois, cottin, duprat, fossé], theme: planetologie)

        let c04 = conf(title: "Voyage dans la beauté du ciel",
                       day: 13, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: amphi1, speakers: [montarges, henarejos], theme: astronomie)

        let c05 = conf(title: "Quand l'Univers tremble, l'astronomie des ondes gravitationnelles",
                       day: 13, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: amphi1, speakers: [dvorkin], theme: cosmologie)

        let c06 = conf(title: "Météorologie de l'espace : du scientifique à l'opérationnel",
                       day: 13, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: amphi1, speakers: [biree], theme: solaire)

        let c07 = conf(title: "Rétrospective sur l'aurore boréale du 10 mai 2026",
                       day: 13, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: amphi1, speakers: [beaudoin], theme: solaire)

        // --- Amphithéâtre Louis Armand ---
        let c08 = conf(title: "Bételgeuse, l'étoile mystérieuse",
                       day: 13, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: amphi2, speakers: [cruzalebes], theme: astronomie)

        let c09 = conf(title: "Imagerie planétaire: les nouveautés 2026",
                       day: 13, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: amphi2, speakers: [dauvergne], theme: planetologie)

        let c10 = conf(title: "Faut-il abandonner le zodiaque aux astrologues?",
                       day: 13, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: amphi2, speakers: [bretMorel], theme: diffuser)

        let c11 = conf(title: "L'insoutenable légèreté de la Voie lactée?",
                       day: 13, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: amphi2, speakers: [hammer], theme: cosmologie)

        let c12 = conf(title: "Les comètes, des croyances à leur exploration",
                       day: 13, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: amphi2, speakers: [maquet], theme: cometes)

        let c13 = conf(title: "Mars/Phobos aller-retour, objectifs lunes",
                       day: 13, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: amphi2, speakers: [doressoundiram], theme: planetologie)

        let c14 = conf(title: "L'exploration spatiale des astéroïdes, un âge d'or",
                       day: 13, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: amphi2, speakers: [michel], theme: cometes)

        // --- Salle 1 ---
        let c15 = conf(title: "Étoiles à moins de 10 pc",
                       day: 13, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: salle1, speakers: [lekic], theme: astronomie)

        let c16 = conf(title: "Au cœur du futur et plus grand télescope du monde",
                       day: 13, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: salle1, speakers: [cayrel], theme: observatoire)

        let c17 = conf(title: "2044, objectif Uranus",
                       day: 13, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: salle1, speakers: [griton], theme: planetologie)

        let c18 = conf(title: "L'observation visuelle, de la pratique de loisirs au sport de haut niveau?",
                       day: 13, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: salle1, speakers: [pothier], theme: observations)

        let c19 = conf(title: "Siril 1.4.0: améliorations et nouveautés",
                       day: 13, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: salle1, speakers: [richard], theme: observations)

        let c20 = conf(title: "Faire un astrolabe planisphérique grâce à Shadows Pro",
                       day: 13, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: salle1, speakers: [blateyron], theme: observations)

        let c21 = conf(title: "Retour d'expérience sur les télescopes automatisés du marché",
                       day: 13, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: salle1, speakers: [hanonDegroote], theme: observatoire)

        // --- Salle 2 ---
        let c22 = conf(title: "Les amateurs et l'observatoire virtuel des professionnels",
                       day: 13, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: salle2, speakers: [godard], theme: sciencesPartic)

        let c23 = conf(title: "Planètes et satellites, description et animations",
                       day: 13, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: salle2, speakers: [ancelle], theme: planetologie)

        let c24 = conf(title: "Hébergement de télescopes et tourisme astronomique",
                       day: 13, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: salle2, speakers: [faboIndurain], theme: observatoire)

        let c25 = conf(title: "Trucs et astuces pour une installation Remote réussie",
                       day: 13, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: salle2, speakers: [suc], theme: observatoire)

        let c26 = conf(title: "Du dessin à la cartographie lunaire",
                       day: 13, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: salle2, speakers: [heully], theme: observations)

        let c27 = conf(title: "Observatoire de mission Saint-Véran Paul Felebock, une expérience incroyable",
                       day: 13, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: salle2, speakers: [hennes], theme: observatoire)

        let c28 = conf(title: "Astrographe nomade, modulaire et 3D",
                       day: 13, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: salle2, speakers: [millet], theme: observatoire)

        // --- Salle 3 ---
        let c29 = conf(title: "La photo de paysage nocturne: place à l'aventure!",
                       day: 13, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: salle3, speakers: [niel], theme: photographie)

        let c30 = conf(title: "Pourquoi faire de la spectroscopie?",
                       day: 13, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: salle3, speakers: [garde], theme: spectroscopie)

        let c31 = conf(title: "Comprendre l'Univers à travers ses couleurs, un voyage esthétique",
                       day: 13, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: salle3, speakers: [], theme: photographie)

        let c32 = conf(title: "Photographie à photométrie: de la science dans les astrophotos",
                       day: 13, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: salle3, speakers: [foschino], theme: photographie)

        let c33 = conf(title: "L'univers de Jeff Graphy©",
                       day: 13, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: salle3, speakers: [gely], theme: photographie)

        let c34 = conf(title: "Enchanter vos paysages célestes grâce à la photographie de portrait",
                       day: 13, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: salle3, speakers: [kabac], theme: photographie)

        let c35 = conf(title: "La photographie du ciel avec une GoPRO",
                       day: 13, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: salle3, speakers: [lecleire], theme: photographie)

        // --- Salle 4 ---
        let c36 = conf(title: "La Marche à l'étoile: America Del Sur",
                       day: 13, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: salle4, speakers: [], theme: observations)

        let c37 = conf(title: "Avec Shelyak, inventons la spectro de demain",
                       day: 13, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: salle4, speakers: [cochard], theme: spectroscopie)

        let c38 = conf(title: "DarkSky France: l'antenne française de DarkSky International",
                       day: 13, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: salle4, speakers: [graffand], theme: diffuser)

        let c39 = conf(title: "AstrowlBox: Dispositif ultra portable de visuel assisté",
                       day: 13, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: salle4, speakers: [roche], theme: observatoire)

        let c40 = conf(title: "Sevunscope: de la genèse à l'état actuel d'avancement du projet",
                       day: 13, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: salle4, speakers: [gheno, roy], theme: observatoire)

        let c41 = conf(title: "Le ciel étoilé en péril",
                       day: 13, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: salle4, speakers: [leGue], theme: diffuser)

        let c42 = conf(title: "Le monde OpenSource Français pour l'astronomie amateur",
                       day: 13, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: salle4, speakers: [durand], theme: observations)

        // --- Salle AB ---
        let c43 = conf(title: "Projets d'observations en classe avec un smartélescope (Vaonis, Unistellar) en Ile-de-France – AFA",
                       day: 13, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: salleAB, speakers: [strajnic], theme: sciencesPartic)

        let c44 = conf(title: "Partager l'astronomie, l'astrophysique dans le secondaire",
                       day: 13, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: salleAB, speakers: [martel], theme: diffuser)

        let c45 = conf(title: "Astronomie et astrophotographie nomade avec un smart télescope",
                       day: 13, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: salleAB, speakers: [aubry], theme: photographie)

        let c46 = conf(title: "SunScan: votre observatoire solaire dans une mallette",
                       day: 13, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: salleAB, speakers: [buil, bertrand, leLain], theme: solaire)

        let c47 = conf(title: "L'astrophysique à portée de télescope",
                       day: 13, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: salleAB, speakers: [mauclaire], theme: observations)

        let c48 = conf(title: "Méthodes et process pour animer l'activité Solaire",
                       day: 13, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: salleAB, speakers: [pelletier], theme: solaire)

        let c49 = conf(title: "L'océan vivant vu de l'espace",
                       day: 13, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: salleAB, speakers: [dovidio], theme: vieExoplanetes)

        // MARK: - Conférences Samedi 14 novembre 2026

        // --- Amphithéâtre Gaston Berger ---
        let c50 = conf(title: "Éclipse, le jour du Soleil noir",
                       day: 14, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: amphi1, speakers: [cirou], theme: solaire)

        let c51 = conf(title: "Géopolitique spatiale, Space X et la nouvelle donne",
                       day: 14, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: amphi1, speakers: [pasco], theme: espace)

        let c52 = conf(title: "Sursauts gamma, premiers résultats de la mission SVOM",
                       day: 14, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: amphi1, speakers: [cordier], theme: cosmologie)

        let c53 = conf(title: "Antimatière et gravité, un nouveau modèle cosmologique",
                       day: 14, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: amphi1, speakers: [chardin], theme: cosmologie)

        let c54 = conf(title: "À quel rythme grandit l'Univers?",
                       day: 14, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: amphi1, speakers: [riazelo], theme: cosmologie)

        let c55 = conf(title: "Troublant trou noir: le chaînon manquant?",
                       day: 14, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: amphi1, speakers: [elbaz], theme: cosmologie)

        let c56 = conf(title: "Protection de la nuit: la France leader mondial",
                       day: 14, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: amphi1, speakers: [vauclair], theme: diffuser)

        // --- Amphithéâtre Louis Armand ---
        let c57 = conf(title: "La révolution des exoplanètes",
                       day: 14, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: amphi2, speakers: [], theme: vieExoplanetes)

        let c58 = conf(title: "Les atmosphères d'exoplanètes dans l'œil du JWST",
                       day: 14, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: amphi2, speakers: [charnay], theme: vieExoplanetes)

        let c59 = conf(title: "L'avenir de l'astronomie dans un monde bas carbone",
                       summary: "Animé par David Fossé",
                       day: 14, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: amphi2, speakers: [hennebelle, fossé], theme: diffuser)

        let c60 = conf(title: "L'étrange monde de Titan",
                       day: 14, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: amphi2, speakers: [chatain], theme: planetologie)

        let c61 = conf(title: "Explorations polaires, de la Terre aux autres planètes",
                       day: 14, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: amphi2, speakers: [forget], theme: planetologie)

        let c62 = conf(title: "La recherche des ouvrages perdus de l'astronomie antique",
                       day: 14, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: amphi2, speakers: [gysembergh], theme: astronomie)

        let c63 = conf(title: "Gaganyaan, l'aventure indienne du vol habité",
                       day: 14, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: amphi2, speakers: [meunier], theme: espace)

        // --- Salle 1 ---
        let c64 = conf(title: "Les étoiles filantes: l'astronomie sans instrument",
                       day: 14, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: salle1, speakers: [vaubaillon], theme: cometes)

        let c65 = conf(title: "Imagerie solaire en haute résolution",
                       day: 14, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: salle1, speakers: [viladrich], theme: solaire)

        let c66 = conf(title: "Quand l'eau coulait sur Mars. L'exploration de Perseverance",
                       day: 14, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: salle1, speakers: [mandon], theme: planetologie)

        let c67 = conf(title: "Astronomie et astrophotographie nomade avec un smart télescope",
                       day: 14, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: salle1, speakers: [aubry], theme: photographie)

        let c68 = conf(title: "Mon nouveau télescope de voyage",
                       day: 14, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: salle1, speakers: [bourasseau], theme: observatoire)

        let c69 = conf(title: "Qui sommes-nous lorsque nous photographions les étoiles?",
                       day: 14, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: salle1, speakers: [gely, kabac, oudoux, niel], theme: photographie)

        let c70 = conf(title: "Ce que le zodiaque n'est pas: ces représentations si familières mais fausses",
                       day: 14, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: salle1, speakers: [bretMorel], theme: diffuser)

        // --- Salle 2 ---
        let c71 = conf(title: "Photographier les aurores boréales",
                       day: 14, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: salle2, speakers: [legodec], theme: photographie)

        let c72 = conf(title: "L'astrophoto avec un smartphone (et un instrument)",
                       day: 14, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: salle2, speakers: [lecureuil], theme: photographie)

        let c73 = conf(title: "Les marées dans le Système de Saturne",
                       day: 14, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: salle2, speakers: [lainey], theme: planetologie)

        let c74 = conf(title: "Les aurores dans le Système solaire",
                       day: 14, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: salle2, speakers: [cessateur], theme: solaire)

        let c75 = conf(title: "De la «nova stella» de Tycho aux supernovae extragalactiques",
                       day: 14, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: salle2, speakers: [ory], theme: astronomie)

        let c76 = conf(title: "PixInsight: plugins et mises à jour",
                       day: 14, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: salle2, speakers: [marquet, tequi], theme: photographie)

        let c77 = conf(title: "UVEX 4.2: un spectroscope à imprimer chez vous",
                       day: 14, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: salle2, speakers: [ubaud], theme: spectroscopie)

        // --- Salle 3 ---
        let c78 = conf(title: "Gérer les plugins avec PixInsight en ciel profond",
                       day: 14, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: salle3, speakers: [outters], theme: photographie)

        let c79 = conf(title: "Photographier l'atmosphère de Vénus depuis son jardin",
                       day: 14, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: salle3, speakers: [gilet], theme: photographie)

        let c80 = conf(title: "Traitement des images solaires",
                       day: 14, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: salle3, speakers: [defrance], theme: solaire)

        let c81 = conf(title: "Quand notre étoile fait la pluie et le beau temps dans le Système solaire",
                       day: 14, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: salle3, speakers: [janvier], theme: solaire)

        let c82 = conf(title: "Changements de paradigme dans le spatial, l'économie en question",
                       day: 14, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: salle3, speakers: [lionnet], theme: espace)

        let c83 = conf(title: "État de l'art de la mesure et cartographie de la pollution lumineuse",
                       day: 14, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: salle3, speakers: [vauclair], theme: diffuser)

        let c84 = conf(title: "Astrophoto en ville – jouer avec les astres et bien plus!",
                       day: 14, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: salle3, speakers: [blanck], theme: photographie)

        // --- Salle 4 ---
        let c85 = conf(title: "Observer et photographier les protubérances et éruptions solaires",
                       day: 14, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: salle4, speakers: [legault], theme: solaire)

        let c86 = conf(title: "L'archéoastronomie: un modèle de sciences participatives",
                       day: 14, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: salle4, speakers: [chariot], theme: sciencesPartic)

        let c87 = conf(title: "LSST, une caméra pour observer tout l'Univers en 3D",
                       day: 14, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: salle4, speakers: [roucelle], theme: cosmologie)

        let c88 = conf(title: "Projets d'observation en classe avec un smartélescope (Vaonis, Unistellar) – AFA",
                       day: 14, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: salle4, speakers: [], theme: sciencesPartic)

        let c89 = conf(title: "Utilisation d'une sphère armillaire",
                       day: 14, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: salle4, speakers: [], theme: observations)

        let c90 = conf(title: "L'astrophotographie planétaire au Dobson 400, une réalité",
                       day: 14, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: salle4, speakers: [oger], theme: photographie)

        let c91 = conf(title: "Photographier le ciel au smartphone (sans instrument)",
                       day: 14, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: salle4, speakers: [lecureuil], theme: photographie)

        // --- Salle AB ---
        let c92 = conf(title: "Le ciel d'hiver pour les débutants",
                       day: 14, startH: 10, startM: 0, endH: 11, endM: 0,
                       room: salleAB, speakers: [loubiere], theme: diffuser)

        let c93 = conf(title: "Comment fabriquer une maquette pédagogique du Système Solaire?",
                       day: 14, startH: 11, startM: 0, endH: 12, endM: 0,
                       room: salleAB, speakers: [celle], theme: diffuser)

        let c94 = conf(title: "Exoplanètes: Exoclock et sciences participatives",
                       day: 14, startH: 14, startM: 0, endH: 15, endM: 0,
                       room: salleAB, speakers: [wunsche], theme: sciencesPartic)

        let c95 = conf(title: "L'intelligence artificielle au service de futures découvertes",
                       day: 14, startH: 15, startM: 0, endH: 16, endM: 0,
                       room: salleAB, speakers: [daniel, outters], theme: observations)

        let c96 = conf(title: "Aidez-nous à caractériser les aurores planétaires",
                       day: 14, startH: 16, startM: 0, endH: 17, endM: 0,
                       room: salleAB, speakers: [beaudoin, cessateur, dauvergne], theme: sciencesPartic)

        let c97 = conf(title: "Mise «sans» lumière: expérience locale contre la pollution lumineuse",
                       day: 14, startH: 17, startM: 0, endH: 18, endM: 0,
                       room: salleAB, speakers: [balledant], theme: diffuser)

        let c98 = conf(title: "Photographier les transits d'ISS",
                       day: 14, startH: 18, startM: 0, endH: 19, endM: 0,
                       room: salleAB, speakers: [legault], theme: photographie)

        // MARK: - Conférences Dimanche 15 novembre 2026

        // --- Amphithéâtre Gaston Berger ---
        let c99 = conf(title: "Un grand observatoire dans le Morvan sort de terre",
                        day: 15, startH: 9, startM: 0, endH: 10, endM: 0,
                        room: amphi1, speakers: [chariot], theme: observatoire)

        let c100 = conf(title: "T50 du Pic du Midi: dernières nouvelles",
                        day: 15, startH: 10, startM: 0, endH: 11, endM: 0,
                        room: amphi1, speakers: [leroy], theme: observatoire)

        let c101 = conf(title: "Éclipse 2026 – Les propositions de l'AFA: voyages, dispositif, etc.",
                        day: 15, startH: 11, startM: 0, endH: 12, endM: 0,
                        room: amphi1, speakers: [], theme: solaire)

        let c102 = conf(title: "SVOM et la civilisation du ciel transitoire en Chine",
                        day: 15, startH: 14, startM: 0, endH: 15, endM: 0,
                        room: amphi1, speakers: [bonnetBidaud], theme: cosmologie)

        let c103 = conf(title: "Spectroscopie à l'éclipse du 12 Août 2026",
                        day: 15, startH: 15, startM: 0, endH: 16, endM: 0,
                        room: amphi1, speakers: [bazin], theme: spectroscopie)

        let c104 = conf(title: "Les étoiles de l'astronomie",
                        day: 15, startH: 16, startM: 0, endH: 17, endM: 0,
                        room: amphi1, speakers: [], theme: diffuser)

        // --- Amphithéâtre Louis Armand ---
        let c105 = conf(title: "Comète 103P/Hartley 2: observations et résultats scientifiques",
                        day: 15, startH: 9, startM: 0, endH: 10, endM: 0,
                        room: amphi2, speakers: [langin], theme: cometes)

        let c106 = conf(title: "Les capteurs APS CMOS: présent et futur",
                        day: 15, startH: 10, startM: 0, endH: 11, endM: 0,
                        room: amphi2, speakers: [midavaine], theme: observatoire)

        let c107 = conf(title: "Extraire la meilleure science de ses images cométaires",
                        day: 15, startH: 11, startM: 0, endH: 12, endM: 0,
                        room: amphi2, speakers: [biver], theme: cometes)

        let c108 = conf(title: "Vers un Observatoire Spectro Open Source Robotisé",
                        day: 15, startH: 14, startM: 0, endH: 15, endM: 0,
                        room: amphi2, speakers: [cochard], theme: spectroscopie)

        let c109 = conf(title: "Traitement semi-automatique des images d'éclipses totales de Soleil",
                        day: 15, startH: 15, startM: 0, endH: 16, endM: 0,
                        room: amphi2, speakers: [viladrich], theme: solaire)

        let c110 = conf(title: "OURANOS: la Voie Lactée en haute définition",
                        day: 15, startH: 16, startM: 0, endH: 17, endM: 0,
                        room: amphi2, speakers: [oudoux], theme: photographie)

        // --- Salle 1 ---
        let c111 = conf(title: "Reconnaître le signal d'une nébuleuse planétaire",
                        day: 15, startH: 9, startM: 0, endH: 10, endM: 0,
                        room: salle1, speakers: [leDu], theme: observations)

        let c112 = conf(title: "Des oculaires intensificateurs pour tous les astronomes",
                        day: 15, startH: 10, startM: 0, endH: 11, endM: 0,
                        room: salle1, speakers: [kobs], theme: observatoire)

        let c113 = conf(title: "Cape York, la météorite du Pôle Nord volée aux Inuits",
                        day: 15, startH: 11, startM: 0, endH: 12, endM: 0,
                        room: salle1, speakers: [trangosi], theme: cometes)

        let c114 = conf(title: "Les océans du ciel: exploration des lunes glacées du Système solaire",
                        day: 15, startH: 14, startM: 0, endH: 15, endM: 0,
                        room: salle1, speakers: [freissinet], theme: vieExoplanetes)

        let c115 = conf(title: "Climat et météo des exoplanètes, des conditions extrêmes",
                        day: 15, startH: 15, startM: 0, endH: 16, endM: 0,
                        room: salle1, speakers: [changeat], theme: vieExoplanetes)

        let c116 = conf(title: "Levons les yeux, ouvrons notre cœur",
                        day: 15, startH: 16, startM: 0, endH: 17, endM: 0,
                        room: salle1, speakers: [], theme: diffuser)

        // --- Salle 2 ---
        let c117 = conf(title: "Observatoire associatif SADR au Chili",
                        day: 15, startH: 9, startM: 0, endH: 10, endM: 0,
                        room: salle2, speakers: [viger], theme: observatoire)

        let c118 = conf(title: "Programmes d'obs. d'occultations Lucky Star et GaiaMoons",
                        day: 15, startH: 10, startM: 0, endH: 11, endM: 0,
                        room: salle2, speakers: [desmars, lallemand], theme: sciencesPartic)

        let c119 = conf(title: "Météorites aveyronnaises",
                        day: 15, startH: 11, startM: 0, endH: 12, endM: 0,
                        room: salle2, speakers: [soum], theme: cometes)

        let c120 = conf(title: "Le Remote pour les nuls: pilotage et astrophotographie à distance",
                        day: 15, startH: 14, startM: 0, endH: 15, endM: 0,
                        room: salle2, speakers: [], theme: observatoire)

        let c121 = conf(title: "Un setup Remote 100% automatique",
                        day: 15, startH: 15, startM: 0, endH: 16, endM: 0,
                        room: salle2, speakers: [], theme: observatoire)

        let c122 = conf(title: "Les nouveautés de la future version 9 de l'Atlas Virtuel de la Lune",
                        day: 15, startH: 16, startM: 0, endH: 17, endM: 0,
                        room: salle2, speakers: [legrand], theme: observations)

        // --- Salle 3 ---
        let c123 = conf(title: "Vivre de la photo de ciel étoilé?",
                        day: 15, startH: 9, startM: 0, endH: 10, endM: 0,
                        room: salle3, speakers: [gely], theme: photographie)

        let c124 = conf(title: "Quel est le meilleur smartphone pour l'astrophotographie?",
                        day: 15, startH: 10, startM: 0, endH: 11, endM: 0,
                        room: salle3, speakers: [dauvergne], theme: photographie)

        let c125 = conf(title: "Création d'un escape game en astronomie",
                        day: 15, startH: 11, startM: 0, endH: 12, endM: 0,
                        room: salle3, speakers: [millot], theme: diffuser)

        let c126 = conf(title: "ORIGIN, l'Univers à porter de main",
                        day: 15, startH: 14, startM: 0, endH: 15, endM: 0,
                        room: salle3, speakers: [], theme: observations)

        let c127 = conf(title: "Genèse d'un projet de planétarium et d'observatoire",
                        day: 15, startH: 15, startM: 0, endH: 16, endM: 0,
                        room: salle3, speakers: [dubuche], theme: diffuser)

        let c128 = conf(title: "Cours du soir de l'Observatoire de Paris: l'astronomie niveau bac et plus",
                        day: 15, startH: 16, startM: 0, endH: 17, endM: 0,
                        room: salle3, speakers: [vaubaillon], theme: diffuser)

        // --- Salle 4 ---
        let c129 = conf(title: "Captivez votre audience lors des soirées Astro",
                        day: 15, startH: 9, startM: 0, endH: 10, endM: 0,
                        room: salle4, speakers: [], theme: diffuser)

        let c130 = conf(title: "Sevunscope: de la genèse à l'état actuel d'avancement du projet",
                        day: 15, startH: 10, startM: 0, endH: 11, endM: 0,
                        room: salle4, speakers: [gheno, roy], theme: observatoire)

        let c131 = conf(title: "Calculer et construire son astrolabe",
                        day: 15, startH: 11, startM: 0, endH: 12, endM: 0,
                        room: salle4, speakers: [deComite], theme: observations)

        let c132 = conf(title: "RAPAS 2026",
                        day: 15, startH: 14, startM: 0, endH: 15, endM: 0,
                        room: salle4, speakers: [midavaine], theme: photographie)

        let c133 = conf(title: "L'intégration des accès à l'observatoire virtuel dans PRISM et SHARPCAP",
                        day: 15, startH: 15, startM: 0, endH: 16, endM: 0,
                        room: salle4, speakers: [godard], theme: observations)

        let c134 = conf(title: "Aller plus loin avec les scripts de SHARPCAP",
                        day: 15, startH: 16, startM: 0, endH: 17, endM: 0,
                        room: salle4, speakers: [pittet], theme: observations)

        // --- Salle AB ---
        let c135 = conf(title: "Un planétarium dans une association d'astronomie",
                        day: 15, startH: 9, startM: 0, endH: 10, endM: 0,
                        room: salleAB, speakers: [galard], theme: diffuser)

        let c136 = conf(title: "Des projets astro au lycée – table ronde",
                        day: 15, startH: 10, startM: 0, endH: 11, endM: 0,
                        room: salleAB, speakers: [], theme: sciencesPartic)

        let c137 = conf(title: "International Congress of the Astronomical Youth",
                        day: 15, startH: 11, startM: 0, endH: 12, endM: 0,
                        room: salleAB, speakers: [bellon], theme: diffuser)

        let c138 = conf(title: "Collaboration ProAm Sol'Ex",
                        day: 15, startH: 14, startM: 0, endH: 15, endM: 0,
                        room: salleAB, speakers: [cornu], theme: spectroscopie)

        let c139 = conf(title: "Un spectro, comment ça marche?",
                        day: 15, startH: 15, startM: 0, endH: 16, endM: 0,
                        room: salleAB, speakers: [cochard], theme: spectroscopie)

        let c140 = conf(title: "API ProAm",
                        day: 15, startH: 16, startM: 0, endH: 17, endM: 0,
                        room: salleAB, speakers: [robert], theme: sciencesPartic)

        // MARK: - Insertion dans le contexte

        // Thèmes
        for theme in [planetologie, cometes, solaire, cosmologie, spectroscopie,
                      vieExoplanetes, espace, observatoire, observations, photographie,
                      sciencesPartic, diffuser, astronomie] {
            container.mainContext.insert(theme)
        }

        // Salles
        for room in [amphi1, amphi2, salle1, salle2, salle3, salle4, salleAB] {
            container.mainContext.insert(room)
        }

        // Conférenciers
        for speaker in [cuillandre, cruzalebes, dauvergne, niel, lekic, godard, strajnic,
                        martel, ancelle, cayrel, griton, graffand, garde, cochard, aubry,
                        buil, bertrand, leLain, mauclaire, pelletier, michel, dovidio, roche,
                        gheno, roy, leGue, langlois, cottin, duprat, fossé, bretMorel,
                        faboIndurain, suc, heully, hammer, maquet, doressoundiram, hennes,
                        pothier, richard, blateyron, montarges, henarejos, dvorkin,
                        hanonDegroote, biree, millet, foschino, beaudoin, durand, bourasseau,
                        biver, kobs, leDu, viger, desmars, lallemand, chariot, leroy, langin,
                        midavaine, gely, kabac, lecleire, legodec, lecureuil, outters, gilet,
                        legault, charnay, vaubaillon, viladrich, cirou, pasco, martin, desnoux,
                        champeau, cordier, cornu, chardin, freissinet, deComite, dubuche,
                        wunsche, daniel, lainey, roucelle, cessateur, ory, mandon, hennebelle,
                        defrance, janvier, lionnet, vauclair, blanck, oger, oudoux, legrand,
                        pittet, robert, riazelo, chatain, forget, gysembergh, marquet, tequi,
                        ubaud, elbaz, meunier, trangosi, soum, millot, changeat, bonnetBidaud,
                        bazin, loubiere, celle, balledant, porcel, galard, bellon] {
            container.mainContext.insert(speaker)
        }

        // Conférences
        for conference in [
            c01, c02, c03, c04, c05, c06, c07, c08, c09, c10,
            c11, c12, c13, c14, c15, c16, c17, c18, c19, c20,
            c21, c22, c23, c24, c25, c26, c27, c28, c29, c30,
            c31, c32, c33, c34, c35, c36, c37, c38, c39, c40,
            c41, c42, c43, c44, c45, c46, c47, c48, c49, c50,
            c51, c52, c53, c54, c55, c56, c57, c58, c59, c60,
            c61, c62, c63, c64, c65, c66, c67, c68, c69, c70,
            c71, c72, c73, c74, c75, c76, c77, c78, c79, c80,
            c81, c82, c83, c84, c85, c86, c87, c88, c89, c90,
            c91, c92, c93, c94, c95, c96, c97, c98, c99, c100,
            c101, c102, c103, c104, c105, c106, c107, c108, c109, c110,
            c111, c112, c113, c114, c115, c116, c117, c118, c119, c120,
            c121, c122, c123, c124, c125, c126, c127, c128, c129, c130,
            c131, c132, c133, c134, c135, c136, c137, c138, c139, c140
        ] {
            container.mainContext.insert(conference)
        }

        return container
    }
}
