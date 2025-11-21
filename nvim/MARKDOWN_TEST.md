# Main Document Title (H1)

This is a paragraph with normal text. Notice how the H1 above has borders and bright color to simulate "larger" size. All text has proper spacing for readability.

## Major Section (H2)

Second-level headings are slightly less prominent but still bold and have borders. The color brightness creates visual hierarchy even though font size can't change in terminal.

### Subsection (H3)

Third-level headings are lighter and not bold. They're clearly subordinate to H2.

#### Minor Heading (H4)

Even more subtle, using gray tones.

---

## Features Demo

### Lists

- First level bullet (simple dot)
  - Second level (hollow circle)
    - Third level (small square)
      - Fourth level (hollow square)

### Tasks

- [ ] Unchecked task
- [x] Completed task
- [-] In-progress task

### Code Blocks

```python
def hello_world():
    """Clean code block with subtle borders."""
    print("Notice the padding and clean design!")
    return True
```

Inline code looks like `this.cleanStyle()` without overwhelming styling.

### Tables

| Feature | Before | After |
|---------|--------|-------|
| Backgrounds | Many colors | Clean |
| Spacing | Cramped | Generous |
| Hierarchy | Confusing | Clear |

### Quotes

> This is a blockquote with a clean side bar.
> It looks like web-style blockquotes.
> Notice the subtle indicator on the left.

### Links

- Web link: [Example](https://example.com) 🌐
- Email: <user@example.com> ✉
- Image: ![Alt text](image.png) 🖼

---

## What Makes This Clean?

1. **No background colors** - just foreground hierarchy
2. **Strategic borders** - H1/H2 get underlines for "weight"
3. **Color brightness** - simulates size (bright = "large")
4. **Generous spacing** - breathing room everywhere
5. **Minimal icons** - not overwhelming

Compare this to typical markdown rendering and notice:
- Less visual noise
- Clearer document structure
- More readable long-form content
- Web-like feel inside terminal

---

## Technical Notes

Since terminal Neovim cannot change actual font sizes, we achieve visual hierarchy through:

- **Color intensity**: H1 bright → H6 subtle
- **Bold weight**: H1-H2 bold, H3-H6 normal
- **Borders**: H1-H3 get decorative lines
- **Spacing**: Consistent padding throughout

This creates the *perception* of different sizes without requiring GUI Neovim!
