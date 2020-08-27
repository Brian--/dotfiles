from xonsh.tools import events
from piper.ratbagd import Ratbagd

from threading import Timer

rb = Ratbagd(1)
mouse = rb.devices[0]
mouse_led = mouse.profiles[0].leds[0]

def set_mouse_color(color):
    mouse_led.color = color
    return mouse.commit()

SUCCESS = 0x00FF00.to_bytes(3, 'big')
FAILURE = 0xFF0000.to_bytes(3, 'big')
DEFAULT = 0x5C3566.to_bytes(3, 'big')
RESET_DELAY = 2

# So we can keep only one running
# Shouldn't need sync stuff since only this thread does anything
# Start with a garbage one so we don't have to check if set
_last_timer = Timer(-1, lambda: None)

@events.on_postcommand
def set_to_status(cmd: str, rtn: int, **__):
    set_mouse_color(SUCCESS if rtn == 0 else FAILURE)

    global _last_timer
    _last_timer.cancel()
    _last_timer = Timer(RESET_DELAY, set_mouse_color, (DEFAULT,))
    _last_timer.start()

@events.on_exit
def cancel_reset_thread():
    _last_timer.cancel()
    set_mouse_color(DEFAULT)
