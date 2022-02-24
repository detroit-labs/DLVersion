//
//  DLVersion.swift
//  DLVersion
//
//  Created by Vincent Frascello on 2/23/22.
//  Copyright (c) 2022 Detroit Labs. All rights reserved.
//

import Foundation

final public class DLVersion: NSObject {
    
    private var versionComponents: VersionType
    
    private init(for versionString: String) {
        let filteredString = versionString.filter( { ($0.isASCII && $0.isWholeNumber) || $0 == "." })
        let parts  = filteredString.components(separatedBy: ".").filter( { !$0.isEmpty }).map({ Int($0)! })
        switch parts.count {
        case 0:
            self.versionComponents = .empty
        case 1:
            self.versionComponents = .major(parts[0])
        case 2:
            self.versionComponents = .minor(parts[0], parts[1])
        case 3:
            self.versionComponents = .patch(parts[0], parts[1], parts[2])
        default:
            self.versionComponents = .expanded(parts)
        }
    }
}

@objc
public extension DLVersion {
    
    static func version(string: String) -> DLVersion {
        return .init(for: string)
    }
    
    static func localVersion() -> DLVersion {
        guard let bundleVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return DLVersion.version(string: "0.0.0") }
        return version(string: bundleVersion)
    }
    
    override var description: String {
        return string
    }
    
    override var hash: Int {
        return self.string.hash
    }
    
    var string: String {
        return self.versionComponents.string ?? "0.0.0"
    }
    
    func isEqualToVersion(_ version: DLVersion) -> Bool{
        return self == version
    }
    
    func isOlderThanVersion(_ version: DLVersion) -> Bool {
        return compare(version) == .orderedAscending
    }
    
    func isNewerThanVersion(_ version: DLVersion) -> Bool {
        return compare(version) == .orderedDescending
    }
}

private extension DLVersion {
    
    static func == (lhs: DLVersion, rhs: DLVersion) -> Bool {
        return lhs.versionComponents == rhs.versionComponents
    }
    
    func compare(_ other: DLVersion) -> ComparisonResult {
        return self.string.compare(other.string, options: .numeric)
    }
}

private enum VersionType: Equatable {
    case empty
    case major(Int)
    case minor(Int, Int)
    case patch(Int, Int, Int)
    case expanded([Int])
    
    var string: String? {
        switch self {
        case .empty:
            return nil
        case .major(let major):
            return "\(major)"
        case .minor(let major, let minor):
            return "\(major).\(minor)"
        case .patch(let major, let minor, let patch):
            return "\(major).\(minor).\(patch)"
        case .expanded(let array):
            var string = ""
            for number in array {
                string.append(String(number)+".")
            }
            return String(string.dropLast())
        }
    }
    
    static func == (lhs: VersionType, rhs: VersionType) -> Bool {
        return lhs.string == rhs.string
    }
}
