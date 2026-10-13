<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Specialities - ClinicManager</title>

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

        .add-form {
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .add-form input,
        .add-form select {
            flex: 1;
            padding: 11px 12px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            outline: none;
            background-color: white;
        }

        .add-form input:focus,
        .add-form select:focus {
            border-color: #00843D;
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
        }

        /* ================= UPDATE BUTTON ================= */

        .btn-update {
            background-color: #2563eb;
            color: white;
        }

        .btn-update:hover {
            background-color: #1d4ed8;
        }

        /* ================= DELETE ================= */

        .delete-form {
            display: inline;
        }

        .btn-delete {
            background-color: #dc2626;
            color: white;
        }

        .btn-delete:hover {
            background-color: #b91c1c;
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
            width: 450px;
            max-width: 90%;
            padding: 30px;
            border-radius: 12px;
            position: relative;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .modal-content h2 {
            margin-bottom: 20px;
        }

        .modal-content label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .modal-content input,
        .modal-content select {
            width: 100%;
            padding: 11px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            margin-bottom: 18px;
            background-color: white;
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
        }

        .btn-cancel {
            background-color: #e5e7eb;
            color: #333;
        }

        .btn-cancel:hover {
            background-color: #d1d5db;
        }

        /* ================= RESPONSIVE ================= */

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

            .add-form {
                flex-direction: column;
                align-items: stretch;
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

        <a href="${pageContext.request.contextPath}/admin/speciality"
           class="active">
            Specialities
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


<!-- ================= MAIN ================= -->

<div class="main">

    <!-- TOPBAR -->

    <div class="topbar">

        <h1>Specialities</h1>

        <div class="admin-info">

            <div class="name">
                ${admin.firstName} ${admin.lastName}
            </div>

            <div class="role">
                Administrator
            </div>

        </div>

    </div>


    <!-- ================= ADD SPECIALITY ================= -->

    <div class="content-card">

        <h2>Add Speciality</h2>

        <form action="${pageContext.request.contextPath}/admin/speciality"
              method="post"
              class="add-form">

            <input type="hidden"
                   name="action"
                   value="create">

            <input type="text"
                   name="name"
                   placeholder="Enter speciality name"
                   required>

            <select name="id" required>

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

            <button type="submit"
                    class="btn btn-primary">
                Add Speciality
            </button>

        </form>

    </div>


    <!-- ================= SPECIALITY LIST ================= -->

    <div class="content-card">

        <h2>All Specialities</h2>

        <div class="table-container">

            <c:choose>

                <c:when test="${not empty specialities}">

                    <table>

                        <thead>

                        <tr>
                            <th>ID</th>
                            <th>Speciality</th>
                            <th>Department</th>
                            <th>Actions</th>
                        </tr>

                        </thead>

                        <tbody>

                        <c:forEach var="speciality"
                                   items="${specialities}">

                            <tr>

                                <td class="id">
                                    ${speciality.id}
                                </td>

                                <td>
                                    ${speciality.name}
                                </td>

                                <td>
                                    ${speciality.departmentName}
                                </td>

                                <td>

                                    <!-- UPDATE BUTTON -->

                                    <button type="button"
                                            class="btn btn-update"
                                            onclick="openUpdateModal(this)"

                                            data-id="${speciality.id}"
                                            data-name="${speciality.name}"
                                            data-department-id="${speciality.departmentId}">

                                        Update

                                    </button>


                                    <!-- DELETE -->

                                    <form action="${pageContext.request.contextPath}/admin/speciality"
                                          method="post"
                                          class="delete-form">

                                        <input type="hidden"
                                               name="action"
                                               value="delete">

                                        <input type="hidden"
                                               name="id"
                                               value="${speciality.id}">

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
                        No specialities found.
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

        <h2>Update Speciality</h2>

        <form action="${pageContext.request.contextPath}/admin/speciality"
              method="post">

            <input type="hidden"
                   name="action"
                   value="update">

            <input type="hidden"
                   id="specialityId"
                   name="speciality_id">


            <label for="specialityName">
                Speciality Name
            </label>

            <input type="text"
                   id="specialityName"
                   name="name"
                   required>


            <label for="departmentId">
                Department
            </label>

            <select id="departmentId"
                    name="department_id"
                    required>

                <c:forEach var="department"
                           items="${departments}">

                    <option value="${department.id}">
                        ${department.name}
                    </option>

                </c:forEach>

            </select>


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

        document.getElementById("specialityId").value =
            button.dataset.id;

        document.getElementById("specialityName").value =
            button.dataset.name;

        document.getElementById("departmentId").value =
            button.dataset.departmentId;

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

