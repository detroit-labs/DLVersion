//
//  ContentView.swift
//  Shared
//
//  Created by Vincent Frascello on 2/23/22.
//

import SwiftUI
import DLVersion

struct ContentView: View {
    
    private let olderVersion = DLVersion.version(string: "1.2.3")
    private let newerVersion = DLVersion.version(string: "1.2.4")
    private let equalVersion = DLVersion.version(string: "1.2.3")
    private let majorVersion = DLVersion.version(string: "1")
    private let minorVersion = DLVersion.version(string: "1.2")
    private let expandedVersion = DLVersion.version(string: "1.2.3.4.5.6")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("DLVersion API\n").font(.title)
            Group {
                Text("Static functions").font(.callout)
                Text("**DLVersion.localVersion()** \(DLVersion.localVersion())")
                Text("**DLVersion.version(string: \"1.2.3\")**: \(DLVersion.version(string: "1.2.3"))")
                Text("\n")
            }
            Group {
                Text("Comparisons").font(.callout)
                Text("**isOlderThan(version:)** \(olderVersion.string) is Older Than \(newerVersion.string): \(olderVersion.isOlderThan(version: newerVersion).description)")
                Text("**isOlderThan(version:)** \(newerVersion.string) is Older Than \(olderVersion.string): \(newerVersion.isOlderThan(version: olderVersion).description)")
                Text("**isNewerThan(version:)** \(olderVersion.string) is Newer Than \(newerVersion.string): \(olderVersion.isNewerThan(version: newerVersion).description)")
                Text("**isNewerThan(version:)** \(newerVersion.string) is Newer Than \(olderVersion.string): \(newerVersion.isNewerThan(version: olderVersion).description)")
                Text("**isEqualTo(version:)** \(newerVersion.string) is Equal To \(olderVersion.string): \(newerVersion.isEqualTo(version: olderVersion).description)")
                Text("**isEqualTo(version:)** \(olderVersion.string) is Equal To \(expandedVersion.string): \(olderVersion.isEqualTo(version: expandedVersion).description)")
            }
            Group {
                Text("\n*Comparing Major, Minor, and Patch versions works as well.*\n")
                Text("**isNewerThan(version:)** \(olderVersion.string) is Newer Than \(minorVersion.string): \(olderVersion.isNewerThan(version: minorVersion).description)")
                Text("**isNewerThan(version:)** \(minorVersion.string) is Older Than \(expandedVersion.string): \(minorVersion.isOlderThan(version: olderVersion).description)")
                Text("**isEqualTo(version:)** \(majorVersion.string) is Equal To \(expandedVersion.string): \(majorVersion.isEqualTo(version: expandedVersion).description)")
            }
        }.padding().font(.system(size: 10, weight: .light))
    }
}
