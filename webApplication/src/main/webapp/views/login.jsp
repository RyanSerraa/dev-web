<%@ page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="pt-BR">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Login - Banco Digital</title>
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
          min-height: 100vh;
          display: flex;
          align-items: center;
          justify-content: center;
          padding: 20px;
        }

        .login-container {
          background-color: #1e1e1e;
          padding: 40px;
          border-radius: 15px;
          box-shadow: 0 8px 32px rgba(0, 0, 0, 0.6);
          width: 100%;
          max-width: 400px;
          text-align: center;
        }

        .logo {
          font-size: 32px;
          margin-bottom: 20px;
          color: #3498db;
        }

        .title {
          font-size: 24px;
          color: #ffffff;
          margin-bottom: 30px;
          font-weight: 600;
        }

        .form-group {
          margin-bottom: 20px;
          text-align: left;
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

        .btn-login {
          width: 100%;
          background-color: #3498db;
          color: white;
          border: none;
          padding: 14px 20px;
          font-size: 16px;
          border-radius: 8px;
          cursor: pointer;
          transition: background-color 0.3s;
          font-weight: 600;
          margin-top: 10px;
        }

        .btn-login:hover {
          background-color: #2980b9;
        }

        .error-message {
          background-color: #e74c3c;
          color: white;
          padding: 12px;
          border-radius: 8px;
          margin-bottom: 20px;
          font-size: 14px;
        }

        @media (max-width: 480px) {
          .login-container {
            padding: 30px 20px;
          }

          .title {
            font-size: 20px;
          }
        }
      </style>
    </head>

    <body>
      <div class="login-container">
        <div class="logo">🏦</div>
        <h1 class="title">Banco Digital</h1>
        <% String msgError=(String) request.getAttribute("msgError"); if (msgError !=null) { %>
          <div class="error-message">
            <%= msgError %>
          </div>
          <% } %>
            <form action="${pageContext.request.contextPath}/LoginVerify" method="POST">
              <div class="form-group">
                <label for="email">E-mail</label>
                <input type="email" id="email" name="email" class="form-control" required
                  placeholder="Digite seu e-mail" value="${param.email}">
              </div>
              <div class="form-group">
                <label for="senha">Senha</label>
                <input type="password" id="senha" name="senha" class="form-control" required
                  placeholder="Digite sua senha">
              </div>
              <button type="submit" class="btn-login">Entrar</button>
            </form>
      </div>
    </body>

    </html>