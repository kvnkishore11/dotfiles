# Configuration Documentation Rules

## When Making Configuration Changes

1. **Update the specific config folder's changelog.md** with date, what changed, why, and commit hash
2. **Update the specific config folder's document.md** if keybindings or features change
3. **Document issues and solutions** in the changelog under a "Troubleshooting" or "Issues Resolved" section
4. **Include root cause** of any issue so future occurrences can reference the fix

## Issue Documentation Format

When an issue is solved, add to relevant changelog.md:
```
### [Date] - Issue: Brief description
**Problem:** What went wrong
**Root Cause:** Why it happened
**Solution:** How it was fixed
**Commit:** hash
```

## Config Folders with Documentation

- `tmux/` → changelog.md, document.md
- `wezterm/` → (create if needed)
- `nvim/` → (create if needed)
- Other configs → create changelog.md and document.md as needed
