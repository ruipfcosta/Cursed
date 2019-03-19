import Cursed
import Cncurses

print("Starting")

initscr();

let w = stdscr
waddstr(w, "Hello ncurses :)")
refresh();

sleep(1);

endwin();
