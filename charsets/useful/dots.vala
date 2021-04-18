using ValaConsole.Charsets;

namespace ValaConsole.Charsets.Useful {
    public class Dots : GLib.Object, Charset {
        public ulong interval() {
            return 100000;
        }
        public unichar[] frames() {
            return { //Courtesy of https://github.com/sindresorhus/cli-spinners/blob/aa945cedba0b6b008fbda01c57de62301c209549/spinners.json#L17
                '⣾',
                '⣽',
                '⣻',
                '⢿',
                '⡿',
                '⣟',
                '⣯',
                '⣷'
            };
        }
    }
}