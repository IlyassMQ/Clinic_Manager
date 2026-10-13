<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Doctors - ClinicManager</title>

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
            margin-top: 4px;
        }

        /* ================= CONTENT ================= */

        .content-card {
            background-color: white;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 25px;
        }

        .content-card h2 {
            margin-bottom: 20px;
            color: #222;
        }

        /* ================= ADD FORM ================= */

        .add-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            margin-bottom: 7px;
            font-weight: bold;
            color: #444;
            font-size: 14px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 11px 12px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            outline: none;
            background-color: white;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #00843D;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        .btn {
            border: none;
            padding: 10px 16px;
            border-radius: 7px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-primary {
            background-color: #00843D;
            color: white;
        }

        .btn-primary:hover {
            background-color: #006d32;
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
            font-size: 14px;
            border-bottom: 1px solid #e5e7eb;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #e5e7eb;
            vertical-align: middle;
        }

        .id {
            color: #666;
            font-weight: bold;
            font-size: 12px;
        }

        .doctor-name {
            font-weight: bold;
            color: #333;
        }

        .doctor-email {
            color: #666;
            font-size: 13px;
        }

        .btn-update {
            background-color: #2563eb;
            color: white;
        }

        .btn-update:hover {
            background-color: #1d4ed8;
        }

        .btn-delete {
            background-color: #dc2626;
            color: white;
        }

        .btn-delete:hover {
            background-color: #b91c1c;
        }

        .delete-form {
            display: inline;
        }

        /* ================= EMPTY ================= */

        .empty-message {
            text-align: center;
            color: #777;
            padding: 30px;
        }

        /* ================= MODAL ================= */

        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;

            background-color: rgba(0, 0, 0, 0.45);

            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: white;
            width: 600px;
            max-width: 90%;
            max-height: 90vh;
            overflow-y: auto;
            padding: 30px;
            border-radius: 12px;
            position: relative;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .modal-content h2 {
            margin-bottom: 25px;
            color: #222;
        }

        .close {
            position: absolute;
            right: 20px;
            top: 15px;
            font-size: 28px;
            cursor: pointer;
            color: #666;
        }

        .close:hover {
            color: #000;
        }

        .modal-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }

        .btn-cancel {
            background-color: #e5e7eb;
            color: #333;
        }

        .btn-cancel:hover {
            background-color: #d1d5db;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {

            .add-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto;
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

            .admin-info {
                text-align: left;
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

        <a href="${pageContext.request.contextPath}/admin/dashboard">
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
            Specialities
        </a>

        <a href="${pageContext.request.contextPath}/admin/doctor"
           class="active">
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


<!-- ================= MAIN ================= -->

<div class="main">

    <!-- TOPBAR -->

    <div class="topbar">

        <h1>Doctors</h1>

        <div class="admin-info">

            <div class="name">
                ${sessionScope.user.firstName}
                ${sessionScope.user.lastName}
            </div>

            <div class="role">
                Administrator
            </div>

        </div>

    </div>


    <!-- ================= ADD DOCTOR ================= -->

    <div class="content-card">

        <h2>Add Doctor</h2>

        <form action="${pageContext.request.contextPath}/admin/doctor"
              method="post">

            <input type="hidden"
                   name="action"
                   value="create">

            <div class="add-grid">

                <div class="form-group">

                    <label for="firstName">
                        First Name
                    </label>

                    <input type="text"
                           id="firstName"
                           name="firstName"
                           required>

                </div>


                <div class="form-group">

                    <label for="lastName">
                        Last Name
                    </label>

                    <input type="text"
                           id="lastName"
                           name="lastName"
                           required>

                </div>


                <div class="form-group">

                    <label for="email">
                        Email
                    </label>

                    <input type="email"
                           id="email"
                           name="email"
                           required>

                </div>


                <div class="form-group">

                    <label for="phone">
                        Phone
                    </label>

                    <input type="text"
                           id="phone"
                           name="phone">

                </div>


                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input type="password"
                           id="password"
                           name="password"
                           required>

                </div>


                <div class="form-group">

                    <label for="matricule">
                        Matricule
                    </label>

                    <input type="text"
                           id="matricule"
                           name="matricule"
                           required>

                </div>


                <div class="form-group">

                    <label for="title">
                        Title
                    </label>

                    <input type="text"
                           id="title"
                           name="title"
                           placeholder="Dr, Prof, etc.">

                </div>


                <div class="form-group">

                    <label for="department_id">
                        Department
                    </label>

                    <select id="department_id"
                            name="department_id"
                            required>

                        <option value="" disabled selected>
                            Select department
                        </option>

                        <c:forEach var="department"
                                   items="${departments}">

                            <option value="${department.id}">
                                ${department.name}
                            </option>

                        </c:forEach>

                    </select>

                </div>


                <div class="form-group">

                    <label for="speciality_id">
                        Speciality
                    </label>

                    <select id="speciality_id"
                            name="speciality_id"
                            required>

                        <option value="" disabled selected>
                            Select speciality
                        </option>

                        <c:forEach var="speciality"
                                   items="${specialities}">

                            <option value="${speciality.id}">
                                ${speciality.name}
                            </option>

                        </c:forEach>

                    </select>

                </div>


                <div class="full-width">

                    <button type="submit"
                            class="btn btn-primary">
                        Add Doctor
                    </button>

                </div>

            </div>

        </form>

    </div>


    <!-- ================= DOCTOR LIST ================= -->

    <div class="content-card">

        <h2>All Doctors</h2>

        <div class="table-container">

            <c:choose>

                <c:when test="${not empty doctors}">

                    <table>

                        <thead>

                        <tr>
                            <th>Doctor</th>
                            <th>Matricule</th>
                            <th>Department</th>
                            <th>Speciality</th>
                            <th>Phone</th>
                            <th>Actions</th>
                        </tr>

                        </thead>

                        <tbody>

                        <c:forEach var="doctor"
                                   items="${doctors}">

                            <tr>

                                <!-- DOCTOR -->

                                <td>

                                    <div class="doctor-name">
                                        Dr. ${doctor.firstName}
                                        ${doctor.lastName}
                                    </div>

                                    <div class="doctor-email">
                                        ${doctor.email}
                                    </div>

                                </td>


                                <!-- MATRICULE -->

                                <td>
                                    ${doctor.matricule}
                                </td>


                                <!-- DEPARTMENT -->

                                <td>
                                    ${doctor.departmentName}
                                </td>


                                <!-- SPECIALITY -->

                                <td>
                                    ${doctor.specialityName}
                                </td>


                                <!-- PHONE -->

                                <td>
                                    ${doctor.phone}
                                </td>


                                <!-- ACTIONS -->

                                <td>

                                    <button type="button"
                                            class="btn btn-update"
                                            onclick="openUpdateModal(this)"

                                            data-id="${doctor.id}"
                                            data-first-name="${doctor.firstName}"
                                            data-last-name="${doctor.lastName}"
                                            data-email="${doctor.email}"
                                            data-phone="${doctor.phone}"
                                            data-matricule="${doctor.matricule}"
                                            data-title="${doctor.title}"
                                            data-speciality-id="${doctor.specialityId}"
                                            data-department-id="${doctor.departmentId}">

                                        Update

                                    </button>


                                    <form action="${pageContext.request.contextPath}/admin/doctor"
                                          method="post"
                                          class="delete-form">

                                        <input type="hidden"
                                               name="action"
                                               value="delete">

                                        <input type="hidden"
                                               name="id"
                                               value="${doctor.id}">

                                        <button type="submit"
                                                class="btn btn-delete">

                                            Delete

                                        </button>

                                    </form>

                                </td>

                            </tr>

                        </c:forEach>

                        </tbody>

                    </table>

                </c:when>


                <c:otherwise>

                    <div class="empty-message">
                        No doctors found.
                    </div>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</div>


<!-- ================= UPDATE MODAL ================= -->

<div id="updateModal"
     class="modal">

    <div class="modal-content">

        <span class="close"
              onclick="closeUpdateModal()">
            &times;
        </span>

        <h2>Update Doctor</h2>

        <form action="${pageContext.request.contextPath}/admin/doctor"
              method="post">

            <input type="hidden"
                   name="action"
                   value="update">

            <input type="hidden"
                   id="updateId"
                   name="id">


            <div class="add-grid">

                <div class="form-group">

                    <label for="updateFirstName">
                        First Name
                    </label>

                    <input type="text"
                           id="updateFirstName"
                           name="firstName"
                           required>

                </div>


                <div class="form-group">

                    <label for="updateLastName">
                        Last Name
                    </label>

                    <input type="text"
                           id="updateLastName"
                           name="lastName"
                           required>

                </div>


                <div class="form-group">

                    <label for="updateEmail">
                        Email
                    </label>

                    <input type="email"
                           id="updateEmail"
                           name="email"
                           required>

                </div>


                <div class="form-group">

                    <label for="updatePhone">
                        Phone
                    </label>

                    <input type="text"
                           id="updatePhone"
                           name="phone">

                </div>


                <div class="form-group">

                    <label for="updateMatricule">
                        Matricule
                    </label>

                    <input type="text"
                           id="updateMatricule"
                           name="matricule"
                           required>

                </div>


                <div class="form-group">

                    <label for="updateTitle">
                        Title
                    </label>

                    <input type="text"
                           id="updateTitle"
                           name="title">

                </div>


                <div class="form-group">

                    <label for="updateDepartment">
                        Department
                    </label>

                    <select id="updateDepartment"
                            name="department_id"
                            required>

                        <c:forEach var="department"
                                   items="${departments}">

                            <option value="${department.id}">
                                ${department.name}
                            </option>

                        </c:forEach>

                    </select>

                </div>


                <div class="form-group">

                    <label for="updateSpeciality">
                        Speciality
                    </label>

                    <select id="updateSpeciality"
                            name="speciality_id"
                            required>

                        <c:forEach var="speciality"
                                   items="${specialities}">

                            <option value="${speciality.id}">
                                ${speciality.name}
                            </option>

                        </c:forEach>

                    </select>

                </div>

            </div>


            <div class="modal-actions">

                <button type="button"
                        class="btn btn-cancel"
                        onclick="closeUpdateModal()">

                    Cancel

                </button>

                <button type="submit"
                        class="btn btn-update">

                    Save Changes

                </button>

            </div>

        </form>

    </div>

</div>


<!-- ================= JAVASCRIPT ================= -->

<script>

    function openUpdateModal(button) {

        document.getElementById("updateId").value =
            button.dataset.id;

        document.getElementById("updateFirstName").value =
            button.dataset.firstName;

        document.getElementById("updateLastName").value =
            button.dataset.lastName;

        document.getElementById("updateEmail").value =
            button.dataset.email;

        document.getElementById("updatePhone").value =
            button.dataset.phone;

        document.getElementById("updateMatricule").value =
            button.dataset.matricule;

        document.getElementById("updateTitle").value =
            button.dataset.title;

        document.getElementById("updateDepartment").value =
            button.dataset.departmentId;

        document.getElementById("updateSpeciality").value =
            button.dataset.specialityId;

        document.getElementById("updateModal").style.display =
            "flex";
    }


    function closeUpdateModal() {

        document.getElementById("updateModal").style.display =
            "none";
    }


    window.onclick = function(event) {

        const modal =
            document.getElementById("updateModal");

        if (event.target === modal) {
            closeUpdateModal();
        }

    };

</script>

</body>

</html>

