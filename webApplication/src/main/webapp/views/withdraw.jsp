<%@ page contentType="text/html" pageEncoding="UTF-8"
    import="com.mycompany.webapplication.entity.Account,com.mycompany.webapplication.entity.Users" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="pt-BR">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Saque - Banco Digital</title>
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
                    background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
                    color: white;
                    padding: 20px;
                    border-radius: 10px;
                    margin-bottom: 30px;
                    box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3);
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
                    border-color: #e74c3c;
                    box-shadow: 0 0 0 3px rgba(231, 76, 60, 0.2);
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
                    background-color: #e74c3c;
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
                    background-color: #c0392b;
                }

                .btn-secondary {
                    background-color: #95a5a6;
                    color: white;
                    border: none;
                    padding: 12px 24px;
                    font-size: 16px;
                    border-radius: 8px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                    font-weight: 600;
                    margin-right: 10px;
                }

                .btn-secondary:hover {
                    background-color: #7f8c8d;
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

                .alert-warning {
                    background-color: rgba(243, 156, 18, 0.1);
                    border: 1px solid #f39c12;
                    color: #f39c12;
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

                .quick-amounts {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
                    gap: 10px;
                    margin-bottom: 20px;
                }

                .quick-amount-btn {
                    background-color: #2a2a2a;
                    border: 2px solid #444;
                    color: #e0e0e0;
                    padding: 10px;
                    border-radius: 8px;
                    cursor: pointer;
                    transition: all 0.3s;
                    font-size: 14px;
                    font-weight: 500;
                }

                .quick-amount-btn:hover {
                    border-color: #e74c3c;
                    background-color: rgba(231, 76, 60, 0.1);
                }

                .quick-amount-btn.selected {
                    border-color: #e74c3c;
                    background-color: #e74c3c;
                    color: white;
                }

                .withdrawal-limits {
                    background-color: #2a2a2a;
                    padding: 15px;
                    border-radius: 8px;
                    margin-bottom: 20px;
                    border-left: 4px solid #f39c12;
                }

                .withdrawal-limits h4 {
                    color: #f39c12;
                    margin-bottom: 10px;
                    font-size: 14px;
                }

                .withdrawal-limits ul {
                    list-style: none;
                    font-size: 13px;
                    color: #bbbbbb;
                }

                .withdrawal-limits li {
                    margin-bottom: 5px;
                }

                .withdrawal-limits li:before {
                    content: "•";
                    color: #f39c12;
                    margin-right: 8px;
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

                    .quick-amounts {
                        grid-template-columns: repeat(2, 1fr);
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
                        <span>Saque</span>
                    </div>

                    <!-- Card de Saldo -->
                    <div class="balance-card">
                        <div class="balance-title">Seu Saldo Disponível</div>
                        <div class="balance-amount">R$ ${conta.balance}</div>
                        <div class="balance-subtitle">Para saque</div>
                    </div>

                    <!-- Limites de Saque -->
                    <div class="withdrawal-limits">
                        <h4>⚠️ Limites de Saque</h4>
                        <ul>
                            <li>Saque mínimo: R$ 10,00</li>
                            <li>Saque máximo por operação: R$ 1.000,00</li>
                            <li>Limite diário: R$ 3.000,00</li>
                            <li>Taxa de saque: R$ 3,50 (após 4 saques gratuitos/mês)</li>
                        </ul>
                    </div>

                    <!-- Formulário de Saque -->
                    <div class="section">
                        <h2>Novo Saque</h2>

                        <c:if test="${not empty message}">
                            <div
                                class="alert ${messageType == 'error' ? 'alert-error' : messageType == 'warning' ? 'alert-warning' : 'alert-success'}">
                                ${message}
                            </div>
                        </c:if>

                        <div class="alert alert-info">
                            Informe o valor que deseja sacar
                        </div>

                        <form action="withdraw" method="POST">
                            <div class="form-group">
                                <label>Valores Rápidos</label>
                                <div class="quick-amounts">
                                    <button type="button" class="quick-amount-btn" onclick="setAmount(50)">R$
                                        50,00</button>
                                    <button type="button" class="quick-amount-btn" onclick="setAmount(100)">R$
                                        100,00</button>
                                    <button type="button" class="quick-amount-btn" onclick="setAmount(200)">R$
                                        200,00</button>
                                    <button type="button" class="quick-amount-btn" onclick="setAmount(500)">R$
                                        500,00</button>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="amount">Valor do Saque</label>
                                <div class="input-with-currency">
                                    <span class="currency-symbol">R$</span>
                                    <input type="number" id="amount" name="amount" class="form-control" min="10"
                                        max="1000" step="0.01" required placeholder="0,00" value="${param.amount}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="description">Descrição (opcional)</label>
                                <input type="text" id="description" name="description" class="form-control"
                                    placeholder="Ex: Saque para pagamentos" value="${param.description}">
                            </div>

                            <div class="form-group">
                                <button type="button" class="btn-secondary" onclick="history.back()">Cancelar</button>
                                <button type="submit" class="btn-primary">Confirmar Saque</button>
                            </div>
                        </form>
                    </div>
            </div>

            <script>
                function setAmount(value) {
                    document.getElementById('amount').value = value;

                    // Remove seleção anterior
                    document.querySelectorAll('.quick-amount-btn').forEach(btn => {
                        btn.classList.remove('selected');
                    });

                    // Adiciona seleção ao botão clicado
                    event.target.classList.add('selected');
                }
            </script>
        </body>

        </html>