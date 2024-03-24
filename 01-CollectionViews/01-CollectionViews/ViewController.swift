//
//  ViewController.swift
//  01-CollectionViews
//
//  Created by Christian Rizo on 21/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private  let myCountries =  ["Nicaragua", "CostaRica", "Espana", "Colombia", "Mexico","USA","Brazil", "Canada", "Alemania", "Paraguay", "Ecuador"];
    
    // UIScreen.main.bounds.width -> Obtiene el ancho total de la pabtalla
    private let myCellWidth = UIScreen.main.bounds.width / 2
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // test git ..
        // Accedemos al datasource y lo delegamos sobre
        // nosotros mismos
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        // Ahora registraremos el tipo de celda en el collection view
        collectionView.register(UINib(nibName: "MyCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mycell")
    }
    
    
}


//MARK: - UICollectionViewDataSource
extension  ViewController: UICollectionViewDataSource {
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as? MyCustomCollectionViewCell
        
        cell!.myFirstLabel.text = myCountries[indexPath.row]
        return cell!
    }
}


// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
    // didSelectItemAt: Para detectar eventos de el collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\u{001B}[2J")
        print("\(indexPath.section) - \(indexPath.row) - \(myCountries[indexPath.row])")
    }
}


// ---------------------------------------------
// Aqui definimos los tamanos de la pantalla
// ---------------------------------------------

//MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Aca realizamos una validacion para crear dos tamanos diferentes de
        // celdas
        if indexPath.section == 0 {
            return CGSize(width: myCellWidth, height: myCellWidth)
        }
        
        return CGSize(width: myCellWidth * 2, height: myCellWidth * 2)
    }
}
