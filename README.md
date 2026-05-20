# SDDM NetLogin Themes

Customized [NetLogin](https://pling.com/p/2225131/) SDDM themes with zero external dependencies.

## Variants

### NetLogin-build (Blue)

- Text color: default blue (`#3daee9`)
- All PNGs use original colors
- Dependencies removed: no Qt/Plasma/KDE imports, only `QtQuick 2.0`

### NetLogin-build-red (Red)

- Fork of `NetLogin-build`
- Text color: `#ff0000`
- 24 PNGs recolored to red hue via ImageMagick (`-colorspace gray -fill red -tint 100`)
- Excludes files with "white", "textbox", or "warning" in the name

## Features

### Zero Dependencies

All SddmComponents (`TextInputBox`, `PasswordInputBox`, `TextConstants`) are replaced with self-contained QML implementations. No Qt, Plasma, or KDE libraries required beyond `QtQuick 2.0`.

### Background Switcher

- Cycle through wallpapers via the **Background** button in the login panel
- Image list read from `theme.conf` → `backgrounds=` config key
- Selection persisted across SDDM restarts via `QtQuick.LocalStorage` (SQLite)
- **Background button is hidden** when only 0 or 1 images are configured

### Marquee Menu Labels

- Menu items with labels longer than ~30 characters scroll horizontally on hover
- Pause 2s → scroll → pause 2s → scroll back
- Clips overflow, resets on mouse exit

### PIN Mode

- Toggle between Password and PIN entry via the padlock/key icon beside the textbox
- PIN mode restricts input to digits only
- Label switches to `"PIN:"`
- PIN toggle hidden when username field is active
- PAM validation at system level (`pam_exec.so` → `/usr/local/bin/pam_pin_auth`)
- Icon toggles: padlock (password mode) / key (PIN mode)

### Caps Lock Warning

- Warning icon + tooltip shown when Caps Lock is active
- Tracks Caps Lock state locally via key events (no SddmComponents dependency)

### On-Screen Keyboard

- Toggle via keyboard icon (`⌨`) at bottom-left
- **Password mode**: QWERTY letter keys + Shift + Backspace + Space
- **PIN mode**: numeric keypad (0–9) + Backspace
- Keyboard mode switches automatically when PIN mode is toggled
- Semi-transparent keys with hover highlight
- No background panel

## File Structure

```
theme/
├── Main.qml              Entry point, background switching, persistence
├── Login.qml             Username/password/PIN fields, PIN toggle, Caps Lock tracking
├── CentralButtons.qml    Session / Background / Layout buttons
├── BottomButtons.qml     Power action buttons (Hibernate, Suspend, Reboot, Shutdown)
├── ButtonGreen.qml       Bottom button component
├── ButtonWhite.qml       Center button component
├── MenuList.qml          Generic popup menu
├── MenuItem.qml          Menu item with marquee scrolling
├── Datetime.qml          Hostname + date/time display
├── TextConstants.qml     Localized strings
├── TextInputBox.qml      Text input field (standalone replacement)
├── PasswordInputBox.qml  Password input with caps lock warning
├── OSK.qml               On-screen keyboard (letter and numeric modes)
├── OSKKey.qml            Keyboard key component
├── theme.conf            Configuration (background, backgrounds, dateFormat)
├── metadata.desktop      Theme metadata
├── images/               UI slice PNGs
├── icons/                Key, padlock, arrow, avatar icons
└── backgrounds/          Wallpaper images + scan.sh helper
```

## Quick Start

1. Copy the theme to SDDM themes directory:
   ```sh
   sudo cp -r NetLogin-build-red /usr/share/sddm/themes/
   ```

2. Set it as the current theme in `/etc/sddm.conf`:
   ```ini
   [Theme]
   Current=NetLogin-build-red
   ```

3. Restart SDDM or switch to a new TTY to test.

## Configuration

Edit `theme.conf`:

```ini
[Theme]
background="backgrounds/wallpaper.jpg"
backgrounds="img1.jpg,img2.jpg,img3.png"
dateFormat="yyyy-MM-dd"
```

- `background` — default wallpaper
- `backgrounds` — comma-separated list for the background switcher
- `dateFormat` — Qt date format string

Run `backgrounds/scan.sh` to regenerate the `backgrounds=` line from all files in the folder.

## License

Original NetLogin theme by [schniz](https://www.pling.com/p/2225131/). Customizations are provided as-is.
