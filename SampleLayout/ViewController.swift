//
//  ViewController.swift
//  SampleLayout
//
//  Created by radhakrishnan S on 30/06/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
let placeHolderIndex = 3
class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var categoryList : [ String ] = []
    var isCategoriesExpanded = false
    override func viewDidLoad() {
        super.viewDidLoad()
        let path : String = Bundle.main .path(forResource: "categories", ofType: "plist")!
        self.categoryList = NSArray(contentsOfFile:path) as! [String]
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        if(section == 0 ){
            return isCategoriesExpanded ? categoryList.count : 4;
        }else{
            return 1;
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if (indexPath.section == 0) {
            var text = categoryList[indexPath.row]
            if indexPath.row == placeHolderIndex {
                text = isCategoriesExpanded ? "less" : "more"
            }
            
            let cell : CategoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.title.text = text
            cell.imageView.image = UIImage(named: text + ".png" )
            return cell;
        }else{
            let cell : UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath)
            return cell
        }
        
    }
    
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 3
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 0 {
            let width = collectionView.bounds.size.width / 4.0
            return CGSize(width: width, height: width)
        }
        else{
            return CGSize(width: collectionView.bounds.size.width, height: 400)
        }
    }
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if indexPath.section == 0 && indexPath.row == placeHolderIndex {
            isCategoriesExpanded = !isCategoriesExpanded
            collectionView .reloadData()
        }
    }
}
