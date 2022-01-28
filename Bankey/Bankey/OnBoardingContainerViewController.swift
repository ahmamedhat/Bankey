//
//  OnBoardingContainerViewController.swift
//  Bankey
//
//  Created by Ahmad Medhat on 02/01/2022.
//

import UIKit

class OnBoardingContainerViewController : UIViewController {
    
    var pageViewController: UIPageViewController
    var pages = [UIViewController]()
    var currentVC: UIViewController
    var closeButton = UIButton(type: .system)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnBoardingViewController(labelText: "Hello, bankey is fucking great app you can download and enjoy more than million english pounds yearly", imageName: "delorean")
        let page2 = OnBoardingViewController(labelText: "Hello, bankey is fucking great app you can download and enjoy more than million english pounds yearly", imageName: "world")
        let page3 = OnBoardingViewController(labelText: "Hello, bankey is fucking great app you can download and enjoy more than million english pounds yearly", imageName: "thumbs")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first!
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
        
    }
    
    private func setup() {
        view.backgroundColor = .systemPurple
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true, completion: nil)
        currentVC = pages.first!
    }
    
    private func layout() {
        
        //Page View
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor)
        ])
        
        //Close Button
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
        ])
    }
    
    private func style() {
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closeClicked), for: .primaryActionTriggered)
        closeButton.setTitle("Close", for: [])
        view.addSubview(closeButton)
    }
}


extension OnBoardingContainerViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    func getPreviousViewController(from view: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: view), index - 1 >= 0 else {return nil}
        currentVC = pages[index - 1]
        return pages[index - 1]
        
    }
    
    func getNextViewController(from view: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: view), index + 1 < pages.count else {return nil}
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}


//MARK: - Actions
extension OnBoardingContainerViewController {
    @objc func closeClicked() {
        print("close clicked")
    }
}
