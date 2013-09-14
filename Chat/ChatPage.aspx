<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChatPage.aspx.cs" Inherits="ChatPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="Helper.js"></script>
    <script type="text/javascript" src="ChatCtrl.js"></script>
    <style type="text/css">
        .Messages
        {
            overflow:auto;
            height:200px;
            width:550px;
            text-align:left;
            color:Gray;
            font-family:@Arial Unicode MS;
            margin:0 auto
        }
        
    </style>
</head>
<body ng-app>
    <form id="form1" runat="server">
    <div id = "container" style = " text-align:center">
        <%--<div>
            <textarea id = "txtGlobalChat" rows = "20" cols = "80"></textarea>
        </div>--%>
        <div id = "divMessages" ng-controller = "ChatCtrl"  class="Messages">
            <table width = "100%">
                <tr ng-repeat = "msg in globalChat">
                    <td>({{msg.time}})&nbsp;{{msg.message}}</td>
                </tr>
            </table>
        </div>
        <div>
            <input id = "txtMessage" size = "100" maxlength = "90" placeholder = "Enter your message" />
        </div>
    
    </div>
    </form>

    <script type ="text/javascript">
        $('#txtMessage').bind("keypress", function (e) {
            if (e.keyCode == 13) {
                AddGlobalChatMsg();
                $('#txtMessage').val("");                
                return false;
            }
        });

        function AddGlobalChatMsg() {
            var chatService = new ServiceCall("AddGlobalChat", "{'message':'" + Helper.htmlEscape($('#txtMessage').val()) + "'}");
            chatService.callService(addGlobalChat_Complete);
            //getGlobalChat();
        }

        function addGlobalChat_Complete() {}

        function ContentLoaded() {
            updateChatArea();
        }

        function updateChatArea() {
            getGlobalChat();
        }

        function getGlobalChat() {
            var chatService = new ServiceCall("GetGlobalChat", "{}");
            chatService.callService(getGlobalChat_Complete);
        }

        function getGlobalChat_Complete(msg) {
            //$("#txtGlobalChat").val(msg.d);
            var scope = AngularScope();
            var scroll = scrollBarAtBottom();
            scope.globalChat = [];
            var i = 0;
            for (; i < msg.d.length; i++) {
                msg.d[i].message = Helper.htmlUnescape(msg.d[i].message); //unEscape the message string
                scope.globalChat.push(msg.d[i]);
            }
            scope.$apply();            
            if (scroll === true) {
                setTimeout("scrollToBottom();", 50);
            }
            setTimeout("getGlobalChat(false);", 100);
        }

        function scrollToBottom() {
            debugger;
            $('#divMessages').scrollTop($('#divMessages')[0].scrollHeight);
        }

        function AngularScope() {
            return angular.element($("#divMessages")).scope();
        }

        function scrollBarAtBottom() {
            var divMessages = $("#divMessages");
            var scrollTop = divMessages.scrollTop();
            var height = divMessages.height();
            var scrollHeight = divMessages[0].scrollHeight;
            if (scrollTop >= scrollHeight - height) {
                return true;
            }
            else {
                return false;
            }
        }

        window.addEventListener("DOMContentLoaded", ContentLoaded, false); 
    </script>
</body>
</html>
