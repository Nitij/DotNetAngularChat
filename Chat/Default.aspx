<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="Helper.js"></script>
</head>
<body>
   <form id="form1" runat="server">
    
    <div>
        <h3>Enter your name:</h3>        
        <input id = "txtName" size = "30" />&nbsp;
        <input type = "button" id = "btnAddUser" value = "Add" onclick = "AddUser();" />
    </div>
    </form>

    <script type ="text/javascript">        
        var btnAddUser = $("#btnAddUser");
        var txtName = $("#txtName");

        function AddUser() {
            var chatService = new ServiceCall("AddUser", "{'userName':'" + txtName.val() + "'}");
            chatService.callService(addUser_Complete);
        }

        function addUser_Complete() {
            window.open("ChatPage.aspx", "_self");
        }      
    </script>
</body>
</html>