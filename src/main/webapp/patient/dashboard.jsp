<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Patient Dashboard - ClinicManager</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI",
                         Roboto, Oxygen, Ubuntu, sans-serif;

            background: #f4f7fb;
            color: #1f2937;
            min-height: 100vh;
        }

        /* =========================
           SIDEBAR
           ========================= */

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;

            width: 240px;
            height: 100vh;

            background: #ffffff;
            border-right: 1px solid #e5e7eb;

            padding: 24px 16px;

            display: flex;
            flex-direction: column;
        }

        .logo {
            font-size: 22px;
            font-weight: 700;
            color: #4f46e5;

            padding: 0 12px;
            margin-bottom: 35px;
        }

        .logo span {
            color: #111827;
        }

        .menu {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .menu a {
            text-decoration: none;
            color: #6b7280;

            padding: 12px 14px;

            border-radius: 8px;

            font-size: 14px;
            font-weight: 500;

            transition: 0.2s;
        }

        .menu a:hover {
            background: #f3f4ff;
            color: #4f46e5;
        }

        .menu a.active {
            background: #eef2ff;
            color: #4f46e5;
            font-weight: 600;
        }

        .sidebar-bottom {
            margin-top: auto;
        }

        .logout {
            display: block;

            text-decoration: none;

            color: #dc2626;

            padding: 12px 14px;

            border-radius: 8px;

            font-size: 14px;
            font-weight: 500;
        }

        .logout:hover {
            background: #fef2f2;
        }

        /* =========================
           MAIN CONTENT
           ========================= */

        .main {
            margin-left: 240px;

            min-height: 100vh;

            padding: 32px 40px;
        }

        /* =========================
           HEADER
           ========================= */

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;

            margin-bottom: 32px;
        }

        .header h1 {
            font-size: 28px;
            color: #111827;
            margin-bottom: 6px;
        }

        .header p {
            color: #6b7280;
            font-size: 14px;
        }

        .profile {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .avatar {
            width: 42px;
            height: 42px;

            border-radius: 50%;

            background: #eef2ff;
            color: #4f46e5;

            display: flex;
            align-items: center;
            justify-content: center;

            font-weight: 700;
        }

        .profile-info {
            text-align: right;
        }

        .profile-info strong {
            display: block;
            font-size: 14px;
            color: #111827;
        }

        .profile-info span {
            font-size: 12px;
            color: #6b7280;
        }

        /* =========================
           QUICK ACTIONS
           ========================= */

        .section-title {
            font-size: 18px;
            font-weight: 600;

            margin-bottom: 16px;

            color: #111827;
        }

        .cards {
            display: grid;

            grid-template-columns:
                repeat(4, minmax(0, 1fr));

            gap: 18px;

            margin-bottom: 35px;
        }

        .card {
            background: #ffffff;

            border: 1px solid #e5e7eb;

            border-radius: 12px;

            padding: 22px;

            text-decoration: none;

            transition: 0.2s;

            display: block;
        }

        .card:hover {
            transform: translateY(-2px);

            box-shadow:
                0 8px 20px rgba(0, 0, 0, 0.06);
        }


        .card h3 {
            font-size: 15px;

            color: #111827;

            margin-bottom: 6px;
        }

        .card p {
            font-size: 13px;

            color: #6b7280;

            line-height: 1.5;
        }

        /* =========================
           APPOINTMENT SECTION
           ========================= */

        .content-grid {
            display: grid;

            grid-template-columns: 2fr 1fr;

            gap: 20px;
        }

        .panel {
            background: #ffffff;

            border: 1px solid #e5e7eb;

            border-radius: 12px;

            padding: 24px;
        }

        .panel-header {
            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 20px;
        }

        .panel-header h2 {
            font-size: 17px;

            color: #111827;
        }

        .panel-header a {
            font-size: 13px;

            color: #4f46e5;

            text-decoration: none;

            font-weight: 500;
        }

        /* =========================
           APPOINTMENT
           ========================= */

        .appointment {
            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 16px;

            background: #f9fafb;

            border-radius: 10px;

            margin-bottom: 10px;
        }

        .appointment:last-child {
            margin-bottom: 0;
        }

        .appointment-info {
            display: flex;

            align-items: center;

            gap: 14px;
        }


        .appointment-info strong {
            display: block;

            font-size: 14px;

            color: #111827;

            margin-bottom: 4px;
        }

        .appointment-info span {
            font-size: 12px;

            color: #6b7280;
        }

        .status {
            font-size: 11px;

            font-weight: 600;

            padding: 5px 9px;

            border-radius: 20px;

            background: #dcfce7;

            color: #166534;
        }

        /* =========================
           PROFILE PANEL
           ========================= */

        .profile-row {
            display: flex;

            justify-content: space-between;

            padding: 13px 0;

            border-bottom: 1px solid #f1f5f9;
        }

        .profile-row:last-child {
            border-bottom: none;
        }

        .profile-row span:first-child {
            color: #6b7280;

            font-size: 13px;
        }

        .profile-row span:last-child {
            color: #111827;

            font-size: 13px;

            font-weight: 500;
        }

        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 1000px) {

            .cards {
                grid-template-columns:
                    repeat(2, minmax(0, 1fr));
            }

            .content-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 700px) {

            .sidebar {
                position: static;

                width: 100%;

                height: auto;

                border-right: none;

                border-bottom: 1px solid #e5e7eb;
            }

            .main {
                margin-left: 0;

                padding: 24px 18px;
            }

            .header {
                align-items: flex-start;
            }

            .profile {
                display: none;
            }

            .cards {
                grid-template-columns: 1fr;
            }
        }

    </style>
