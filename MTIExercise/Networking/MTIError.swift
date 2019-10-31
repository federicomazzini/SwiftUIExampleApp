//
//  MTIError.swift
//  MTIExercise
//
//  Created by federico mazzini on 30/10/19.
//  Copyright © 2019 federico mazzini. All rights reserved.
//

import Foundation

enum MTIError: Error {
  case parsing(description: String)
  case network(description: String)
}
