//
//  DayDetailViewController.swift
//  bomBae
//
//  Created by Tejasvi Verma on 16/06/25.
//

import UIKit

class DayDetailViewController: UIViewController, UICollectionViewDataSource,
                               UICollectionViewDelegate,
                               UICollectionViewDelegateFlowLayout,
                               UIImagePickerControllerDelegate,
                               UINavigationControllerDelegate,
                               UITextViewDelegate  {
    
    var selectedDay: Int = 1
    var photos: [UIImage] = []
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var journalTextView: UITextView!
    @IBOutlet weak var moodSegmentedControl: UISegmentedControl!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var expenseButton: UIButton!
    @IBOutlet weak var highlightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Day \(selectedDay)"
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        
        journalTextView.layer.borderColor = UIColor.lightGray.cgColor
        journalTextView.layer.borderWidth = 1.0
        journalTextView.layer.cornerRadius = 8
        journalTextView.delegate = self
        journalTextView.text = "Write about your day..."
        journalTextView.textColor = .lightGray
        
        moodSegmentedControl.selectedSegmentIndex = 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count + 1 // last one is the "+" cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath)
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        if indexPath.item == photos.count {
            // "+" cell
            let plusLabel = UILabel(frame: cell.bounds)
            plusLabel.text = "+"
            plusLabel.textAlignment = .center
            plusLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
            plusLabel.textColor = .darkGray
            cell.contentView.backgroundColor = .systemGray5
            cell.contentView.addSubview(plusLabel)
        } else {
            let imageView = UIImageView(image: photos[indexPath.item])
            imageView.frame = cell.bounds
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            cell.contentView.addSubview(imageView)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == photos.count {
            presentPhotoPicker()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    // MARK: - Image Picker
    
    func presentPhotoPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            photos.append(image)
            photoCollectionView.reloadData()
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Journal Placeholder Behavior
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "Write about your day..."
            textView.textColor = .lightGray
        }
    }
    
}
