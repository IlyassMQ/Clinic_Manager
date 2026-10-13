<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - ClinicManager</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f5f7fa;
            display: flex;
            min-height: 100vh;
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            width: 250px;
            background-color: #ffffff;
            border-right: 1px solid #e5e7eb;
            min-height: 100vh;
            padding: 25px 15px;
            position: fixed;
            left: 0;
            top: 0;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #00843D;
            text-align: center;
            margin-bottom: 35px;
        }

        .menu-title {
            font-size: 12px;
            color: #888;
            text-transform: uppercase;
            margin: 20px 10px 10px;
        }

        .menu a {
            display: block;
            text-decoration: none;
            color: #333;
            padding: 12px 15px;
            margin-bottom: 5px;
            border-radius: 8px;
            transition: 0.2s;
        }

        .menu a:hover {
            background-color: #eaf7ef;
            color: #00843D;
        }

        .menu a.active {
            background-color: #00843D;
            color: white;
        }

        .logout {
            position: absolute;
            bottom: 25px;
            left: 15px;
            right: 15px;
        }

        .logout a {
            display: block;
            text-decoration: none;
            text-align: center;
            color: #d32f2f;
            padding: 12px;
            border-radius: 8px;
            background-color: #fff0f0;
        }

        .logout a:hover {
            background-color: #ffe0e0;
        }

        /* ================= MAIN ================= */

        .main {
            margin-left: 250px;
            width: calc(100% - 250px);
            padding: 30px;
        }

        .topbar {
            background-color: white;
            padding: 20px 25px;
            border-radius: 12px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .topbar h1 {
            color: #222;
            font-size: 25px;
        }

        .admin-info {
            text-align: right;
        }

        .admin-info .name {
            font-weight: bold;
            color: #333;
        }

        .admin-info .role {
            font-size: 13px;
            color: #00843D;
        }

        /* ================= WELCOME ================= */

        .welcome {
            background-color: #00843D;
            color: white;
            padding: 30px;
            border-radius: 14px;
            margin-bottom: 30px;
        }

        .welcome h2 {
            margin-bottom: 10px;
        }

        .welcome p {
            opacity: 0.9;
        }

        /* ================= CARDS ================= */

        .cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background-color: white;
            padding: 25px;
            border-radius: 12px;
            border: 1px solid #e5e7eb;
        }

        .card h3 {
            font-size: 16px;
            color: #555;
            margin-bottom: 10px;
        }

        .card .number {
            font-size: 30px;
            font-weight: bold;
            color: #00843D;
        }

        /* ================= MANAGEMENT ================= */

        .section {
            background-color: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .section h2 {
            margin-bottom: 20px;
        }

        .management-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .management-card {
            border: 1px solid #e5e7eb;
            padding: 20px;
            border-radius: 10px;
        }

        .management-card h3 {
            margin-bottom: 8px;
        }

        .management-card p {
            color: #777;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .management-card a {
            display: inline-block;
            text-decoration: none;
            background-color: #00843D;
            color: white;
            padding: 9px 15px;
            border-radius: 7px;
            font-size: 14px;
        }

        .management-card a:hover {
            background-color: #006d32;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 1000px) {

            .cards {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 700px) {

            .sidebar {
                width: 200px;
            }

            .main {
                margin-left: 200px;
                width: calc(100% - 200px);
            }

            .cards {
                grid-template-columns: 1fr;
            }

            .management-grid {
                grid-template-columns: 1fr;
            }

        }

    </style>
</head>

<body>

<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <div class="logo">
        ClinicManager
    </div>

    <div class="menu-title">
        Main
    </div>

    <div class="menu">

        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="active">
            Dashboard
        </a>

    </div>

    <div class="menu-title">
        Management
    </div>

    <div class="menu">

        <a href="${pageContext.request.contextPath}/admin/departments">
            Departments
        </a>

        <a href="${pageContext.request.contextPath}/admin/speciality">
            Specialties
        </a>

        <a href="${pageContext.request.contextPath}/admin/doctor">
            Doctors
        </a>

        <a href="${pageContext.request.contextPath}/admin/staff">
            Staff
        </a>

        <a href="${pageContext.request.contextPath}/admin/patients">
            Patients
        </a>

    </div>

    <div class="logout">

        <a href="${pageContext.request.contextPath}/logout">
            Logout
        </a>

    </div>

</div>


<!-- ================= MAIN CONTENT ================= -->

<div class="main">

    <!-- TOP BAR -->

    <div class="topbar">

        <h1>Admin Dashboard</h1>

        <div class="admin-info">

            <div class="name">
                ${admin.firstName} ${admin.lastName}
            </div>

            <div class="role">
                Administrator
            </div>

        </div>

    </div>


    <!-- WELCOME -->

    <div class="welcome">

        <h2>
            Welcome, ${admin.firstName}!
        </h2>

        <p>
            Manage your clinic, doctors, staff, patients,
            departments and specialties from this dashboard.
        </p>

    </div>


    <!-- STATISTICS -->

    <div class="cards">

        <div class="card">

            <h3>Doctors</h3>

            <div class="number">
                0
            </div>

        </div>

        <div class="card">

            <h3>Patients</h3>

            <div class="number">
                0
            </div>

        </div>

        <div class="card">

            <h3>Departments</h3>

            <div class="number">
                0
            </div>

        </div>

        <div class="card">

            <h3>Specialties</h3>

            <div class="number">
                0
            </div>

        </div>

    </div>


    <!-- MANAGEMENT -->

    <div class="section">

        <h2>Clinic Management</h2>

        <div class="management-grid">

            <!-- Departments -->

            <div class="management-card">

                <h3>Departments</h3>

                <p>
                    Create, update and delete clinic departments.
                </p>

                <a href="${pageContext.request.contextPath}/admin/departments">
                    Manage Departments
                </a>

            </div>


            <!-- Specialties -->

            <div class="management-card">

                <h3>Specialties</h3>

                <p>
                    Manage medical specialties and their departments.
                </p>

                <a href="${pageContext.request.contextPath}/admin/speciality">
                    Manage Specialties
                </a>

            </div>


            <!-- Doctors -->

            <div class="management-card">

                <h3>Doctors</h3>

                <p>
                    Create and manage doctor accounts and information.
                </p>

                <a href="${pageContext.request.contextPath}/admin/doctor">
                    Manage Doctors
                </a>

            </div>


            <!-- Staff -->

            <div class="management-card">

                <h3>Staff</h3>

                <p>
                    Manage clinic staff accounts.
                </p>

                <a href="${pageContext.request.contextPath}/admin/staff">
                    Manage Staff
                </a>

            </div>


            <!-- Patients -->

            <div class="management-card">

                <h3>Patients</h3>

                <p>
                    View and manage registered patients.
                </p>

                <a href="${pageContext.request.contextPath}/admin/patients">
                    Manage Patients
                </a>

            </div>

        </div>

    </div>

</div>

</body>
</html>

