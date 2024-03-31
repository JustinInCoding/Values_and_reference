//: [Previous](@previous)

import class UIKit.UIColor
import class UIKit.UIImage

struct InventoryItem {
	
	private final class Storage {
		var name: String
		var cost: String
		var barcode: String
		var color: UIColor
		var images: [UIImage]
		var comment: String
		
		init(name: String, cost: String, barcode: String, color: UIColor, images: [UIImage], comment: String) {
			self.name = name
			self.cost = cost
			self.barcode = barcode
			self.color = color
			self.images = images
			self.comment = comment
		}
		
		func copy() -> Storage {
			print("returning copy")
			return Storage(name: name, cost: cost, barcode: barcode, color: color, images: images, comment: comment)
		}
	}
	
	private var _storage: Storage
	private var _mutableStorage: Storage {
		mutating get {
			if !isKnownUniquelyReferenced(&_storage) {
				_storage = _storage.copy()
			}
			return _storage
		}
	}
	
	init(name: String, cost: String, barcode: String, color: UIColor, images: [UIImage], comment: String) {
		self._storage = Storage(name: name, cost: cost, barcode: barcode, color: color, images: images, comment: comment)
	}
	
	var name: String {
		get {
			return _storage.name
		}
		set {
			_mutableStorage.name = newValue
		}
	}
	
	var cost: String {
		get {
			return _storage.cost
		}
		set {
			_mutableStorage.cost = newValue
		}
	}
	
	var barcode: String {
		get {
			return _storage.barcode
		}
		set {
			_mutableStorage.barcode = newValue
		}
	}
	
	var color: UIColor {
		get {
			return _storage.color
		}
		set {
			_mutableStorage.color = newValue
		}
	}
	
	var images: [UIImage] {
		get {
			return _storage.images
		}
		set {
			_mutableStorage.images = newValue
		}
	}
	
	var comment: String {
		get {
			return _storage.comment
		}
		set {
			_mutableStorage.comment = newValue
		}
	}
}

var chair = InventoryItem(name: "Chair", cost: "$20", barcode: "001204", color: .black, images: [], comment: "placeholder")

var other = chair

chair.name
other.name

chair.name = "Rocking Chair"
chair.name
other.name
//: [Next](@next)
