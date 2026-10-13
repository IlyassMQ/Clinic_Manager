<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Registration</title>
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
            max-width: 520px;
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

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 16px;
        }

        .form-group.full {
            grid-column: 1 / -1;
        }

        label {
            font-size: 13px;
            font-weight: 500;
            color: #4a5568;
            margin-bottom: 6px;
        }

        input,
        select {
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

        input:focus,
        select:focus {
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

        @media (max-width: 520px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            .card {
                padding: 28px 20px;
            }
        }
    </style>
</head>

<body>

<div class="card">
    <h1>Create Patient Account</h1>
    <p class="subtitle">Fill in your details to get started</p>

    <form action="${pageContext.request.contextPath}/register" method="post">

        <div class="form-grid">

            <div class="form-group">
                <label for="firstName">First Name</label>
                <input
                        type="text"
                        id="firstName"
                        name="firstName"
                        placeholder="John"
                        required
                >
            </div>

            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input
                        type="text"
                        id="lastName"
                        name="lastName"
                        placeholder="Doe"
                        required
                >
            </div>

            <div class="form-group full">
                <label for="email">Email</label>
                <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="you@example.com"
                        required
                >
            </div>

            <div class="form-group">
                <label for="phone">Phone</label>
                <input
                        type="tel"
                        id="phone"
                        name="phone"
                        placeholder="+212 555 000 0000"
                        required
                >
            </div>

            <div class="form-group">
                <label for="cin">CIN</label>
                <input
                        type="text"
                        id="cin"
                        name="cin"
                        placeholder="AB123456"
                        required
                >
            </div>

            <div class="form-group full">
                <label for="password">Password</label>
                <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="At least 6 characters"
                        minlength="6"
                        required
                >
            </div>

            <div class="form-group">
                <label for="birthDate">Birth Date</label>
                <input
                        type="date"
                        id="birthDate"
                        name="birthDate"
                        required
                >
            </div>

            <div class="form-group">
                <label for="gender">Gender</label>
                <select
                        id="gender"
                        name="gender"
                        required
                >
                    <option value="">Select gender</option>
                    <option value="MALE">Male</option>
                    <option value="FEMALE">Female</option>
                </select>
            </div>

            <div class="form-group full">
                <label for="address">Address</label>
                <input
                        type="text"
                        id="address"
                        name="address"
                        placeholder="123 Main St, City"
                        required
                >
            </div>
        <p style="color: red;">
                            <%= request.getAttribute("error") %>
                        </p>
        </div>

        <button type="submit">Register</button>

    </form>

    <p class="footer-text">
        Already have an account?
        <a href="${pageContext.request.contextPath}/login">
            Login
        </a>
    </p>
</div>

</body>
</html>