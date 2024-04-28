({
toggleModalBox: function(component, event, helper) {
    var countdown = 5;

    // Display the confirm dialog
    var result = confirm("Are you available for a Call ?");

    if (result) {
        // OK button was clicked
        console.log("OK button clicked");
        // Add your logic here for OK button
    } else {
        // Cancel button was clicked
        console.log("Cancel button clicked");
        // Add your logic here for Cancel button
    }

    // Set up a timer to run every second for 5 seconds
    var timerInterval = setInterval(function() {
        console.log(countdown + " seconds remaining");
        
        // Update UI or perform additional logic if needed

        countdown--;

        if (countdown < 0) {
            clearInterval(timerInterval);
            console.log("Timer logic after 5 seconds");
            // Add your logic here for the timer
        }
    }, 1000); // Run every 1000 milliseconds (1 second)
}

})