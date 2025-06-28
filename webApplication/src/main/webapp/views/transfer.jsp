<%@ page contentType="text/html" pageEncoding="UTF-8"
    import="com.mycompany.webapplication.entity.Account,com.mycompany.webapplication.entity.Users" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="pt-BR">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Transferência - Banco Digital</title>
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
                    background: linear-gradient(135deg, #9b59b6 0%, #8e44ad 100%);
                    color: white;
                    padding: 20px;
                    border-radius: 10px;
                    margin-bottom: 30px;
                    box-shadow: 0 4px 15px rgba(155, 89, 182, 0.3);
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
                    border-color: #9b59b6;
                    box-shadow: 0 0 0 3px rgba(155, 89, 182, 0.2);
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
                    background-color: #9b59b6;
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
                    background-color: #8e44ad;
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

                .transfer-info {
                    background-color: #2a2a2a;
                    padding: 15px;
                    border-radius: 8px;
                    margin-bottom: 20px;
                    border-left: 4px solid #9b59b6;
                }

                .transfer-info h4 {
                    color: #9b59b6;
                    margin-bottom: 10px;
                    font-size: 14px;
                }

                .transfer-info ul {
                    list-style: none;
                    font-size: 13px;
                    color: #bbbbbb;
                }

                .transfer-info li {
                    margin-bottom: 5px;
                }

                .transfer-info li:before {
                    content: "•";
                    color: #9b59b6;
                    margin-right: 8px;
                }

                .favorite-contacts {
                    background-color: #2a2a2a;
                    padding: 15px;
                    border-radius: 8px;
                    margin-bottom: 20px;
                }

                .favorite-contacts h4 {
                    color: #ffffff;
                    margin-bottom: 15px;
                    font-size: 16px;
                }

                .contacts-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                    gap: 10px;
                }

                .contact-item {
                    background-color: #1e1e1e;
                    padding: 12px;
                    border-radius: 6px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                    border: 2px solid transparent;
                }

                .contact-item:hover {
                    background-color: #333;
                    border-color: #9b59b6;
                }

                .contact-item.selected {
                    border-color: #9b59b6;
                    background-color: rgba(155, 89, 182, 0.1);
                }

                .contact-name {
                    font-weight: 600;
                    color: #ffffff;
                    margin-bottom: 4px;
                }

                .contact-account {
                    font-size: 12px;
                    color: #bbbbbb;
                }

                .form-row {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 20px;
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

                    .form-row {
                        grid-template-columns: 1fr;
                    }

                    .contacts-grid {
                        grid-template-columns: 1fr;
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
                        <span>Transferência</span>
                    </div>

                    <!-- Card de Saldo -->
                    <div class="balance-card">
                        <div class="balance-title">Seu Saldo Disponível</div>
                        <div class="balance-amount">R$ ${conta.balance}</div>
                        <div class="balance-subtitle">Para transferência</div>
                    </div>

                    <!-- Informações de Transferência -->
                    <div class="transfer-info">
                        <h4>💡 Informações da Transferência</h4>
                        <ul>
                            <li>Transferência mínima: R$ 1,00</li>
                            <li>Transferência máxima: R$ 10.000,00</li>
                            <li>Taxa: Gratuita para transferências PIX</li>
                            <li>Prazo: Imediato para PIX, 1 dia útil para TED</li>
                        </ul>
                    </div>

                    <!-- Contatos Favoritos -->
                    <div class="favorite-contacts">
                        <h4>👥 Contatos Favoritos</h4>
                        <div class="contacts-grid">
                            <div class="contact-item" onclick="selectContact('João Silva', '1234567890')">
                                <div class="contact-name">João Silva</div>
                                <div class="contact-account">Conta: 1234567890</div>
                            </div>
                            <div class="contact-item" onclick="selectContact('Maria Santos', '0987654321')">
                                <div class="contact-name">Maria Santos</div>
                                <div class="contact-account">Conta: 0987654321</div>
                            </div>
                            <div class="contact-item" onclick="selectContact('Pedro Costa', '1122334455')">
                                <div class="contact-name">Pedro Costa</div>
                                <div class="contact-account">Conta: 1122334455</div>
                            </div>
                        </div>
                    </div>

                    <!-- Formulário de Transferência -->
                    <div class="section">
                        <h2>Nova Transferência</h2>

                        <c:if test="${not empty message}">
                            <div
                                class="alert ${messageType == 'error' ? 'alert-error' : messageType == 'warning' ? 'alert-warning' : 'alert-success'}">
                                ${message}
                            </div>
                        </c:if>

                        <div class="alert alert-info">
                            Preencha os dados da transferência
                        </div>

                        <form action="transfer" method="POST">
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="accountNumber">Número da Conta Destino</label>
                                    <input type="text" id="accountNumber" name="accountNumber" class="form-control"
                                        required placeholder="Digite o número da conta" value="${param.accountNumber}">
                                </div>

                                <div class="form-group">
                                    <label for="agency">Agência</label>
                                    <input type="text" id="agency" name="agency" class="form-control" required
                                        placeholder="Digite a agência" value="${param.agency}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="beneficiaryName">Nome do Beneficiário</label>
                                <input type="text" id="beneficiaryName" name="beneficiaryName" class="form-control"
                                    required placeholder="Digite o nome completo" value="${param.beneficiaryName}">
                            </div>

                            <div class="form-group">
                                <label for="amount">Valor da Transferência</label>
                                <div class="input-with-currency">
                                    <span class="currency-symbol">R$</span>
                                    <input type="number" id="amount" name="amount" class="form-control" min="1"
                                        max="10000" step="0.01" required placeholder="0,00" value="${param.amount}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="description">Descrição (opcional)</label>
                                <input type="text" id="description" name="description" class="form-control"
                                    placeholder="Ex: Pagamento de serviços" value="${param.description}">
                            </div>

                            <div class="form-group">
                                <button type="button" class="btn-secondary" onclick="history.back()">Cancelar</button>
                                <button type="submit" class="btn-primary">Confirmar Transferência</button>
                            </div>
                        </form>
                    </div>
            </div>

            <script>
                function selectContact(name, account) {
                    // Remove seleção anterior
                    document.querySelectorAll('.contact-item').forEach(item => {
                        item.classList.remove('selected');
                    });

                    // Adiciona seleção ao item clicado
                    event.target.closest('.contact-item').classList.add('selected');

                    // Preenche os campos
                    document.getElementById('beneficiaryName').value = name;
                    document.getElementById('accountNumber').value = account;
                    document.getElementById('agency').value = '0001'; // Agência padrão
                }
            </script>
        </body>

        </html>