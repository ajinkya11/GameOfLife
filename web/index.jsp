<%-- 
    Document   : index
    Created on : Feb 15, 2017, 1:26:08 PM
    Author     : Ajinkya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Cloud Based System | Log in</title>

        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <style type="text/css">
            td
            {
                padding:0 10px 0 10px;
                cursor: pointer;

            }
            div.login-box {
                width: 750px;
                margin: auto;
            }

        </style>

    </head>

    <body class="hold-transition login-page">

        <div class="login-box" style="width">

            <div class="login-logo">

                <a><b>Game of </b>Life</a>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Enter the number of rows : <input type = "text" name="rows" id="rows" value="0"></p>
                <p class="login-box-msg">Enter the number of columns : <input type = "text" name="columns" id="columns"  value="0"></p>
                <p class="login-box-msg">Generate matrix : <input type = "button" name="generate" id="generate" value="Generate" onclick="createTable()"></p>
                <p class="login-box-msg">Reset matrix : <input type = "button" name="reset" id="reset" value="Reset" onclick="resetTable()"></p>
                Input Matrix : <table border = "1" id="myTable" align = "center">
                    <tr id="myRow">
                    </tr>                
                </table>
                <br/>
                Output Matrix : <table border = "1" id="myTableRes" align = "center">
                    <tr id="myRowRes">
                    </tr>                
                </table>
                <br/>
                <p class="login-box-msg">Confirm : <input type = "button" name="confirm" id="confirm" value="Confirm" onclick="reloadingAgain()"></p>
                <p class="login-box-msg">Start : <input type = "button" name="start" id="start" value="Start"></p>
            </div>
            <!-- /.login-box-body -->
        </div>

        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <script type="text/javascript">
                    var globalRows = 0;
                    var globalCols = 0;
                    function createTable()
                    {
                        var rows = document.getElementById('rows').value;
                        var columns = document.getElementById('columns').value;
                        globalRows = rows;
                        globalCols = columns;

                        var table = document.getElementById("myTable");


                        for (var i = 0; i < rows; i++)
                        {
                            var row = table.insertRow(0);
                            for (var j = 0; j < columns; j++)
                            {
                                var cell1 = row.insertCell(j);
                                cell1.innerHTML = "0";
                                cell1.id = "td1";
                                var h1 = document.getElementsByTagName("td")[j];
                                var att1 = document.createAttribute("onclick");
                                att1.value = "switchNumber(this)";
                                h1.setAttributeNode(att1);
                            }
                        }
                    }
                    function resetTable()
                    {
                        var table = document.getElementById("myTable");

                        for (var i = 0; i < globalRows; i++)
                        {
                            table.deleteRow(0);
                        }
                    }
                    function switchNumber(val)
                    {
                        if (val.innerText == 0)
                        {
                            val.innerHTML = "1";
                        }
                        else
                        {
                            val.innerHTML = "0";
                        }
                    }
        </script>
        <script>
            function reloadingAgain()
            {
            $(document).ready(function () {
                var outer = "";
                for (var i = 0; i < globalRows; i++)
                {
                    var inner = "";
                    inner = document.getElementById("myTable").rows[i].cells[0].innerHTML + ",";
                    for (var j = 1; j < globalCols; j++)
                    {
                        inner += document.getElementById("myTable").rows[i].cells[j].innerHTML + ",";
                    }
                    outer += inner + " ";
                }
                $("input#start").click(function () {
                    $.post("GameOfLife",
                            {
                                board: outer
                            },
                    function (data, status) {
                        var table = document.getElementById("myTableRes");

                        var outerArray = data.split(" ");
                        for (var i = 0; i < outerArray.length; i++)
                        {
                            var row = table.insertRow(0);
                            var innerArray = outerArray[i].split(",");
                            for (var j = 0; j < innerArray.length-1; j++)
                            {
                                var cell1 = row.insertCell(j);
                                cell1.innerHTML = innerArray[j];
                                cell1.id = "td1";
                            }
                        }

                        
                    });
                });
            });
        }
        </script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
