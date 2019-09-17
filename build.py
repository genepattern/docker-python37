import asyncio


async def test_pandas():
    import pandas as pd


async def test_ipython():
    import IPython as ipy


async def test_pyppeteer():
    print('Opening Browser')
    from pyppeteer import launch
    browser = await launch({'args': ['--no-sandbox']})
    page = await browser.newPage()
    await page.setViewport({'width': 1200, 'height': 1000})


async def test_imports():
    print('Testing imports for build')
    await test_pyppeteer()
    await test_pandas()
    await test_ipython()


asyncio.get_event_loop().run_until_complete(test_imports())
