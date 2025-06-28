<%@ page contentType="text/html" pageEncoding="UTF-8"
    import="com.mycompany.webapplication.entity.Account,com.mycompany.webapplication.entity.Users,com.mycompany.webapplication.entity.Investment,java.util.ArrayList"
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="pt-BR">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Investimentos - Banco Digital</title>
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
                    background: linear-gradient(135deg, #10b981 0%, #3b82f6 100%);
                    color: white;
                    padding: 20px;
                    border-radius: 10px;
                    margin-bottom: 30px;
                    box-shadow: 0 4px 15px rgba(16, 185, 129, 0.2);
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
                    border-color: #10b981;
                    box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.2);
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
                    background-color: #10b981;
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
                    background-color: #059669;
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
                    background-color: rgba(16, 185, 129, 0.1);
                    border: 1px solid #10b981;
                    color: #10b981;
                }

                .alert-error {
                    background-color: rgba(231, 76, 60, 0.1);
                    border: 1px solid #e74c3c;
                    color: #e74c3c;
                }

                .investments-table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 20px;
                    background-color: #232323;
                    border-radius: 8px;
                    overflow: hidden;
                }

                .investments-table th,
                .investments-table td {
                    padding: 12px 10px;
                    text-align: left;
                }

                .investments-table th {
                    background-color: #2563eb;
                    color: #ffffff;
                    font-size: 15px;
                    font-weight: 600;
                }

                .investments-table tr:nth-child(even) {
                    background-color: #181c22;
                }

                .investments-table tr:nth-child(odd) {
                    background-color: #232323;
                }

                .investments-table td {
                    color: #e0e0e0;
                    font-size: 15px;
                }

                .badge {
                    display: inline-block;
                    padding: 2px 10px;
                    border-radius: 8px;
                    font-size: 13px;
                    font-weight: 600;
                    margin-right: 4px;
                }

                .badge.cdb {
                    background: #3b82f6;
                    color: #fff;
                }

                .badge.tesouro {
                    background: #f59e0b;
                    color: #fff;
                }

                .badge.poupanca {
                    background: #10b981;
                    color: #fff;
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

                    .investments-table th,
                    .investments-table td {
                        font-size: 13px;
                        padding: 8px 4px;
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
                        <span>Investimento</span>
                    </div>
                    <div class="balance-card">
                        <div class="balance-title">Seu Saldo Disponível</div>
                        <div class="balance-amount">R$ ${conta.balance}</div>
                        <div class="balance-subtitle">Para investir</div>
                    </div>
                    <div class="section">
                        <h2>Novo Investimento</h2>
                        <c:if test="${not empty message}">
                            <div class="alert ${messageType == 'error' ? 'alert-error' : 'alert-success'}">
                                ${message}
                            </div>
                        </c:if>
                        <div class="alert alert-info">
                            Escolha o produto de investimento e informe o valor
                        </div>
                        <form action="investment" method="POST">
                            <div class="form-group">
                                <label for="product">Produto de Investimento</label>
                                <select id="product" name="product" class="form-control" required>
                                    <option value="">Selecione um produto</option>
                                    <option value="CDB" ${param.product=='CDB' ? 'selected' : '' }>CDB</option>
                                    <option value="TESOURO" ${param.product=='TESOURO' ? 'selected' : '' }>Tesouro
                                        Direto
                                    </option>
                                    <option value="POUPANÇA" ${param.product=='POUPANÇA' ? 'selected' : '' }>Poupança
                                    </option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="amount">Valor do Investimento</label>
                                <div class="input-with-currency">
                                    <span class="currency-symbol">R$</span>
                                    <input type="number" id="amount" name="amount" class="form-control" min="1"
                                        step="0.01" required placeholder="0,00" value="${param.amount}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="description">Descrição (opcional)</label>
                                <input type="text" id="description" name="description" class="form-control"
                                    placeholder="Ex: Investimento em CDB" value="${param.description}">
                            </div>
                            <button type="submit" class="btn-primary">Confirmar Investimento</button>
                        </form>
                    </div>
                    <div class="section">
                        <h2>Seus Investimentos</h2>
                        <table class="investments-table">
                            <thead>
                                <tr>
                                    <th>Produto</th>
                                    <th>Valor</th>
                                    <th>Data Inicial</th>
                                    <th>Data Final</th>
                                    <th>Descrição</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty investimentos}">
                                        <c:forEach var="inv" items="${investimentos}">
                                            <tr>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${inv.investmentProduct.typeInvestment == 'CDB'}">
                                                            <span class="badge cdb">CDB</span>
                                                        </c:when>
                                                        <c:when
                                                            test="${inv.investmentProduct.typeInvestment == 'TESOURO'}">
                                                            <span class="badge tesouro">Tesouro</span>
                                                        </c:when>
                                                        <c:when
                                                            test="${inv.investmentProduct.typeInvestment == 'POUPANÇA'}">
                                                            <span class="badge poupanca">Poupança</span>
                                                        </c:when>
                                                        <c:otherwise><span class="badge">Outro</span></c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>R$ ${inv.amount}</td>
                                                <td>${inv.startDate}</td>
                                                <td>${inv.endDate}</td>
                                                <td>${inv.description}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="5" style="text-align:center; color:#bbbbbb;">Nenhum
                                                investimento
                                                encontrado.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
            </div>
        </body>

        </html>