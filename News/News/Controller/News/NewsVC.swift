//
//  NewsVC.swift
//  News
//
//  Created by TranKhanh on 8/22/22.
//

import UIKit
import RxSwift

class NewsVC: UIViewController {

    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "NewsCell"
    let disposeBag = DisposeBag()
    
    lazy var viewModel = {
        NewsViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        setupTableView()
        binding()
        loadData()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }

    func binding() {
        viewModel.news.asDriver().drive { [weak self] _ in
            self?.tableView.reloadData()
        }.disposed(by: disposeBag)
        
        tfSearch.rx.text
            .orEmpty
            .debounce(.milliseconds(1), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe { [weak self] text in
                self?.loadData()
            }
            .disposed(by: disposeBag)
    }
    
    func loadData() {
        let keyword = tfSearch.text.isEmptyOrNil ? "trump" : tfSearch.text!
        viewModel.getNews(keyword: keyword)
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

extension NewsVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.news.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? NewsCell else {
            return UITableViewCell()
        }
        let article = viewModel.news.value[indexPath.row]
        cell.configCell(article: article)
        return cell
    }
}

extension NewsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
