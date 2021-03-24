using ValaConsole;

void main() {
    var console = new Console("test");
    console.log("Hello");
    var spinner = new Spinner("Doing something...", "Complete");
    var spinthread = new Spinner.SpinThread(spinner);
    var thread = new Thread<void>.try("Spinner thread", spinthread.run);
    Thread.usleep(600000);
    spinthread.stop();
    thread.join();
    console.log("Done spinning");
}