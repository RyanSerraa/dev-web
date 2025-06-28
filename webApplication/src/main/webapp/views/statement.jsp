<%@ page contentType="text/html" pageEncoding="UTF-8"
    import="com.mycompany.webapplication.entity.Account,com.mycompany.webapplication.entity.Users,com.mycompany.webapplication.entity.AccountTransactional,java.util.ArrayList"
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="pt-BR">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Extrato - Banco Digital</title>
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
                    background: linear-gradient(135deg, #2563eb 0%, #3b82f6 100%);
                    color: white;
                    padding: 20px;
                    border-radius: 10px;
                    margin-bottom: 30px;
                    box-shadow: 0 4px 15px rgba(37, 99, 235, 0.2);
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

                .transactions-table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 20px;
                    background-color: #232323;
                    border-radius: 8px;
                    overflow: hidden;
                }

                .transactions-table th,
                .transactions-table td {
                    padding: 12px 10px;
                    text-align: left;
                }

                .transactions-table th {
                    background-color: #222b3a;
                    color: #ffffff;
                    font-size: 15px;
                    font-weight: 600;
                }

                .transactions-table tr:nth-child(even) {
                    background-color: #181c22;
                }

                .transactions-table tr:nth-child(odd) {
                    background-color: #232323;
                }

                .transactions-table td {
                    color: #e0e0e0;
                    font-size: 15px;
                }

                .amount-positive {
                    color: #10b981;
                    font-weight: bold;
                }

                .amount-negative {
                    color: #ef4444;
                    font-weight: bold;
                }

                .badge {
                    display: inline-block;
                    padding: 2px 10px;
                    border-radius: 8px;
                    font-size: 13px;
                    font-weight: 600;
                    margin-right: 4px;
                }

                .badge.deposit {
                    background: #10b981;
                    color: #fff;
                }

                .badge.withdraw {
                    background: #ef4444;
                    color: #fff;
                }

                .badge.transfer {
                    background: #f59e0b;
                    color: #fff;
                }

                .badge.invest {
                    background: #3b82f6;
                    color: #fff;
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

                    .transactions-table th,
                    .transactions-table td {
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
                        <span>Extrato</span>
                    </div>
                    <div class="balance-card">
                        <div class="balance-title">Seu Saldo Atual</div>
                        <div class="balance-amount">R$ ${conta.balance}</div>
                        <div class="balance-subtitle">Atualizado agora</div>
                    </div>
                    <div class="section">
                        <h2>Últimas Transações</h2>
                        <div class="alert alert-info">
                            Veja abaixo o histórico das suas movimentações bancárias
                        </div>
                        <table class="transactions-table">
                            <thead>
                                <tr>
                                    <th>Data</th>
                                    <th>Descrição</th>
                                    <th>Tipo</th>
                                    <th>Valor</th>
                                    <th>Saldo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty extrato}">
                                        <c:forEach var="t" items="${extrato}">
                                            <tr>
                                                <td>${t.timestamp}</td>
                                                <td>${t.description}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${t.typeTransaction == 'DEPOSIT'}"><span
                                                                class="badge deposit">Depósito</span></c:when>
                                                        <c:when test="${t.typeTransaction == 'WITHDRAW'}"><span
                                                                class="badge withdraw">Saque</span></c:when>
                                                        <c:when
                                                            test="${t.typeTransaction == 'TRANSFER_IN' || t.typeTransaction == 'TRANSFER_OUT'}">
                                                            <span class="badge transfer">Transferência</span>
                                                        </c:when>
                                                        <c:when test="${t.typeTransaction == 'INVEST'}"><span
                                                                class="badge invest">Investimento</span></c:when>
                                                        <c:otherwise><span class="badge">Outro</span></c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${t.typeTransaction == 'DEPOSIT'}"><span
                                                                class="amount-positive">+ R$ ${t.amount}</span></c:when>
                                                        <c:otherwise><span class="amount-negative">- R$
                                                                ${t.amount}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>R$ ${t.balanceAfter}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="5" style="text-align:center; color:#bbbbbb;">Nenhuma transação
                                                encontrada.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
            </div>
        </body>

        </html>