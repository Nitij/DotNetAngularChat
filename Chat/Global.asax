<%@ Application Language="C#" %>

<script runat="server">

    /// <summary>
    /// Code that runs on application startup
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    void Application_Start(object sender, EventArgs e) 
    {
        //this is our list of users.
        Dictionary<String, String> userList = new Dictionary<String, String>();
        Application.Add("UserList", userList); 

        //this is the place where we put all the global chat data.
        List<Object> globalChat = new List<Object>();
        Application.Add("GlobalChat", globalChat); 
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
