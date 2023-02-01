//
//  TableViewController.swift
//  eggplant-brownie
//
//  Created by Douglas Dreer on 01/02/23.
//  Copyright © 2023 Alura. All rights reserved.
//

import UIKit

class RefeicoesViewController: UITableViewController {
    var refeicaoList = [
        Refeicao(nome: "Feijão", felicidade: 3),
        Refeicao(nome: "Pizza", felicidade: 5),
        Refeicao(nome: "Ovo", felicidade: 2),
       
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("total de registros são \(refeicaoList.count)")
        return refeicaoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicaoList[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        return celula
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.tableViewController = self
        }
    }
    
    func adicionarItem(_ refeicao: Refeicao) {
        refeicaoList.append(refeicao)
        tableView.reloadData()
    }
    
}
