namespace ValaConsole {
	public class Spinner {
		string msg;
		string endMsg;
		public Charsets.Charset charset;
		public Spinner(string msg, string endMsg = "Complete", Charsets.Charset charset = new Charsets.Useful.Dots()) {
			this.msg = msg;
			this.endMsg = endMsg;
			this.charset = charset;
		}

		public void render(uint stage) {
			uint actStage = (uint) (stage % ((charset.frames()).length));
			stdout.puts(@"\033[33m$(charset.frames()[actStage])\033[0m $msg\n");
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
					Thread.usleep(spinner.charset.interval());
				}
				if(isError) {
					stdout.puts(@"\033[1A\033[K\033[1;31m\u2717\033[0;31m $(spinner.endMsg)\033[0m\n");
				} else {
					stdout.puts(@"\033[1A\033[K\033[1;32m✓\033[0m $(spinner.endMsg)\n");
				}
			}
			public void stop(bool error, string? endMsg) {
				isStopping = true;
				isError = error;

				if(endMsg != null) {
					spinner.endMsg = endMsg;
				}
			}
			public class Helper {
				SpinThread str;
				Thread<void> tr;
				public Helper(SpinThread str, Thread<void> tr) {
					this.str = str;
					this.tr = tr;
				}
				public void stop(string? endMsg = null, bool error = false) {
					this.str.stop(error, endMsg);
					this.tr.join();
				}
			}
		}
		public static SpinThread.Helper createAndStart(string msg, string endMsg = "Complete", Charsets.Charset charset = new Charsets.Useful.Dots()) {
			var spinner = new Spinner(msg, endMsg, charset);
			var spinthread = new SpinThread(spinner);
			var thread = new Thread<void>("Spinner thread", spinthread.run);
			var helper = new SpinThread.Helper(spinthread, thread);
			return helper;
		}
	}
}
