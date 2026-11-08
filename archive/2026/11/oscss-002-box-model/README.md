# OSCSS.002 — The CSS Box Model

A standalone, browser-ready learning lab: CSS content, padding, border, margin, and box-sizing. All information is original educational sample data; no production interface is represented.

## Run the page
Open \`box-model-lab.html\` in a modern web browser. It has no JavaScript, external dependencies, network calls, or user-supplied content.

## Actual browser layout QA
The authoring system used Python 3.13, Playwright and local Chromium to execute the test file. Recorded result: **PASS: 24 Chromium layout checks** at 1280×850 and 360×780 viewports.

To reproduce:
\`\`\`bash
python -m pip install playwright
python -m playwright install chromium
python verify-box-model.py
\`\`\`
The test script uses \`shutil.which("chromium")\` if an OS Chromium executable is available, otherwise Playwright's installed Chromium. On restricted machines, a browser launcher policy may need adjustment. Do not disable your organization's browser security protections merely to run a demo.

### Measured values
- \`#content-example\`: content width 240px + 20px left/right padding + 4px left/right border = **288px border-edge width**, 144px border-edge height.
- \`#border-example\`: declared border-box width **240px**, height **144px**, with 192px content width.
- Adjacent in-flow block margins 24px bottom + 12px top collapse to **24px measured vertical gap**.
- No page-wide horizontal overflow at mobile viewport 360px; each comparison has a keyboard-focusable scrolling region if required.

## Boundaries
The checks confirm computed dimensions and basic desktop/mobile layout, not full WCAG certification, cross-browser compatibility, accessibility with every screen reader, or site-level Gutenberg rendering. No user data, system settings, or real equipment is accessed.

**Sources:** MDN CSS Box Model; MDN box-sizing; MDN Margin Collapsing.
