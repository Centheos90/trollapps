//
//  OtherView.swift
//  TrollApps
//
//  Created by Анохин Юрий on 11.11.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct OtherView: View {
    @Environment(\.openURL) var openURL
    @State private var safemode = true
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Options"), footer: Text("The Delete Cache button should be used if the app weights a bit too much on your Device.")) {
                    Button("Delete Cache") {
                        UIApplication.shared.alert(title: "Clearing Cache", body: "Please wait", animated: false, withButton: false)
                        SDImageCache.shared.clearMemory()
                        SDImageCache.shared.clearDisk()
                        URLCache.shared.removeAllCachedResponses()
                        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
                            UIApplication.shared.change(title: "Success!", body: "The app will now quit...")
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                                    exit(0)
                                }
                            })
                        }
                    }
                    Button("Delete All Repos") {
                        UIApplication.shared.alert(title: "Deleting Repos", body: "Please wait", animated: false, withButton: false)
                        if let bundleID = Bundle.main.bundleIdentifier {
                            UserDefaults.standard.removePersistentDomain(forName: bundleID)
                        }
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                            UIApplication.shared.change(title: "Success!", body: "The app will now quit...")
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                                    exit(0)
                                }
                            })
                        }
                    }
                    .foregroundColor(Color.red)
                }
                
                Section(header: Text("Developers")) {
                    Label {
                        HStack {
                            Button("Haxi0") {
                                openURL(URL(string: "https://www.github.com/Haxi0")!)
                            }
                        }
                    } icon: {
                        Image("Haxi0Icon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                    }
                    Label {
                        HStack {
                            Button("Cleover") {
                                openURL(URL(string: "https://www.github.com/Cleover")!)
                            }
                        }
                    } icon: {
                        Image("CleoverIcon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                    }
                    Label {
                        HStack {
                            Button("BonnieDev") {
                                openURL(URL(string: "https://www.github.com/Bonnie39")!)
                            }
                        }
                    } icon: {
                        Image("BonnieDevIcon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                    }
                }
                
                Section(header: Text("Thanks to..."), footer: Text("Biggest thanks to these wonderful apps, articles and people! Without them, this project won't be possible or would not even exist!")) {
                    Label {
                        HStack {
                            Button("@AppInstalleriOS") {
                                openURL(URL(string: "https://twitter.com/AppInstalleriOS")!)
                            }
                        }
                    } icon: {
                        Image("AppInstalleriOSIcon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                    }
                    Label {
                        HStack {
                            Button("@sourceloc") {
                                openURL(URL(string: "https://twitter.com/sourceloc")!)
                            }
                        }
                    } icon: {
                        Image("sourcelocationIcon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                    }
                    Label {
                        HStack {
                            Button("@talhah58") {
                                openURL(URL(string: "https://twitter.com/talhah58")!)
                            }
                        }
                    } icon: {
                        Image("TalhahIcon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                    }
                    Label {
                        Button("Interactful App") {
                            openURL(URL(string: "https://apps.apple.com/us/app/interact-a-field-guide/id1528095640")!)
                        }
                    } icon: {
                        Image("InteractfulIcon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                    }
                    Label {
                        HStack {
                            Button("iOScreator") {
                                openURL(URL(string: "https://www.ioscreator.com/tutorials/swiftui-json-list-tutorial")!)
                            }
                        }
                    } icon: {
                        Image("iOScreatorIcon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                    }
                    Label {
                        HStack {
                            Button("Andrean Prabowo") {
                                openURL(URL(string: "https://www.flaticon.com/free-icon/undo_3272462?term=rounded%20arrow&page=1&position=24&page=1&position=24&related_id=3272462&origin=search")!)
                            }
                        }
                    } icon: {
                        Image("AndreanPrabowoIcon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 7))
                    }
                }
                
                Section(header: Text("Other projects used and their licenses")) {
                    Button("SDWebImageSwiftUI Project") {
                        openURL(URL(string: "https://github.com/SDWebImage/SDWebImageSwiftUI")!)
                    }
                    Button("SDWebImageSwiftUI MIT License") {
                        openURL(URL(string: "https://github.com/SDWebImage/SDWebImageSwiftUI/blob/master/LICENSE")!)
                    }
                }
                
                Section(header: Text("Help the project")) {
                    Button("Join our Discord!") {
                        openURL(URL(string: "https://discord.gg/PrF6XqpGgX")!)
                    }
                    Button("Report a Bug!") {
                        openURL(URL(string: "https://discord.gg/PrF6XqpGgX")!)
                    }.foregroundColor(Color.red)
                    Button("JSON template to create your own repo!") {
                        openURL(URL(string: "https://raw.githubusercontent.com/TheResonanceTeam/.default-sources/main/haxi0_2.0.json")!)
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .navigationViewStyle(.stack)
    }
}
