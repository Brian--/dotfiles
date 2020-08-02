#!/usr/bin/python3

from i3pystatus import Status
import argparse

def apply(fn, *args, **kwargs):
    return fn(*args, **kwargs)

@apply
class defbar:
    def __init__(self):
        self.bars = {}

    def __call__(self, fn):
        self.bars[fn.__name__] = fn


@defbar
def top(status):
    status.register('clock', format='%c')

    status.register(
        'battery',
        format='{status}  {consumption:.2f}W {remaining:%E%h:%M🕰️}',
        alert=True,
        alert_percentage=10,
        status={
            'DIS': '👎',
            'CHR': '👍',
            'FULL': '💯',
        },
        glyphs='😡😱😰😨😮😔😕🙂😀😁😂'
    )


@defbar
def bottom(status):
    total = 1920-30
    status.register(
        'net_speed',
        format='↓{speed_down:.1f}{down_units} ↑{speed_up:.1f}{up_units}',
        hints={'min_width': 120})
    total -= 120

    status.register(
        'network',
        interface='enp3s0',
        graph_style='braille-snake',
        hints={'min_width': 100})
    total -= 100

    status.register(
        'now_playing',
        format='{title} 💿 {album}👨‍🎤 {artist}',
        hints={'min_width': 820})
    total -= 820

    status.register(
        'pulseaudio',
        format='{muted} {volume_bar}',
        bar_type='horizontal',
        muted='🔇',
        unmuted='🔉',
        hints={
            'min_width': total,
            'separator': False
        })


parser = argparse.ArgumentParser(description='Status command for i3bar')
parser.add_argument('bar', choices=defbar.bars)

ns = parser.parse_args()

status = Status()
defbar.bars[ns.bar](status)
status.run()
