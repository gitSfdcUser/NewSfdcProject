({
    doInit : function(component, event, helper) {
        // Sample base64 encoded HTML content
        var base64EncodedHtml = "PGh0bWw+PGJvZHk+SGVsbG8gV29ybGQ8L2JvZHk+PC9odG1sPg==";
        
        // Set the attribute with the base64 encoded HTML content
        component.set("v.iframeHtmlContent", base64EncodedHtml);
    }
})