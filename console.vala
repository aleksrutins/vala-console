namespace ValaConsole {
    public class Console {
        private string tag;
        public Console(string tag) {
            this.tag = tag;
        }
        public void log(string message) {
            var tag = this.tag;
            stdout.puts(@"\033[2m[$tag]\033[0m $message\n");
        }
        public string question(string message) {
            var tag = this.tag;
            stdout.puts(@"\033[2;34m[$tag:question] \033[0;4m$message?\033[0;1m ");
            var res = stdin.read_line();
            stdout.puts("\033[0m");
            return res;
        }
        public void error(string message) {
            var tag = this.tag;
            stdout.puts(@"\033[2;31m[$tag:error] \033[0;31m$message\033[0m\n");
        }
        public void list(string header, string[] items) {
            stdout.puts(@"\033[2m[$tag:list]\033[0m $header\n");
            foreach(var item in items) {
                enumerate(item);
            }
        }
        public void enumerate(string item) {
            stdout.puts(@"  \033[1m∙\033[0m $item\n");
        }
    }
}
