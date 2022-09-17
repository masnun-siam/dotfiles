from qutebrowser.api import interceptor
import os
import subprocess
import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

# Setting Dark Mode
config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.preferred_color_scheme","dark")

# Auto Save Session (useful in Unpredictable Situations)
config.set("auto_save.session", False)

# Change Default Zoom to 75%
config.set("zoom.default", "125%")

# Change Downloads tab position
config.set("downloads.position","bottom")

config.set("content.private_browsing", True)

config.set("fonts.default_size", '15pt')

config.set("content.cookies.store", False)

# Custom keybinds
config.bind('M', 'hint links spawn /Applications/MacPorts/mpv.app/Contents/MacOS/mpv --force-window=immediate {hint-url}')
config.bind('P', 'hint links spawn /Applications/MacPorts/mpv.app/Contents/MacOS/mpv --force-window=immediate --vid=no {hint-url}')
config.bind(';m', 'hint links spawn /opt/homebrew/bin/alacritty -e /opt/homebrew/bin/yt-dlp -f bestvideo+bestaudio "{hint-url}" -P /Users/siam/Movies/ --ffmpeg-location /opt/local/bin/')
config.bind('gi', 'hint inputs')
config.bind('<f12>', 'inspector')

config.bind("<Ctrl-h>", "fake-key <Backspace>", "insert")
config.bind("<Ctrl-a>", "fake-key <Home>", "insert")
config.bind("<Ctrl-e>", "fake-key <End>", "insert")
config.bind("<Ctrl-b>", "fake-key <Left>", "insert")
config.bind("<Mod1-b>", "fake-key <Ctrl-Left>", "insert")
config.bind("<Ctrl-f>", "fake-key <Right>", "insert")
config.bind("<Mod1-f>", "fake-key <Ctrl-Right>", "insert")
config.bind("<Ctrl-p>", "fake-key <Up>", "insert")
config.bind("<Ctrl-n>", "fake-key <Down>", "insert")
config.bind("<Mod1-d>", "fake-key <Ctrl-Delete>", "insert")
config.bind("<Ctrl-d>", "fake-key <Delete>", "insert")
config.bind("<Ctrl-w>", "fake-key <Ctrl-Backspace>", "insert")
config.bind("<Ctrl-u>", "fake-key <Shift-Home><Delete>", "insert")
config.bind("<Ctrl-k>", "fake-key <Shift-End><Delete>", "insert")
config.bind("<Ctrl-x><Ctrl-e>", "open-editor", "insert")

c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}', 
    'am': 'https://www.amazon.com/s?k={}', 
    'aw': 'https://wiki.archlinux.org/?search={}', 
    'goog': 'https://www.google.com/search?q={}', 
    'hoog': 'https://hoogle.haskell.org/?hoogle={}', 
    're': 'https://www.reddit.com/r/{}', 
    'ub': 'https://www.urbandictionary.com/define.php?term={}', 
    'wiki': 'https://en.wikipedia.org/wiki/{}', 
    'ch': 'http://cinehub24.com/search?search={}',
    'cho': 'http://primary.cinehub24.com/search/{}.aspx',
    'yt': 'https://www.youtube.com/results?search_query={}'}

# JS, cookies, encoding, headers, fonts, status-bar
c.content.autoplay = False
c.content.cookies.accept = "all"
c.content.default_encoding = "utf-8"
c.content.headers.user_agent = (
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko)"
    " Chrome/80.0.3987.163 Safari/537.36"
)
c.statusbar.widgets = ["keypress", "progress", "url", "scroll"]
c.content.javascript.can_access_clipboard = True
c.tabs.show = 'multiple'


# Starting page
c.url.default_page = "about:blank"
c.url.start_pages = "about:blank"

c.colors.completion.fg = '#e0def4'

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#191724'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#191724'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = '#c4a7e7'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = '#191724'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = '#191724'

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = '#191724'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = '#e0def4'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#191724'

# Foreground color of the matched text in the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.match.fg = '#9ccfd8'

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = '#9ccfd8'

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = '#191724'

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = '#191724'

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = '#eb6f92'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = '#ebbcba'

# Font color for the matched part of hints.
# Type: QtColor
c.colors.hints.match.fg = '#9ccfd8'

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = '#191724'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#191724'

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = '#31748f'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#191724'

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = '#191724'

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = '#191724'

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = '#E5C075'

# Background color of the tab bar.
c.colors.tabs.bar.bg = '#191724'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#191724'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#191724'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#191724'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#191724'

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = '#191724'

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = '#282C34'

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = '#191724'

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = '#191724'


# Tab padding
c.tabs.indicator.width = 1
c.tabs.favicons.scale = 1
