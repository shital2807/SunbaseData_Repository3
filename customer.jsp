<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.test.servlet.Person" %>

<!DOCTYPE html>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Customer List</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>uuid</th>
                    <th>first_name</th>
                    <th>last_name</th>
                    <th>street</th>
                    <th>address</th>
                    <th>city</th>
                    <th>state</th>
                    <th>email</th>
                    <th>phone</th>
                </tr>
            </thead>
            <tbody id="customerData">
                
            </tbody>
        </table>
        <div class="row">
            <div class="col">
                <button type="button" class="btn btn-success" onClick="redirectTo('add_cust.html')">Add Customer</button>
            </div>
            <div class="col">
                <button type="button" class="btn btn-danger" onClick="redirectTo('del_cust.html')">Delete Customer</button>
            </div>
            <div class="col">
                <button type="button" class="btn btn-primary" onClick="redirectTo('update_cust.html')">Update Customer</button>
            </div>
        </div>
    </div>

    <script>
        function redirectTo(url) {
            window.location.href = url;
        }

        $(document).ready(function() {
            $.ajax({
                url: 'https://qa2.sunbasedata.com/sunbase/portal/api/assignment.jsp?cmd=get_customer_list',
                headers: {
                    'Authorization': 'Bearer' 
                },
                type: 'GET',
                success: function(response) {
                    var customerData = $('#customerData');
                    $.each(response, function(index, customer) {
                        customerData.append(
                            '<tr>' +
                            '<td>' + customer.uuid + '</td>' +
                            '<td>' + customer.first_name + '</td>' +
                            '<td>' + customer.last_name + '</td>' +
                            '<td>' + customer.street + '</td>' +
                            '<td>' + customer.address + '</td>' +
                            '<td>' + customer.city + '</td>' +
                            '<td>' + customer.state + '</td>' +
                            '<td>' + customer.email + '</td>' +
                            '<td>' + customer.phone + '</td>' +
                            '</tr>'
                        );
                    });
                },
                error: function(error) {
                  
                    console.error(error);
                }
            });
        });
    </script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
