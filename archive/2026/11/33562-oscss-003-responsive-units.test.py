"""Browser-level CSS units assertions for OSCSS.003. Requires Playwright and Chromium."""
from pathlib import Path
from math import isclose
from playwright.sync_api import sync_playwright

lab_html = Path(__file__).with_name('33562-oscss-003-responsive-units.lab.html').read_text(encoding='utf-8')
checks = []

def verify(condition, label):
    assert condition, label
    checks.append(label)

with sync_playwright() as browser_tool:
    browser = browser_tool.chromium.launch(headless=True, executable_path='/usr/bin/chromium', args=['--no-sandbox'])
    for width, expected_heading in [(390, 28), (1280, 48)]:
        page = browser.new_page(viewport={'width': width, 'height': 800}, device_scale_factor=1)
        page.set_content(lab_html, wait_until='load')
        metrics = page.evaluate('''() => {
          const el = sel => document.querySelector(sel);
          const rect = sel => el(sel).getBoundingClientRect();
          const style = sel => getComputedStyle(el(sel));
          const percent = el('.sample-percent');
          const parentContentWidth = rect('.card[data-unit="percent"]').width -
            parseFloat(style('.card').paddingLeft) - parseFloat(style('.card').paddingRight) -
            parseFloat(style('.card').borderLeftWidth) - parseFloat(style('.card').borderRightWidth);
          return {
            root: parseFloat(style(':root').fontSize), heading: parseFloat(style('h1').fontSize),
            viewport: window.innerWidth, scrollWidth: document.documentElement.scrollWidth,
            pixel: rect('.sample-px').width, pixelParent: rect('.card[data-unit="px"]').width,
            percent: rect('.sample-percent').width, parentContentWidth,
            remText: parseFloat(style('.sample-rem').fontSize),
            emPadding: parseFloat(style('.sample-rem').paddingLeft),
            viewportBox: rect('.sample-vw').width, viewportParent: rect('.card[data-unit="vw"]').width
          };
        }''')
        verify(isclose(metrics['root'], 16, abs_tol=0.01), f'root baseline {width}')
        verify(isclose(metrics['heading'], expected_heading, abs_tol=0.1), f'clamp heading {width}')
        verify(metrics['scrollWidth'] <= width, f'no document horizontal overflow {width}')
        verify(metrics['pixel'] <= 200.1, f'pixel box capped at 200px {width}')
        verify(isclose(metrics['percent'], metrics['parentContentWidth'] * .60, abs_tol=1), f'percentage width {width}')
        verify(isclose(metrics['remText'], 20, abs_tol=0.1), f'1.25rem font {width}')
        verify(isclose(metrics['emPadding'], 20, abs_tol=0.1), f'1em padding tracks own font {width}')
        verify(metrics['viewportBox'] <= width * .5 + .1, f'50vw capped {width}')
        verify(metrics['viewportBox'] <= metrics['viewportParent'], f'vw box fits card {width}')
        if width == 1280:
            page.screenshot(path=str(Path(__file__).with_name('33562-oscss-003-responsive-units.desktop.png')), full_page=True)
        else:
            page.screenshot(path=str(Path(__file__).with_name('33562-oscss-003-responsive-units.mobile.png')), full_page=True)
        if width == 390:
            page.evaluate("document.documentElement.style.fontSize='20px'")
            after = page.evaluate('''() => ({rem:parseFloat(getComputedStyle(document.querySelector('.sample-rem')).fontSize), heading:parseFloat(getComputedStyle(document.querySelector('h1')).fontSize)})''')
            verify(isclose(after['rem'], 25, abs_tol=.1), 'root font scales rem')
            verify(isclose(after['heading'], 35, abs_tol=.2), 'root font changes clamp minimum')
        page.close()
    browser.close()

print(f'{len(checks)} CSS browser checks passed: 390px and 1280px viewports')
