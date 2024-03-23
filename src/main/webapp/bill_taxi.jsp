<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Taxi Bill</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
    }
    .container {
        max-width: 600px;
        margin: 0 auto;
        border: 1px solid #ccc;
        padding: 20px;
    }
    h1 {
        text-align: center;
    }
    .bill-details {
        margin-top: 20px;
    }
    .bill-details table {
        width: 100%;
        border-collapse: collapse;
    }
    .bill-details table td, .bill-details table th {
        padding: 10px;
        border: 1px solid #ddd;
    }
    .bill-details table th {
        background-color: #f2f2f2;
    }
    .footer {
        margin-top: 20px;
        text-align: center;
    }
</style>
</head>
<body>
<div class="container">
    <h1>Taxi Bill</h1>
    <div class="bill-details">
        <table>
            <tr>
                <th>Taxi Name</th>
                <td id="taxiName"></td>
            </tr>
            <tr>
                <th>Driver</th>
                <td id="taxiDriver"></td>
            </tr>
            <tr>
                <th>Plate</th>
                <td id="taxiPlate"></td>
            </tr>
            <tr>
                <th>Kilometers</th>
                <td id="km"></td>
            </tr>
            <tr>
                <th>Total Price</th>
                <td id="totalPrice"></td>
            </tr>
            <tr>
                <th>Date</th>
                <td id="date"></td>
            </tr>
            <tr>
                <th>Status</th>
                <td id="status"></td>
            </tr>
        </table>
    </div>
    <div class="footer">
        Generated on: <span id="generatedDate"></span>
    </div>
</div>

<script>
    // Get current date and time
    var currentDate = new Date();
    var generatedDate = currentDate.toLocaleString();

    // Display generated date in the footer
    document.getElementById('generatedDate').innerText = generatedDate;

    window.print();
</script>

</body>
</html>