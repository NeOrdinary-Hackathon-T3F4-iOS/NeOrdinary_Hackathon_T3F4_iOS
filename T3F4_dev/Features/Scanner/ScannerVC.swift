//
//  ScannerVC.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/18/25.
//


import Foundation
import UIKit
import AVFoundation
protocol ScannerVCDelegate: AnyObject {
    func scannerDidFinish()
}


class ScannerVC: UIViewController, AVCapturePhotoCaptureDelegate, ScannerView {
    func stopIndicator() {
        stopLoading()
    }
    
    init(viewModel: ScannerVM) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let indicator = UIActivityIndicatorView(style: .large)
    
    var pickedImg = UIImage()
    
    weak var delegate: ScannerVCDelegate?
    
    let viewModel: ScannerVM
    
    let bottomBar = UIView().then {
        $0.backgroundColor = UIColor(named: R.Color.neutral_white.rawValue)
    }
    let topBar = UIView().then {
        $0.backgroundColor = UIColor(named: R.Color.neutral_white.rawValue)
    }
    
    var device: AVCaptureDevice?
    private var captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer!
    private let photoOutput = AVCapturePhotoOutput()
    
    private var againCaptureBtn = UIButton().then {
        $0.setTitle("닫기", for: .normal)
        $0.setTitle("다시찍기", for: .selected)
        $0.isSelected = false
        $0.backgroundColor = UIColor(named: R.Color.neutral_20.rawValue)
        $0.setTitleColor(UIColor(named: R.Color.neutral_90.rawValue), for: .normal)
        $0.titleLabel?.font = AppFont.body_medium_medium.uiFont
        $0.layer.cornerRadius = 8
        
    }
    
    private var conformBtn = UIButton().then {
        $0.setTitle("등록하기", for: .normal)
        $0.backgroundColor = UIColor(named: R.Color.primary_disabled.rawValue)
        $0.titleLabel?.font = AppFont.body_medium_medium.uiFont
        $0.setTitleColor(UIColor(named: R.Color.neutral_white.rawValue), for: .normal)
        $0.layer.cornerRadius = 8
        $0.isEnabled = false
    }
    
    private var captureBtn = UIButton().then {
        $0.backgroundColor = .white
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 16)
        $0.setImage(UIImage(named: "captureBtn"), for: .normal)
    }
    
    
    var returnImg = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        indicator.center = view.center
        indicator.hidesWhenStopped = true
        
        cameraDeviceSettings()
        configurePreviewLayer()
        
        self.view.addSubview(bottomBar)
        self.view.addSubview(topBar)
        
        bottomBar.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        topBar.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(100)
        }
        //버튼
        btnConfigure()
        configureSession()
        DispatchQueue.global().async {
            self.captureSession.startRunning()
        }
        
        view.addSubview(indicator)


    }
    
    func startLoading() {
        DispatchQueue.main.async {
            
            self.indicator.startAnimating()
            self.view.isUserInteractionEnabled = false  // 터치 방지
        }
       }

       func stopLoading() {
           DispatchQueue.main.async {
               self.indicator.stopAnimating()
               self.view.isUserInteractionEnabled = true

           }
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    
    
    func btnConfigure() {
        
        self.bottomBar.addSubview(captureBtn)
        
        [againCaptureBtn, conformBtn].forEach {
            self.topBar.addSubview($0)
        }
        
        self.captureBtn.snp.makeConstraints {
            $0.width.height.equalTo(60)
            $0.centerX.centerY.equalToSuperview()
        }
        
        self.againCaptureBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(4)
            $0.height.equalTo(48)
            $0.width.equalTo(60)
            $0.leading.equalToSuperview().inset(16)
        }
        
        self.conformBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(4)
            $0.height.equalTo(48)
            $0.width.equalTo(88)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        captureBtn.addTarget(self, action: #selector(captureBtnTapped), for: .touchUpInside)
        againCaptureBtn.addTarget(self, action: #selector(againCaptureBtnTapped), for: .touchUpInside)
        conformBtn.addTarget(self, action: #selector(conformBtnTapped), for: .touchUpInside)
    }
    
    @objc
    func captureBtnTapped() {
        let settings = AVCapturePhotoSettings()
        settings.flashMode = .auto
        photoOutput.capturePhoto(with: settings, delegate: self)
        conformBtn.backgroundColor = UIColor(named: R.Color.primary_default.rawValue)
        conformBtn.isEnabled = true
        againCaptureBtn.isSelected = true
        
        //카메라 멈추기
        previewLayer.connection?.isEnabled = false
        
        captureSession.stopRunning()

    }
    
    
    
    //MARK: 등록하기 -> VM
    @objc
    func conformBtnTapped() {
        startLoading()
        viewModel.setImageToServcer(img: self.pickedImg, type: .petLabel)
        
    }
    @objc
    func againCaptureBtnTapped() {
        if againCaptureBtn.isSelected {
            // 다시찍기
            conformBtn.backgroundColor = UIColor(named: R.Color.primary_disabled.rawValue)
            conformBtn.isEnabled = false
            previewLayer.connection?.isEnabled = true
            againCaptureBtn.isSelected = false
            
            DispatchQueue.global().async {
                self.captureSession.startRunning()
                
            }
            
        } else {
            // 닫기
            delegate?.scannerDidFinish()
            againCaptureBtn.isSelected = true
            
        }
        
    }
}

// MARK: Camera Modules
extension ScannerVC {
    
    func photoOutput(_ output: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photo: AVCapturePhoto,
                     error: Error?) {
        guard error == nil,
              let imageData = photo.fileDataRepresentation(),
              let image = UIImage(data: imageData)
                
        else {
        
            print("사진 처리 실패:", error ?? "")
            return
        }
        print("")
        self.pickedImg = image
    }
    
    private func configurePreviewLayer() {
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.bounds
        view.layer.insertSublayer(previewLayer, at: 0)
    }
    
    func cameraDeviceSettings() {
        var device: AVCaptureDevice!
        if let defaultDevice = AVCaptureDevice.default(.builtInTripleCamera, for: .video, position: .back) {
            device = defaultDevice
        } else if let defaultDevice = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) {
            device = defaultDevice
        } else if let defaultDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video , position: .back) {
            device = defaultDevice
        } else {
            print("지원되는 카메라가 없습니다.")
        }
        do {
            try device.lockForConfiguration()
            
            // 자동 초점 활성화
            if device.isFocusModeSupported(.continuousAutoFocus) == true {
                device.focusMode = .continuousAutoFocus
            }
            
            // 가까운 거리에서도 초점이 잘 맞도록 렌즈 위치 제어
            if device.isAutoFocusRangeRestrictionSupported == true {
                device.autoFocusRangeRestriction = .near
            }
            
            device.unlockForConfiguration()
        } catch {
            print("Error locking configuration: \(error)")
        }
        
    }
    
}
// MARK: - AVFoundation
extension ScannerVC {
    private func configureSession() {
        captureSession.beginConfiguration()
        
        // 1) 디바이스 입력
        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                   for: .video,
                                                   position: .back),
              let input = try? AVCaptureDeviceInput(device: camera),
              captureSession.canAddInput(input)
        else {
            captureSession.commitConfiguration()
            return
        }
        captureSession.addInput(input)
        
        // 2) 사진 출력
        guard captureSession.canAddOutput(photoOutput) else {
            captureSession.commitConfiguration()
            return
        }
        captureSession.addOutput(photoOutput)
        captureSession.sessionPreset = .photo
        
        captureSession.commitConfiguration()
    }
    
    
}

