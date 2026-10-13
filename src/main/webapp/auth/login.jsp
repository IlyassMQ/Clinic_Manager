<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
            color: #333;
        }

        .card {
            background: #ffffff;
            width: 100%;
            max-width: 420px;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
        }

        .card h1 {
            font-size: 24px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 8px;
            color: #1a202c;
        }

        .card .subtitle {
            text-align: center;
            color: #718096;
            font-size: 14px;
            margin-bottom: 32px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 16px;
        }

        label {
            font-size: 13px;
            font-weight: 500;
            color: #4a5568;
            margin-bottom: 6px;
        }

        input {
            width: 100%;
            padding: 10px 12px;
            font-size: 14px;
            font-family: inherit;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            background: #f7fafc;
            transition: all 0.2s ease;
            color: #2d3748;
        }

        input:focus {
            outline: none;
            border-color: #667eea;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.15);
        }

        button[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            font-size: 15px;
            font-weight: 600;
            font-family: inherit;
            color: #ffffff;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }

        button[type="submit"]:hover {
            transform: translateY(-1px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.35);
        }

        button[type="submit"]:active {
            transform: translateY(0);
        }

        .error-message {
            background: #fff5f5;
            color: #c53030;
            border: 1px solid #fed7d7;
            border-radius: 8px;
            padding: 10px 12px;
            font-size: 13px;
            margin-bottom: 16px;
            text-align: center;
        }

        .footer-text {
            text-align: center;
            margin-top: 24px;
            font-size: 14px;
            color: #718096;
        }

        .footer-text a {
            color: #667eea;
            font-weight: 600;
            text-decoration: none;
        }

        .footer-text a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .card {
                padding: 28px 20px;
            }
        }
    </style>
</head>

<body>

<div class="card">
    <h1>Welcome Back</h1>
    <p class="subtitle">Sign in to your account</p>

    <form action="${pageContext.request.contextPath}/login" method="post">

        <div class="form-group">
            <label for="email">Email</label>
            <input
                    type="email"
                    id="email"
                    name="email"
                    placeholder="you@example.com"
                    required
            >
            <% if (request.getAttribute("error") != null) { %>
                <p style="color: red;">
                    <%= request.getAttribute("error") %>
                </p>

            <% } %>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter your password"
                    required
            >
            <% if (request.getAttribute("error") != null) { %>

                <p style="color: red;">
                    <%= request.getAttribute("error") %>
                </p>

            <% } %>
        </div>

        <button type="submit">Login</button>

    </form>

    <p class="footer-text">
        Don't have an account?
        <a href="${pageContext.request.contextPath}/register">
            Register
        </a>
    </p>
</div>

</body>
</html>