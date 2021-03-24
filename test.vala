using ValaConsole;

void main() {
    var console = new Console("test");
    console.log("Hello");
    var sp = Spinner.createAndStart("Doing something...", "Complete!");
    Thread.usleep(600000);
    sp.stop();
    console.log("Done spinning");
}