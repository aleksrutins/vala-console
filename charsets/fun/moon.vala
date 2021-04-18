using ValaConsole.Charsets;
namespace ValaConsole.Charsets.Fun {
    public class Moon : GLib.Object, Charset {
        public ulong interval() {return 80000;}
        public unichar[] frames() {
            return {
                '🌑',
                '🌒',
                '🌓',
                '🌔',
                '🌕',
                '🌖',
                '🌗',
                '🌘'
            };
        }
    }
}