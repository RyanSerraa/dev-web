<%@ page contentType="text/html" pageEncoding="UTF-8"
    import="com.mycompany.webapplication.entity.Account,com.mycompany.webapplication.entity.Users" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="pt-BR">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Depósito - Banco Digital</title>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                }

                body {
                    background-color: #121212;
                    color: #e0e0e0;
                    padding: 20px;
                }

                .container {
                    max-width: 1000px;
                    margin: auto;
                    background-color: #1e1e1e;
                    padding: 30px;
                    border-radius: 10px;
                    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.6);
                }

                .header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 30px;
                    flex-wrap: wrap;
                    gap: 20px;
                }

                .header h1 {
                    font-size: 24px;
                    color: #ffffff;
                }

                .user-info {
                    font-size: 18px;
                    color: #bbbbbb;
                }

                .nav-menu {
                    display: flex;
                    gap: 15px;
                    flex-wrap: wrap;
                }

                .nav-menu a {
                    color: #3498db;
                    text-decoration: none;
                    padding: 8px 16px;
                    border-radius: 6px;
                    transition: background-color 0.3s;
                }

                .nav-menu a:hover {
                    background-color: rgba(52, 152, 219, 0.1);
                }

                .nav-menu a.active {
                    background-color: #3498db;
                    color: white;
                }

                .balance-card {
                    background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
                    color: white;
                    padding: 20px;
                    border-radius: 10px;
                    margin-bottom: 30px;
                    box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
                }

                .balance-title {
                    font-size: 16px;
                    opacity: 0.9;
                    margin-bottom: 10px;
                }

                .balance-amount {
                    font-size: 28px;
                    font-weight: bold;
                    margin-bottom: 5px;
                }

                .balance-subtitle {
                    font-size: 14px;
                    opacity: 0.8;
                }

                .section {
                    margin-top: 30px;
                }

                .section h2 {
                    font-size: 20px;
                    color: #ffffff;
                    margin-bottom: 20px;
                    border-bottom: 2px solid #444;
                    padding-bottom: 10px;
                }

                .form-group {
                    margin-bottom: 20px;
                }

                .form-group label {
                    display: block;
                    margin-bottom: 8px;
                    color: #bbbbbb;
                    font-size: 14px;
                    font-weight: 500;
                }

                .form-control {
                    width: 100%;
                    padding: 12px 16px;
                    background-color: #2a2a2a;
                    border: 2px solid #444;
                    border-radius: 8px;
                    color: #e0e0e0;
                    font-size: 16px;
                    transition: border-color 0.3s, box-shadow 0.3s;
                }

                .form-control:focus {
                    outline: none;
                    border-color: #3498db;
                    box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
                }

                .form-control::placeholder {
                    color: #888;
                }

                .input-with-currency {
                    position: relative;
                    display: flex;
                    align-items: center;
                }

                .currency-symbol {
                    position: absolute;
                    left: 16px;
                    color: #bbbbbb;
                    font-size: 16px;
                    z-index: 1;
                }

                .input-with-currency .form-control {
                    padding-left: 40px;
                }

                .btn-primary {
                    background-color: #3498db;
                    color: white;
                    border: none;
                    padding: 12px 24px;
                    font-size: 16px;
                    border-radius: 8px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                    font-weight: 600;
                }

                .btn-primary:hover {
                    background-color: #2980b9;
                }

                .alert {
                    padding: 15px;
                    border-radius: 8px;
                    margin-bottom: 20px;
                    font-size: 14px;
                }

                .alert-info {
                    background-color: rgba(52, 152, 219, 0.1);
                    border: 1px solid #3498db;
                    color: #3498db;
                }

                .alert-success {
                    background-color: rgba(39, 174, 96, 0.1);
                    border: 1px solid #27ae60;
                    color: #27ae60;
                }

                .alert-error {
                    background-color: rgba(231, 76, 60, 0.1);
                    border: 1px solid #e74c3c;
                    color: #e74c3c;
                }

                .breadcrumbs {
                    margin-bottom: 20px;
                    font-size: 14px;
                    color: #bbbbbb;
                }

                .breadcrumbs a {
                    color: #3498db;
                    text-decoration: none;
                }

                .breadcrumbs a:hover {
                    text-decoration: underline;
                }

                .breadcrumbs .separator {
                    margin: 0 8px;
                    color: #666;
                }

                @media (max-width: 768px) {
                    .container {
                        padding: 20px;
                    }

                    .header {
                        flex-direction: column;
                        align-items: flex-start;
                    }

                    .nav-menu {
                        width: 100%;
                        justify-content: center;
                    }

                    .balance-amount {
                        font-size: 24px;
                    }
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="header">
                    <h1>🏦 Banco Digital</h1>
                    <div class="user-info">Bem-vindo, ${usuario.name}</div>
                </div>

                <%@ include file="partials/menu.jsp" %>

                    <div class="breadcrumbs">
                        <a href="${pageContext.request.contextPath}/Home">Início</a>
                        <span class="separator">/</span>
                        <span>Depósito</span>
                    </div>

                    <!-- Card de Saldo -->
                    <div class="balance-card">
                        <div class="balance-title">Seu Saldo Atual</div>
                        <div class="balance-amount">R$ ${conta.balance}</div>
                        <div class="balance-subtitle">Disponível na conta</div>
                    </div>

                    <!-- Formulário de Depósito -->
                    <div class="section">
                        <h2>Novo Depósito</h2>

                        <c:if test="${not empty message}">
                            <div class="alert ${messageType == 'error' ? 'alert-error' : 'alert-success'}">
                                ${message}
                            </div>
                        </c:if>

                        <div class="alert alert-info">
                            Escolha o método de depósito e informe o valor
                        </div>

                        <form action="deposit" method="POST">
                            <div class="form-group">
                                <label for="method">Método de Depósito</label>
                                <select id="method" name="method" class="form-control" required>
                                    <option value="">Selecione um método</option>
                                    <option value="pix" ${param.method=='pix' ? 'selected' : '' }>PIX</option>
                                    <option value="boleto" ${param.method=='boleto' ? 'selected' : '' }>Boleto Bancário
                                    </option>
                                    <option value="transfer" ${param.method=='transfer' ? 'selected' : '' }>
                                        Transferência Bancária</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="amount">Valor do Depósito</label>
                                <div class="input-with-currency">
                                    <span class="currency-symbol">R$</span>
                                    <input type="number" id="amount" name="amount" class="form-control" min="0.01"
                                        step="0.01" required placeholder="0,00" value="${param.amount}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="description">Descrição (opcional)</label>
                                <input type="text" id="description" name="description" class="form-control"
                                    placeholder="Ex: Depósito salário" value="${param.description}">
                            </div>

                            <button type="submit" class="btn-primary">Confirmar Depósito</button>
                        </form>
                    </div>
            </div>
        </body>

        </html>