```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Appointments - ClinicManager</title>

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
            color: #222;
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            width: 250px;
            background-color: white;
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
            gap: 15px;
            margin-bottom: 30px;
        }

        .topbar h1 {
            color: #222;
            font-size: 25px;
        }

        .patient-info {
            text-align: right;
        }

        .patient-info .name {
            font-weight: bold;
            color: #333;
        }

        .patient-info .role {
            font-size: 13px;
            color: #00843D;
            margin-top: 5px;
        }

        /* ================= CONTENT ================= */

        .content-card {
            background-color: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .content-card h2 {
            color: #222;
            margin-bottom: 20px;
            font-size: 21px;
        }

        .description {
            color: #777;
            font-size: 14px;
            margin-top: -10px;
            margin-bottom: 20px;
            line-height: 1.5;
        }

        /* ================= FORM ================= */

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 18px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            margin-bottom: 7px;
            font-size: 14px;
            font-weight: bold;
            color: #444;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 11px 12px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            outline: none;
            background-color: white;
            font-size: 14px;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #00843D;
        }

        .form-group textarea {
            min-height: 100px;
            resize: vertical;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        /* ================= BUTTONS ================= */

        .btn {
            border: none;
            padding: 11px 18px;
            border-radius: 7px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary {
            background-color: #00843D;
            color: white;
        }

        .btn-primary:hover {
            background-color: #006d32;
        }

        /* ================= ERROR MESSAGE ================= */

        .error-message {
            background-color: #fff0f0;
            border: 1px solid #fecaca;
            color: #b91c1c;
            padding: 12px 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        /* ================= TABLE ================= */

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            text-align: left;
            padding: 14px;
            background-color: #f8fafc;
            color: #555;
            font-size: 13px;
            border-bottom: 1px solid #e5e7eb;
            white-space: nowrap;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #e5e7eb;
            vertical-align: middle;
            font-size: 14px;
        }

        tbody tr:hover {
            background-color: #fafafa;
        }

        .empty-message {
            text-align: center;
            color: #777;
            padding: 30px;
        }

        .status {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .status-planned {
            background-color: #eaf7ef;
            color: #00843D;
        }

        .status-done {
            background-color: #dbeafe;
            color: #1d4ed8;
        }

        .status-canceled {
            background-color: #fee2e2;
            color: #b91c1c;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 1000px) {
            .sidebar {
                width: 210px;
            }

            .main {
                margin-left: 210px;
                width: calc(100% - 210px);
                padding: 20px;
            }
        }

        @media (max-width: 700px) {
            .sidebar {
                position: relative;
                width: 100%;
                min-height: auto;
                padding: 20px 15px;
            }

            .logo {
                margin-bottom: 20px;
            }

            .logout {
                position: static;
                margin-top: 20px;
            }

            .main {
                margin-left: 0;
                width: 100%;
                padding: 15px;
            }

            .topbar {
                flex-direction: column;
                align-items: flex-start;
            }

            .patient-info {
                text-align: left;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto;
            }

            .content-card {
                padding: 18px;
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

        <a href="${pageContext.request.contextPath}/patient/dashboard">
            Dashboard
        </a>

    </div>

    <div class="menu-title">
        My Management
    </div>

    <div class="menu">

        <a href="${pageContext.request.contextPath}/patient/appointments"
           class="active">
            My Appointments
        </a>

        <a href="${pageContext.request.contextPath}/patient/profile">
            My Profile
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

        <h1>My Appointments</h1>

        <div class="patient-info">

            <div class="name">
                <c:out value="${patient.firstName}"/>
                <c:out value="${patient.lastName}"/>
            </div>

            <div class="role">
                Patient
            </div>

        </div>

    </div>


    <!-- ================= CREATE APPOINTMENT ================= -->

    <div class="content-card">

        <h2>Book an Appointment</h2>

        <p class="description">
            Select a doctor, choose a date and time,
            and provide the reason for your appointment.
        </p>

        <c:if test="${not empty error}">
            <div class="error-message">
                <c:out value="${error}"/>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/patient/appointments"
              method="post">

            <input type="hidden"
                   name="action"
                   value="create">

            <div class="form-grid">

                <!-- DOCTOR -->

                <div class="form-group">

                    <label for="doctorId">
                        Choose Doctor
                    </label>

                    <select id="doctorId"
                            name="doctorId"
                            required>

                        <option value="">
                            Select a doctor
                        </option>

                        <c:forEach var="doctor" items="${doctors}">

                            <option value="${doctor.id}">

                                <c:out value="${doctor.title}"/>
                                <c:out value="${doctor.firstName}"/>
                                <c:out value="${doctor.lastName}"/>

                            </option>

                        </c:forEach>

                    </select>

                </div>


                <!-- DATE -->

                <div class="form-group">

                    <label for="appointmentDate">
                        Appointment Date
                    </label>

                    <input type="date"
                           id="appointmentDate"
                           name="appointmentDate"
                           required>

                </div>


                <!-- TIME -->

                <div class="form-group">

                    <label for="startTime">
                        Appointment Time
                    </label>

                    <select id="startTime"
                            name="startTime"
                            required>

                        <option value="">
                            Select a time
                        </option>

                        <option value="08:00">08:00</option>
                        <option value="08:30">08:30</option>
                        <option value="09:00">09:00</option>
                        <option value="09:30">09:30</option>
                        <option value="10:00">10:00</option>
                        <option value="10:30">10:30</option>
                        <option value="11:00">11:00</option>
                        <option value="11:30">11:30</option>
                        <option value="12:00">12:00</option>
                        <option value="12:30">12:30</option>
                        <option value="13:00">13:00</option>
                        <option value="13:30">13:30</option>
                        <option value="14:00">14:00</option>
                        <option value="14:30">14:30</option>
                        <option value="15:00">15:00</option>
                        <option value="15:30">15:30</option>
                        <option value="16:00">16:00</option>
                        <option value="16:30">16:30</option>
                        <option value="17:00">17:00</option>
                        <option value="17:30">17:30</option>

                    </select>

                </div>


                <!-- APPOINTMENT TYPE -->

                <div class="form-group">

                    <label for="type">
                        Appointment Type
                    </label>

                    <select id="type"
                            name="type"
                            required>

                        <option value="">
                            Select an appointment type
                        </option>

                        <option value="CONSULTATION">
                            Consultation
                        </option>

                        <option value="FOLLOW_UP">
                            Follow-up
                        </option>

                        <option value="URGENT">
                            Urgent
                        </option>

                    </select>

                </div>


                <!-- REASON -->

                <div class="form-group full-width">

                    <label for="reason">
                        Reason for Appointment
                    </label>

                    <textarea id="reason"
                              name="reason"
                              maxlength="2000"
                              placeholder="Describe the reason for your appointment"></textarea>

                </div>


                <!-- SUBMIT -->

                <div class="full-width">

                    <button type="submit"
                            class="btn btn-primary">
                        Book Appointment
                    </button>

                </div>

            </div>

        </form>

    </div>


    <!-- ================= APPOINTMENT HISTORY ================= -->

    <div class="content-card">

        <h2>My Appointment History</h2>

        <div class="table-container">

            <c:choose>

                <c:when test="${not empty appointments}">

                    <table>

                        <thead>

                        <tr>
                            <th>Doctor</th>
                            <th>Date</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                            <th>Type</th>
                            <th>Reason</th>
                            <th>Status</th>
                        </tr>

                        </thead>

                        <tbody>

                        <c:forEach var="appointment"
                                   items="${appointments}">

                            <tr>

                                <td>
                                    <c:out value="${appointment.doctorName}"/>
                                </td>

                                <td>
                                    <c:out value="${appointment.appointmentDate}"/>
                                </td>

                                <td>
                                    <c:out value="${appointment.startTime}"/>
                                </td>

                                <td>
                                    <c:out value="${appointment.endTime}"/>
                                </td>

                                <td>
                                    <c:out value="${appointment.type}"/>
                                </td>

                                <td>
                                    <c:out value="${appointment.reason}"/>
                                </td>

                                <td>

                                    <c:choose>

                                        <c:when test="${appointment.status == 'PLANNED'}">
                                            <span class="status status-planned">
                                                Planned
                                            </span>
                                        </c:when>

                                        <c:when test="${appointment.status == 'DONE'}">
                                            <span class="status status-done">
                                                Done
                                            </span>
                                        </c:when>

                                        <c:when test="${appointment.status == 'CANCELED'}">
                                            <span class="status status-canceled">
                                                Canceled
                                            </span>
                                        </c:when>

                                        <c:otherwise>
                                            <c:out value="${appointment.status}"/>
                                        </c:otherwise>

                                    </c:choose>

                                </td>

                            </tr>

                        </c:forEach>

                        </tbody>

                    </table>

                </c:when>

                <c:otherwise>

                    <div class="empty-message">
                        You don't have any appointments yet.
                    </div>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</div>


<!-- ================= JAVASCRIPT ================= -->

<script>
   
    const appointmentDateInput =
        document.getElementById("appointmentDate");

    const today = new Date();

    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, "0");
    const day = String(today.getDate()).padStart(2, "0");

    appointmentDateInput.min = year + "-" + month + "-" + day;
</script>

</body>
</html>
```