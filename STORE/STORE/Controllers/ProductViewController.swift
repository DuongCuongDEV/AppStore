//
//  ProductViewController.swift
//  STORE
//
//  Created by Dương Văn Cường on 11/01/2023.
//

import UIKit

class ProductViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
    
    
    var products : Products = []
    @IBOutlet weak var cltProductView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getProductsFromAPI()
        cltProductView.delegate = self
        cltProductView.dataSource = self
        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let screenWith = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: screenWith/2-10, height: 278)
        cltProductView.collectionViewLayout = layout
            
    }

    
    func getProductsFromAPI() {

        ProductAPI.init().getProducts { productsResponse in
                self.products = productsResponse
                self.cltProductView.reloadData()
            }
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cltProductView.dequeueReusableCell(withReuseIdentifier: "ProductIdentifier", for: indexPath)
        
        let currentProduct = products[indexPath.row]
        
        let imgPicture = cell.viewWithTag(1) as! UIImageView
        imgPicture.image = UIImage(named: "\(currentProduct.anhSANPham)")
        imgPicture.layer.cornerRadius = 5

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        tapGestureRecognizer.name = "\(currentProduct.maSANPham)"
        cell.isUserInteractionEnabled = true
        cell.addGestureRecognizer(tapGestureRecognizer)
        
        let lblTitle = cell.viewWithTag(2) as! UILabel
        lblTitle.text = currentProduct.tenSANPham
        
        let lblDescription = cell.viewWithTag(3) as! UILabel
        lblDescription.text = "\(currentProduct.giaTienSANPham)"
   
        
        return cell
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier:"DetailProduct") as? DetailViewController
        vc!.categoryId = sender.name
        vc? .modalPresentationStyle = .overFullScreen
        self.present(vc!,animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
