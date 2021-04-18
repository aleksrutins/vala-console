using ValaConsole;

void main() {
    var console = new Console("test");
    console.log("Hello");
    var sp = Spinner.createAndStart("Doing something...", "Complete!");
    Thread.usleep(600000);
    sp.stop("Complete");
    var sp2 = Spinner.createAndStart("Doing something that will fail...", "Failed", new Charsets.Fun.Moon());
    Thread.usleep(600000);
    sp2.stop("Failed", true);
    console.log("Done spinning");
    console.list("Test list", new string[] {"Item 1", "Item 2", "Item 3"});
    console.enumerate("Extra item");
    console.log("A message");
    console.enumerate("Another item");
}
