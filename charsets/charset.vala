namespace ValaConsole.Charsets {
    public interface Charset : GLib.Object {
        public abstract ulong interval();
        public abstract unichar[] frames();
    }
}