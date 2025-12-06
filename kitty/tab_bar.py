# Custom tab bar for Kitty - Rounded pill style tabs
# Inspired by popular terminal aesthetics

from kitty.boss import get_boss
from kitty.fast_data_types import Screen, add_timer, get_options
from kitty.utils import color_as_int
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    Formatter,
    TabBarData,
    as_rgb,
    draw_attributed_string,
    draw_title,
)
from datetime import datetime

opts = get_options()

# Powerline symbols
ICON = "  "  # Terminal icon
LEFT_SEP = ""
RIGHT_SEP = ""

# Colors - will be blended with your theme
COLORS = {
    "active": "#83c092",      # Green for active tab
    "inactive": "#415c6d",    # Muted blue for inactive
    "special": "#f9c859",     # Yellow accent
    "pink": "#f48fb1",        # Pink accent
    "blue": "#7dc4e4",        # Blue accent
    "peach": "#fab387",       # Peach accent
    "bg": "#0a0e14",          # Background
    "fg_dark": "#0a0e14",     # Dark foreground (for contrast on colored bg)
}

# Color palette for tabs (cycles through these)
TAB_COLORS = ["#83c092", "#7dc4e4", "#f9c859", "#f48fb1", "#fab387", "#b4befe"]

def _get_color(color_str):
    """Convert hex color to RGB int."""
    color_str = color_str.lstrip('#')
    return int(color_str, 16)

def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    """Draw a single tab with rounded style."""

    # Get colors based on active state
    if tab.is_active:
        bg_color = _get_color(COLORS["active"])
        fg_color = _get_color(COLORS["fg_dark"])
    else:
        # Cycle through colors for inactive tabs
        color_index = (index - 1) % len(TAB_COLORS)
        bg_color = _get_color(TAB_COLORS[color_index])
        fg_color = _get_color(COLORS["fg_dark"])

    # Default background
    default_bg = _get_color(COLORS["bg"])

    # Draw left separator (rounded left edge)
    screen.cursor.bg = default_bg
    screen.cursor.fg = bg_color
    screen.draw(LEFT_SEP)

    # Draw tab content
    screen.cursor.bg = bg_color
    screen.cursor.fg = fg_color

    # Get title - use process name or tab title
    title = tab.title if tab.title else "shell"
    # Truncate and clean up title
    if len(title) > 12:
        title = title[:12]

    # Draw index and title with spacing
    tab_content = f" {index}:{title} "
    screen.draw(tab_content)

    # Draw right separator (rounded right edge)
    screen.cursor.bg = default_bg
    screen.cursor.fg = bg_color
    screen.draw(RIGHT_SEP)

    # Add space between tabs
    screen.cursor.bg = default_bg
    screen.cursor.fg = default_bg
    screen.draw(" ")

    return screen.cursor.x

def draw_tab_with_powerline(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    """Alternative powerline style."""
    return draw_tab(draw_data, screen, tab, before, max_title_length, index, is_last, extra_data)
