<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Doctor Dashboard - ClinicManager</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f5f7fa;
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
            min-height: 100vh;
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

        .doctor-info {
            text-align: right;
        }

        .doctor-info .name {
            font-weight: bold;
            color: #333;
        }

        .doctor-info .role {
            font-size: 13px;
            color: #00843D;
            margin-top: 4px;
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

        /* ================= STATISTICS ================= */

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
            font-size: 15px;
            color: #555;
            margin-bottom: 10px;
        }

        .card .number {
            font-size: 30px;
            font-weight: bold;
            color: #00843D;
        }

        /* ================= CONTENT ================= */

        .content-section {
            background-color: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .content-section h2 {
            margin-bottom: 20px;
            color: #222;
        }

        /* ================= QUICK ACTIONS ================= */

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .action-card {
            border: 1px solid #e5e7eb;
            padding: 20px;
            border-radius: 10px;
        }

        .action-card h3 {
            margin-bottom: 8px;
            color: #333;
        }

        .action-card p {
            color: #777;
            font-size: 14px;
            margin-bottom: 15px;
        }

        .action-card a {
            display: inline-block;
            text-decoration: none;
            background-color: #00843D;
            color: white;
            padding: 9px 15px;
            border-radius: 7px;
            font-size: 14px;
        }

        .action-card a:hover {
            background-color: #006d32;
        }

        /* ================= PROFILE ================= */

        .profile-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .profile-item {
            background-color: #f8fafc;
            padding: 15px;
            border-radius: 8px;
        }

        .profile-item .label {
            font-size: 12px;
            color: #777;
            margin-bottom: 5px;
        }

        .profile-item .value {
            font-weight: bold;
            color: #333;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 1000px) {

            .cards {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 800px) {

            .sidebar {
                width: 200px;
            }

            .main {
                margin-left: 200px;
            }

            .topbar {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .doctor-info {
                text-align: left;
            }

            .cards {
                grid-template-columns: 1fr;
            }

            .quick-actions {
                grid-template-columns: 1fr;
            }

            .profile-grid {
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

        <a href="${pageContext.request.contextPath}/doctor/dashboard"
           class="active">
            Dashboard
        </a>

    </div>

    <div class="menu-title">
        My Management
    </div>

    <div class="menu">

        <a href="${pageContext.request.contextPath}/doctor/profile">
            My Profile
        </a>

        <a href="${pageContext.request.contextPath}/doctor/disponibility">
            My Availability
        </a>
        <a href="${pageContext.request.contextPath}/doctor/absence">
                            My Absences
                        </a>

        <a href="${pageContext.request.contextPath}/doctor/appointments">
            My Appointments
        </a>

        <a href="${pageContext.request.contextPath}/doctor/medical-notes">
            Medical Notes
        </a>

    </div>

    <div class="logout">

        <a href="${pageContext.request.contextPath}/logout">
            Logout
        </a>

    </div>

</div>


<!-- ================= MAIN ================= -->

<div class="main">

    <!-- TOPBAR -->

    <div class="topbar">

        <h1>Doctor Dashboard</h1>

        <div class="doctor-info">

            <div class="name">
                Dr. ${doctor.firstName}
                ${doctor.lastName}
            </div>

            <div class="role">
                Doctor
            </div>

        </div>

    </div>

    <!-- ================= WELCOME ================= -->

    <div class="welcome">

        <h2>
            Welcome, Dr. ${doctor.firstName}!
        </h2>

        <p>
            Manage your availability, appointments and medical notes
            from your dashboard.
        </p>

    </div>


    <!-- ================= STATISTICS ================= -->

    <div class="cards">

        <div class="card">

            <h3>Today's Appointments</h3>

            <div class="number">
                0
            </div>

        </div>


        <div class="card">

            <h3>Upcoming Appointments</h3>

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

            <h3>Medical Notes</h3>

            <div class="number">
                0
            </div>

        </div>

    </div>


    <!-- ================= QUICK ACTIONS ================= -->

    <div class="content-section">

        <h2>Quick Actions</h2>

        <div class="quick-actions">

            <div class="action-card">

                <h3>My Availability</h3>

                <p>
                    Define and manage your working days and hours.
                </p>

                <a href="${pageContext.request.contextPath}/doctor/disponibility">
                    Manage Availability
                </a>

            </div>

           <div class="action-card">

                                       <h3>My Availability</h3>

                                       <p>
                                           Define and manage your working days and hours.
                                       </p>

                                       <a href="${pageContext.request.contextPath}/doctor/absence">
                                           Manage Availability
                                       </a>

                       </div>
            <div class="action-card">

                <h3>My Appointments</h3>

                <p>
                    View your appointments and your daily agenda.
                </p>

                <a href="${pageContext.request.contextPath}/doctor/appointments">
                    View Appointments
                </a>

            </div>


            <div class="action-card">

                <h3>Medical Notes</h3>

                <p>
                    Create and manage medical notes for completed appointments.
                </p>

                <a href="${pageContext.request.contextPath}/doctor/medical-notes">
                    Manage Notes
                </a>

            </div>


            <div class="action-card">

                <h3>My Profile</h3>

                <p>
                    View and update your personal information.
                </p>

                <a href="${pageContext.request.contextPath}/doctor/profile">
                    View Profile
                </a>

            </div>

        </div>

    </div>


    <!-- ================= DOCTOR INFORMATION ================= -->

    <div class="content-section">

        <h2>My Information</h2>

        <div class="profile-grid">

            <div class="profile-item">

                <div class="label">
                    First Name
                </div>

                <div class="value">
                    ${doctor.firstName}
                </div>

            </div>


            <div class="profile-item">

                <div class="label">
                    Last Name
                </div>

                <div class="value">
                    ${doctor.lastName}
                </div>

            </div>


            <div class="profile-item">

                <div class="label">
                    Email
                </div>

                <div class="value">
                    ${doctor.email}
                </div>

            </div>


            <div class="profile-item">

                <div class="label">
                    Phone
                </div>

                <div class="value">
                    ${doctor.phone}
                </div>

            </div>


            <div class="profile-item">

                <div class="label">
                    Matricule
                </div>

                <div class="value">
                    ${doctor.matricule}
                </div>

            </div>


            <div class="profile-item">

                <div class="label">
                    Title
                </div>

                <div class="value">
                    ${doctor.title}
                </div>

            </div>


            <div class="profile-item">

                <div class="label">
                    Speciality
                </div>

                <div class="value">
                    ${doctor.specialty.name}
                </div>

            </div>


            <div class="profile-item">

                <div class="label">
                    Department
                </div>

                <div class="value">
                    ${doctor.department.name}
                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>
