"""OSCSS.002 headless Chromium layout QA; needs Python Playwright and Chromium.

This test performs actual browser layout checks, not just text matching.
Install locally: python -m pip install playwright; python -m playwright install chromium
Run: python verify-box-model.py
"""
from pathlib import Path
import shutil
from playwright.sync_api import sync_playwright

HTML = Path(__file__).with_name("box-model-lab.html").resolve().as_uri()

checks = 0

def check(label, actual, expected):
    global checks
    if actual != expected:
        raise AssertionError(f"{label}: expected {expected!r}, got {actual!r}")
    checks += 1

def geometry(page, locator):
    return page.locator(locator).evaluate("e => { const r=e.getBoundingClientRect(); const s=getComputedStyle(e); return {width:r.width,height:r.height,padding:s.paddingLeft,border:s.borderLeftWidth,margin:s.marginTop,box:s.boxSizing}; }")

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True, executable_path=shutil.which("chromium") or None, args=["--no-sandbox", "--disable-gpu"])
    desktop = browser.new_page(viewport={"width": 1280, "height": 850}, device_scale_factor=1)
    desktop.set_content(Path(__file__).with_name("box-model-lab.html").read_text(encoding="utf-8"))
    check("HTML language", desktop.locator("html").get_attribute("lang"), "en")
    check("document heading", desktop.locator("h1").inner_text(), "OSCSS.002 — The CSS Box Model")
    check("example panel count", desktop.locator(".panel").count(), 2)
    check("content width", geometry(desktop, "#content-example")["width"], 288)
    check("content height", geometry(desktop, "#content-example")["height"], 144)
    check("content box sizing", geometry(desktop, "#content-example")["box"], "content-box")
    check("content padding", geometry(desktop, "#content-example")["padding"], "20px")
    check("content border", geometry(desktop, "#content-example")["border"], "4px")
    check("border box width", geometry(desktop, "#border-example")["width"], 240)
    check("border box height", geometry(desktop, "#border-example")["height"], 144)
    check("border box sizing", geometry(desktop, "#border-example")["box"], "border-box")
    check("border box padding", geometry(desktop, "#border-example")["padding"], "20px")
    check("margin collapse gap", desktop.locator("#margin-two").bounding_box()["y"] - (desktop.locator("#margin-one").bounding_box()["y"] + desktop.locator("#margin-one").bounding_box()["height"]), 24)
    check("no desktop horizontal page overflow", desktop.evaluate("document.documentElement.scrollWidth <= innerWidth"), True)
    check("no external scripts", desktop.locator("script[src]").count(), 0)
    check("no externally loaded CSS", desktop.locator("link[rel=stylesheet]").count(), 0)
    check("has keyboard focusable scroll regions", desktop.locator('.viewport[tabindex="0"]').count(), 2)
    check("example region aria labels", desktop.locator(".viewport[aria-label]").count(), 2)

    mobile = browser.new_page(viewport={"width": 360, "height": 780}, device_scale_factor=1)
    mobile.set_content(Path(__file__).with_name("box-model-lab.html").read_text(encoding="utf-8"))
    check("mobile no page-wide overflow", mobile.evaluate("document.documentElement.scrollWidth <= innerWidth"), True)
    check("mobile content width remains 288", geometry(mobile, "#content-example")["width"], 288)
    check("mobile border width remains 240", geometry(mobile, "#border-example")["width"], 240)
    check("mobile panels stack", mobile.locator(".panel").nth(1).bounding_box()["y"] > mobile.locator(".panel").nth(0).bounding_box()["y"], True)
    check("mobile no external requests", mobile.locator("img[src], iframe[src], script[src]").count(), 0)
    check("margin gap on mobile", mobile.locator("#margin-two").bounding_box()["y"] - (mobile.locator("#margin-one").bounding_box()["y"] + mobile.locator("#margin-one").bounding_box()["height"]), 24)

    # Export one reproducible browser screenshot of the authored exercise.
    desktop.screenshot(path=str(Path(__file__).with_name("oscss-002-chromium-example.png")), full_page=True)
    browser.close()

print(f"PASS: {checks} Chromium layout checks")
