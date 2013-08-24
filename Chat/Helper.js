; var ServiceCall = function (serviceName, serviceParams) {
    this._serviceName = serviceName;
    this._serviceParams = serviceParams;
    return this;
};

ServiceCall.prototype = {
    callService: function (serviceCallSuccess) {
        $.ajax({
            type: "POST",
            url: 'ChatService.asmx/' + this._serviceName,
            data: this._serviceParams,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: serviceCallSuccess,
            error: function (e) {
                //alert("Error in caling serice.");
            }
        });
    }
}

var Helper = {
    //We need to escape and un-escape strings in many cases so as to avoid the corruption of the
    //json that we are passing. This can also be used in many places in the web pages, for ex: sometimes
    //we need to call functions from onclick attributes then escaping and un-escaping is better
    //than tweaking the string concatenations.
    //http://stackoverflow.com/questions/1219860/html-encoding-in-javascript-jquery
    htmlEscape: function (str) {
        return String(str)
            .replace(/&/g, '&amp;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&#39;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;');
    },
    htmlUnescape: function (value) {
        return String(value)
            .replace(/&quot;/g, '"')
            .replace(/&#39;/g, "'")
            .replace(/&lt;/g, '<')
            .replace(/&gt;/g, '>')
            .replace(/&amp;/g, '&');
    }
};