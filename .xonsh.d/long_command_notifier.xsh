import gi
gi.require_version('Notify', '0.7')
from gi.repository import Notify

from typing import Optional

from xonsh.tools import events
from humanfriendly import format_timespan

Notify.init('xonsh')

@events.on_postcommand
def notify_on_long_command(cmd: str, rtn: int, out: Optional[str], ts: list):
    start, end = ts
    dur = end - start
    if dur > 10:
        Notify.Notification.new(f'Exited {rtn} after {format_timespan(dur)}', f'λ {cmd}').show()
