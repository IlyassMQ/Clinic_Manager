<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>My Absences - ClinicManager</title>

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

        /* ================= FORM ================= */

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
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
        .form-group textarea {
            width: 100%;
            padding: 11px 12px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            outline: none;
            background-color: white;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 90px;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #00843D;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        /* ================= BUTTONS ================= */

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

        .btn-cancel {
            background-color: #e5e7eb;
            color: #333;
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

        /* ================= ACTIONS ================= */

        .actions {
            display: flex;
            gap: 8px;
            align-items: center;
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
            inset: 0;
            z-index: 1000;
            background-color: rgba(0, 0, 0, 0.45);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            width: 600px;
            max-width: 90%;
            max-height: 90vh;
            overflow-y: auto;
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            position: relative;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .modal-content h2 {
            margin-bottom: 25px;
        }

        .close {
            position: absolute;
            top: 15px;
            right: 20px;
            font-size: 28px;
            color: #666;
            cursor: pointer;
        }

        .close:hover {
            color: #000;
        }

        .modal-actions {
            margin-top: 20px;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 900px) {
            .form-grid {
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
                width: calc(100% - 200px);
            }

            .topbar {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .doctor-info {
                text-align: left;
            }
        }
    </style>
</head>

<body>

<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <div class="logo">ClinicManager</div>

    <div class="menu-title">Main</div>

    <div class="menu">
        <a href="${pageContext.request.contextPath}/doctor/dashboard">
            Dashboard
        </a>
    </div>

    <div class="menu-title">My Management</div>

    <div class="menu">
        <a href="${pageContext.request.contextPath}/doctor/profile">
            My Profile
        </a>

        <a href="${pageContext.request.contextPath}/doctor/disponibility">
            My Availability
        </a>

        <a href="${pageContext.request.contextPath}/doctor/absence"
           class="active">
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

        <h1>My Absences</h1>

        <div class="doctor-info">
            <div class="name">
                Dr. ${doctor.firstName} ${doctor.lastName}
            </div>

            <div class="role">Doctor</div>
        </div>

    </div>

    <!-- ================= CREATE ABSENCE ================= -->

    <div class="content-card">

        <h2>Declare an Absence</h2>

        <form action="${pageContext.request.contextPath}/doctor/absence"
              method="post">

            <input type="hidden" name="action" value="create">

            <div class="form-grid">

                <div class="form-group">
                    <label for="startDate">Start Date</label>

                    <input type="date"
                           id="startDate"
                           name="startDate"
                           required>
                </div>

                <div class="form-group">
                    <label for="endDate">End Date</label>

                    <input type="date"
                           id="endDate"
                           name="endDate"
                           required>
                </div>

                <div class="form-group full-width">
                    <label for="reason">Reason</label>

                    <textarea id="reason"
                              name="reason"
                              maxlength="255"
                              placeholder="Enter the reason for your absence (optional)"></textarea>
                </div>

                <div class="full-width">
                    <button type="submit" class="btn btn-primary">
                        Declare Absence
                    </button>
                </div>

            </div>

        </form>

    </div>

    <!-- ================= ABSENCE LIST ================= -->

    <div class="content-card">

        <h2>My Absences</h2>

        <div class="table-container">

            <c:choose>

                <c:when test="${not empty absences}">

                    <table>
                        <thead>
                        <tr>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Reason</th>
                            <th>Actions</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:forEach var="absence" items="${absences}">

                            <tr>
                                <td>${absence.startDate}</td>
                                <td>${absence.endDate}</td>

                                <td>
                                    <c:choose>
                                        <c:when test="${not empty absence.reason}">
                                            <c:out value="${absence.reason}"/>
                                        </c:when>
                                        <c:otherwise>
                                            Not specified
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>
                                    <div class="actions">

                                        <button type="button"
                                                class="btn btn-update"
                                                onclick="openUpdateModal(this)"
                                                data-id="${absence.id}"
                                                data-start-date="${absence.startDate}"
                                                data-end-date="${absence.endDate}"
                                                data-reason="${absence.reason}">
                                            Update
                                        </button>

                                        <form action="${pageContext.request.contextPath}/doctor/absence"
                                              method="post"
                                              onsubmit="return confirm('Are you sure you want to delete this absence?');">

                                            <input type="hidden"
                                                   name="action"
                                                   value="delete">

                                            <input type="hidden"
                                                   name="id"
                                                   value="${absence.id}">

                                            <button type="submit"
                                                    class="btn btn-delete">
                                                Delete
                                            </button>

                                        </form>

                                    </div>
                                </td>
                            </tr>

                        </c:forEach>

                        </tbody>
                    </table>

                </c:when>

                <c:otherwise>

                    <div class="empty-message">
                        You have not declared any absences yet.
                    </div>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</div>

<!-- ================= UPDATE MODAL ================= -->

<div id="updateModal" class="modal">

    <div class="modal-content">

        <span class="close" onclick="closeUpdateModal()">
            &times;
        </span>

        <h2>Update Absence</h2>

        <form action="${pageContext.request.contextPath}/doctor/absence"
              method="post">

            <input type="hidden" name="action" value="update">

            <input type="hidden" id="updateId" name="id">

            <div class="form-grid">

                <div class="form-group">
                    <label for="updateStartDate">Start Date</label>

                    <input type="date"
                           id="updateStartDate"
                           name="startDate"
                           required>
                </div>

                <div class="form-group">
                    <label for="updateEndDate">End Date</label>

                    <input type="date"
                           id="updateEndDate"
                           name="endDate"
                           required>
                </div>

                <div class="form-group full-width">
                    <label for="updateReason">Reason</label>

                    <textarea id="updateReason"
                              name="reason"
                              maxlength="255"
                              placeholder="Enter the reason for your absence (optional)"></textarea>
                </div>

            </div>

            <div class="modal-actions">

                <button type="button"
                        class="btn btn-cancel"
                        onclick="closeUpdateModal()">
                    Cancel
                </button>

                <button type="submit" class="btn btn-update">
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

        document.getElementById("updateStartDate").value =
            button.dataset.startDate;

        document.getElementById("updateEndDate").value =
            button.dataset.endDate;

        document.getElementById("updateReason").value =
            button.dataset.reason || "";

        document.getElementById("updateModal").style.display = "flex";
    }

    function closeUpdateModal() {
        document.getElementById("updateModal").style.display = "none";
    }

    window.addEventListener("click", function(event) {
        const modal = document.getElementById("updateModal");

        if (event.target === modal) {
            closeUpdateModal();
        }
    });

    // Prevent the user from selecting an end date earlier than the start date.
    const startDateInput = document.getElementById("startDate");
    const endDateInput = document.getElementById("endDate");

    startDateInput.addEventListener("change", function() {
        endDateInput.min = startDateInput.value;

        if (endDateInput.value && endDateInput.value < startDateInput.value) {
            endDateInput.value = "";
        }
    });

    const updateStartDateInput = document.getElementById("updateStartDate");
    const updateEndDateInput = document.getElementById("updateEndDate");

    updateStartDateInput.addEventListener("change", function() {
        updateEndDateInput.min = updateStartDateInput.value;

        if (updateEndDateInput.value &&
            updateEndDateInput.value < updateStartDateInput.value) {
            updateEndDateInput.value = "";
        }
    });

    updateStartDateInput.addEventListener("input", function() {
        updateEndDateInput.min = updateStartDateInput.value;
    });
</script>

</body>
</html>

