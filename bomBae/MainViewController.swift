//
//  ViewController.swift
//  bomBae
//
//  Created by Tejasvi Verma on 13/06/25.
//

import UIKit

class MainViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bombay Diaries"
    }

    @IBAction func dayButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let detailVC = storyboard.instantiateViewController(withIdentifier: "DayDetailViewController") as! DayDetailViewController
                detailVC.selectedDay = sender.tag
                navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