</head>

<body>

<!-- =========================
     SIDEBAR
     ========================= -->

<aside class="sidebar">

    <div class="logo">
        Clinic<span>Manager</span>
    </div>

    <nav class="menu">

        <a href="${pageContext.request.contextPath}/patient/dashboard"
           class="active">
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/patient/profile">
            My Profile
        </a>

        <a href="${pageContext.request.contextPath}/patient/appointments">
            My Appointments
        </a>

        <a href="${pageContext.request.contextPath}/patient/history">
            Medical History
        </a>

        <a href="${pageContext.request.contextPath}/patient/book">
            Book Appointment
        </a>

    </nav>

    <div class="sidebar-bottom">

        <a class="logout"
           href="${pageContext.request.contextPath}/logout">
            Logout
        </a>

    </div>

</aside>


<!-- =========================
     MAIN
     ========================= -->

<main class="main">

    <!-- HEADER -->

    <header class="header">

        <div>

            <h1>Welcome back!</h1>

            <p>
                Manage your appointments and medical information.
            </p>

        </div>

        <div class="profile">

            <div class="profile-info">

                <strong>Patient</strong>

                <span>${user.firstName} Account</span>

            </div>

            <div class="avatar">
                P
            </div>

        </div>

    </header>


    <!-- QUICK ACTIONS -->

    <h2 class="section-title">
        Quick Actions
    </h2>

    <div class="cards">

        <a class="card"
           href="${pageContext.request.contextPath}/patient/book">



            <h3>Book Appointment</h3>

            <p>
                Find a doctor and schedule your next appointment.
            </p>

        </a>


        <a class="card"
           href="${pageContext.request.contextPath}/patient/appointments">

            <h3>My Appointments</h3>

            <p>
                View and manage your upcoming appointments.
            </p>

        </a>


        <a class="card"
           href="${pageContext.request.contextPath}/patient/history">



            <h3>Medical History</h3>

            <p>
                View your previous appointments and medical notes.
            </p>

        </a>


        <a class="card"
           href="${pageContext.request.contextPath}/patient/profile">



            <h3>My Profile</h3>

            <p>
                View and update your personal information.
            </p>

        </a>

    </div>


    <!-- CONTENT -->

    <div class="content-grid">


        <!-- UPCOMING APPOINTMENTS -->

        <section class="panel">

            <div class="panel-header">

                <h2>Upcoming Appointment</h2>

                <a href="${pageContext.request.contextPath}/patient/appointments">
                    View all
                </a>

            </div>


            <!--
                This is currently static.
                Later the Servlet will send the real
                appointment from the database.
            -->

            <div class="appointment">

                <div class="appointment-info">



                    <div>

                        <strong>
                            No upcoming appointment
                        </strong>

                        <span>
                            You don't have any planned appointments.
                        </span>

                    </div>

                </div>

            </div>

        </section>


        <!-- PROFILE -->

        <section class="panel">

            <div class="panel-header">

                <h2>My Information</h2>

                <a href="${pageContext.request.contextPath}/patient/profile">
                    Edit
                </a>

            </div>


            <div class="profile-row">

                <span>Name</span>

                <span>Patient</span>

            </div>


            <div class="profile-row">

                <span>Email</span>

                <span>---</span>

            </div>


            <div class="profile-row">

                <span>Phone</span>

                <span>---</span>

            </div>


        </section>

    </div>

</main>

</body>

</html>

