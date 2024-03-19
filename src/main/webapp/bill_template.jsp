<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Bill</title>
    <style>
        /* Define styles for the printed bill */
        /* You can customize these styles according to your requirements */
        body {
            font-family: Arial, sans-serif;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        span {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Bill</h2>
    <table>
        <tr>
            <th>Food Name</th>
            <th>Bill Amount</th>
            <th>Quantity</th>
            <th>Date</th>
            <th>Status</th>
        </tr>
        <tr>
            <td id="foodName"></td>
            <td id="foodPrice"></td>
            <td id="quantity"></td>
            <td id="date"></td>
            <td id="status"></td>
        </tr>
    </table>
    <script>
        // Print the bill
        window.print();
    </script>
</body>
</html>