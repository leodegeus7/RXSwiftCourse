//
//  ViewController.swift
//  RXSwift-Examples
//
//  Created by Leonardo Geus on 18/09/2018.
//  Copyright © 2018 Leonardo Geus. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var buttonRx: UISwitch!
    
    @IBOutlet weak var sliderRx: UISlider!
    @IBOutlet weak var labelRx: UILabel!
    
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonRx.rx.value.asDriver()
            .drive(self.sliderRx.rx.isHidden)
            .disposed(by: disposeBag)
        
        buttonRx.rx.value.asDriver().map {
            "\($0)"
            }.drive(labelRx.rx.text)
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

