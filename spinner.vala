namespace ValaConsole {
	public class Spinner {
		string msg;
		string endMsg;
		ulong delay;
		public const string[] charset = {
			"◢",
			"◣",
			"◤",
			"◥"
		};
		public Spinner(string msg, string endMsg = "Complete", ulong delay = 50000) {
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
			bool isError = false;
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
				if(isError) {
					stdout.puts(@"\033[1A\033[K\033[1;31m\u2717\033[0;31m $(spinner.endMsg)\n");
				} else {
					stdout.puts(@"\033[1A\033[K\033[1;32m✓\033[0m $(spinner.endMsg)\n");
				}
			}
			public void stop(bool error, string endMsg) {
				isStopping = true;
				isError = error;
				spinner.endMsg = endMsg;
			}
			public class Helper {
				SpinThread str;
				Thread<void> tr;
				public Helper(SpinThread str, Thread<void> tr) {
					this.str = str;
					this.tr = tr;
				}
				public void stop(string endMsg, bool error = false) {
					this.str.stop(error, endMsg);
					this.tr.join();
				}
			}
		}
		public static SpinThread.Helper createAndStart(string msg, string endMsg, ulong delay = 50000) {
			var spinner = new Spinner(msg, endMsg);
			var spinthread = new SpinThread(spinner);
			var thread = new Thread<void>("Spinner thread", spinthread.run);
			var helper = new SpinThread.Helper(spinthread, thread);
			return helper;
		}
	}
}
