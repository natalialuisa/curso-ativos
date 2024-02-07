// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

import "./owner.sol";
import "./titulo.sol";

/**
 * @title UR
 * @dev Implementacao de uma UR
 * @author Natalia Pinto


 Usando a rede Sepolia:
Fazer deploy de uma Nota Comercial, Debenture, Custodia e desenvolver um contrato CCB ou Duplicata que seja (implemente) um Titulo e fazer o deploy deste ultimo;
Adicionar no contrato de Custodia os três contratos do tipo Titulo acima (Nota Comercial, Debenture e um contrato CCB ou Duplicata)
No repositório Github colocar os fontes e no fonte do contrato de Custodia deve haver um comentario com o endereço do contrato de Custodia na rede Sepolia

 */
 contract UR is Titulo, Owner {

    string _originador;
    string _arranjo;
    
    uint256 immutable _dataReferencia;
    uint256 _valor;
    uint8 immutable _decimais;
    uint256 _dataPrevistaLiquidacao;
    uint16 _fracoes;
    string public rating;


    constructor() {
        _originador = "Padaria do Ze";
        _dataReferencia = block.timestamp;
        _valor = 100000000;
        _decimais = 2;
        _dataPrevistaLiquidacao = _dataReferencia + 90 days;
        rating = "BBB-";
        _fracoes = 1000;
        emit NovoPrazoPagamento(_dataReferencia, _dataPrevistaLiquidacao);
    }

    /**
     * @dev Retorna o valor nominal.
     */
    function valorNominal() external view returns (uint256) {
        return _valor;
    }

    /**
     * @dev Retorna o nome do Emissor.
     */
    function nomeEmissor() external view returns (string memory) {
        return _originador;
    }

    /**
     * @dev Retorna a data de emissao.
     */
    function dataEmissao() external view returns (uint256) {
        return _dataReferencia;
    }

    function dataPrevistaLiquidacao() external view returns (uint256) {
        return _dataPrevistaLiquidacao;
    }

        /**
     * @dev Retorna o arranjo.
     */
    function arranjo() external view returns (string memory) {
        return _arranjo;
    }

    /**
    * @dev muda o rating
    * @notice dependendo da situacao economica a empresa avaliadora pode mudar o rating
    * @param novoRating novo rating da debenture
    */
    function mudaRating(string memory novoRating) external onlyOwner returns (bool) {
        rating = novoRating;
        return true;
    }

    function alteraFracoes(uint16 fracoes_) external onlyOwner returns (bool) {
        require(fracoes_ >=100, "numero de fracoes baixo");
        _fracoes = fracoes_;
        return true;
    }

    
    function antecipa() external onlyOwner returns (uint256) {
        _dataPrevistaLiquidacao = block.timestamp;
        return _dataPrevistaLiquidacao;
    }

    /**
    * @dev retorna o valor da variavel fracoes
    * @notice informa o numero de fracoes da debenture
    */
    function fracoes() external view returns (uint16) {
        return _fracoes;
    }
    

 }