namespace ValaConsole {
	public class Spinner {
		string msg;
		string endMsg;
		ulong delay;
		public const string charset = "-\\|/";
		public Spinner(string msg, string endMsg, ulong delay = 50000) {
			this.msg = msg;
			this.endMsg = endMsg;
			this.delay = delay;
		}

		public void render(uint stage) {
			uint actStage = (uint) stage % charset.length;
			stdout.puts(@"\033[33m$(charset[actStage])\033[0m $msg\n");
		}
		public class SpinThread {
			bool isStopping = false;
			Spinner spinner;
			public SpinThread(Spinner spinner) {
				this.spinner = spinner;
			}
			public void run() {
				int i = 0;
				spinner.render(i);
				while(!isStopping) {
					i++;
					stdout.puts("\033[1A\033[K");
					spinner.render(i);
					Thread.usleep(spinner.delay);
				}
				stdout.puts(@"\033[1A\033[K\033[1;32m✓\033[0m $(spinner.endMsg)\n");
			}
			public void stop() {
				isStopping = true;
			}
		}
	}
}
