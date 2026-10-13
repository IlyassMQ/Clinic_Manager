<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>My Profile</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f6fa;
            margin: 0;
            padding: 40px;
        }

        .profile-container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
        }

        h1 {
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input,
        select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }

        button {
            margin-top: 15px;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>

<body>

<div class="profile-container">

    <h1>My Profile</h1>

    <form action="${pageContext.request.contextPath}/patient/profil/update"
          method="post">

        <div class="form-group">
            <label for="firstName">First Name</label>

            <input type="text"
                   id="firstName"
                   name="firstName"
                   value="${patient.firstName}"
                   required>
        </div>


        <div class="form-group">
            <label for="lastName">Last Name</label>

            <input type="text"
                   id="lastName"
                   name="lastName"
                   value="${patient.lastName}"
                   required>
        </div>


        <div class="form-group">
            <label for="email">Email</label>

            <input type="email"
                   id="email"
                   value="${patient.email}"
                   readonly>
        </div>


        <div class="form-group">
            <label for="phone">Phone</label>

            <input type="text"
                   id="phone"
                   name="phone"
                   value="${patient.phone}">
        </div>


        <div class="form-group">
            <label for="cin">CIN</label>

            <input type="text"
                   id="cin"
                   value="${patient.cin}"
                   readonly>
        </div>


        <div class="form-group">
            <label for="birthDate">Birth Date</label>

            <input type="date"
                   id="birthDate"
                   name="birthDate"
                   value="${patient.birthDate}">
        </div>


        <div class="form-group">
            <label for="gender">Gender</label>

            <select id="gender" name="gender">

                <option value="MALE"
                        ${patient.gender == 'MALE' ? 'selected' : ''}>
                    Male
                </option>

                <option value="FEMALE"
                        ${patient.gender == 'FEMALE' ? 'selected' : ''}>
                    Female
                </option>

            </select>
        </div>


        <div class="form-group">
            <label for="address">Address</label>

            <input type="text"
                   id="address"
                   name="address"
                   value="${patient.address}">
        </div>


        <button type="submit">
            Update Profile
        </button>

    </form>

    <br>

    <a href="${pageContext.request.contextPath}/patient/dashboard">
        Back to Dashboard
    </a>

</div>

</body>

</html>