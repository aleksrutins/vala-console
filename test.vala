using ValaConsole;

void main() {
    var console = new Console("test");
    console.log("Hello");
    var sp = Spinner.createAndStart("Doing something...", "Complete!");
    Thread.usleep(600000);
    sp.stop("Complete");
    var sp2 = Spinner.createAndStart("Doing something that will fail...", "Failed");
    Thread.usleep(600000);
    sp2.stop("Failed", true);
    console.log("Done spinning");
}