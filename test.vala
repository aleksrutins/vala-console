// All comments precede their line
// Import ValaConsole
using ValaConsole;

void main() {
    // Create a new console with a tag of 'test'
    // Tags are printed so that you know where the message came from - they should be lowercase and short yet descriptive (class name, method name, etc.)
    var console = new Console("test");
    // Log (default priority) a message of "Hello!"
    console.log("Hello");
    // Print an error message - this appears in red
    console.error("This is an error");
    // Get input from the user and print it out
    console.log("You entered: " + console.question("Enter something"));
    // Create and start a terminal spinner using the default charset (circling braille dots)
    // This will run on a separate thread
    var sp = Spinner.createAndStart("Doing something...", "Complete!");
    // Simulate a long-running task
    Thread.usleep(600000);
    // Stop the spinner, and switch its message to "Complete". I'm pretty sure that it can't be reused.
    sp.stop("Complete");
    // Create another spinner, this one with a different charset.
    var sp2 = Spinner.createAndStart("Doing something that will fail...", "Failed", new Charsets.Fun.Moon());
    // Simulate a long-running task
    Thread.usleep(600000);
    // Stop the spinner, this time with an error message of 'Failed'. A second argument of true tells it to stop with error formatting.
    sp2.stop("Failed", true);
    // Log a thing
    console.log("Done spinning");
    // Print out a list with a header
    console.list("Test list", new string[] {"Item 1", "Item 2", "Item 3"});
    // Print out an extra list item
    console.enumerate("Extra item");
    // Log a message
    console.log("A message");
    // Print out another list item, without a header
    console.enumerate("Another item");
}
