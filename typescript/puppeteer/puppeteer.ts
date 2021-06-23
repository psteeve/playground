import puppeteer from 'puppeteer';


function run() {
    return new Promise(async (resolve, reject) => {
        try {

            const browser = await puppeteer.launch();

            const page = await browser.newPage();

            var args = process.argv[2]

            await page.goto("https://www.croma.com/");

            await page.click('#search');

            await page.type('#search', args)

            await page.keyboard.press('Enter');

            await page.screenshot({ path: 'sample.png' });

            let urls = await page.evaluate(() => {
                let results: unknown[] = [];

                let items = document.querySelectorAll('#product-list-back li');

                items.forEach((item: Element) => {
                    let name = (item.querySelector('h3 a') as HTMLAnchorElement).innerText;

                    let price = (item.querySelector('span.amount') as HTMLSpanElement).innerText;

                    // let discount = (item.querySelector('div.listingDiscnt') as HTMLDivElement).innerText

                    results.push({
                        prod_name: name,
                        prod_price: price,
                        // prod_discount: discount
                    });

                });

                return results;

            });

            browser.close();

            return resolve(urls);

        } catch (err) {
            return reject(err);
        }

    })
}




run().then(console.log).catch(console.error);
