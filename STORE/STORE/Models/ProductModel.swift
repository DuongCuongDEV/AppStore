//
//  ProductModel.swift
//  STORE
//
//  Created by Dương Văn Cường on 11/01/2023.
//

import Foundation

// MARK: - ProductElement
struct Product: Codable {
    let maSANPham: Int
    let tenSANPham, anhSANPham, chiTietSANPham, maKichCo: String
    let giaTienSANPham: Int
    let maDanhMuc, ngayTao: String

    enum CodingKeys: String, CodingKey {
        case maSANPham = "ma_san_pham"
        case tenSANPham = "ten_san_pham"
        case anhSANPham = "anh_san_pham"
        case chiTietSANPham = "chi_tiet_san_pham"
        case maKichCo = "ma_kich_co"
        case giaTienSANPham = "gia_tien_san_pham"
        case maDanhMuc = "ma_danh_muc"
        case ngayTao = "ngay_tao"
    }
}

typealias Products = [Product]
