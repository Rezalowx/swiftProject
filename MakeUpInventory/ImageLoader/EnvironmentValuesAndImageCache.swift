//
//  EnvironmentValuesAndImageCache.swift
//  MakeUpInventory
//
//  Created by Grégory Brugnet on 10/07/2020.
//  Copyright © 2020 Grégory Brugnet. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}

