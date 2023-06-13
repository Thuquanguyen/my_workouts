//
//  MetricsModel.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 13/06/2023.
//

import Foundation

struct MetricModel: Codable {
  var id: Int
  var title: String
  var value: String
  var unit: String
  
  private enum CodingKeys: String, CodingKey {
    case id
    case title
    case value
    case unit
  }
  
  init?(dictionary: [String: Any]) {
    guard
      let id = dictionary[CodingKeys.title.rawValue] as? Int,
      let title = dictionary[CodingKeys.title.rawValue] as? String,
      let value = dictionary[CodingKeys.value.rawValue] as? String,
      let unit = dictionary[CodingKeys.unit.rawValue] as? String
    else {
        return nil
    }
    
    self.id = id
    self.title = title
    self.value = value
    self.unit = unit
  }
  
    init(id:Int,title: String, value: String, unit: String) {
      self.id = id
      self.title = title
      self.value = value
      self.unit = unit
  }
}
