/* application.vala
 *
 * Copyright 2022-2023 Nicola tudo75 Tudino
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace ValaFFmpeg {

    public static int main (string[] args) {
        new Application (args[0]);
        return 0;
    }

    public class Application : GLib.Object {

        private const string APP_NAME = "ValaFFMpeg";
        private const string VERSION = Constants.VERSION;
        private const string APP_ID = Constants.PROJECT_NAME;
        private const string APP_LANG_DOMAIN = Constants.GETTEXT_PACKAGE;
        private const string APP_INSTALL_PREFIX = Constants.PREFIX;

        public Application (string file) {
            // For Wayland: must be the same name of the exec in *.desktop file
            GLib.Environment.set_prgname (APP_ID);

            // congfigure i18n localization
            Intl.setlocale (LocaleCategory.ALL, "");
            string langpack_dir = Path.build_filename (APP_INSTALL_PREFIX, "share", "locale");
            Intl.bindtextdomain (APP_ID, langpack_dir);
            Intl.bind_textdomain_codeset (APP_ID, "UTF-8");
            Intl.textdomain (APP_ID);


            stdout.printf("%s\n", file);
        }
    }
}
