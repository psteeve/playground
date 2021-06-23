"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const puppeteer_1 = __importDefault(require("puppeteer"));
function run() {
    return new Promise(async (resolve, reject) => {
        try {
            const browser = await puppeteer_1.default.launch();
            const page = await browser.newPage();
            var args = process.argv[2];
            await page.goto("https://www.sexemodel.com/?stage=1");
            await page.click('a.save');
            await page.click('a[href^="/profiles/search_box/0/gender/f/"]');
            //            await page.type('#search', args)
            //            await page.keyboard.press('Enter');
            await page.screenshot({ path: 'sample.png' });
            let urls = await page.evaluate(() => {
                let results = [];
                let items = document.querySelectorAll('#product-list-back li');
                items.forEach((item) => {
                    let name = item.querySelector('h3 a').innerText;
                    let price = item.querySelector('span.amount').innerText;
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
        }
        catch (err) {
            return reject(err);
        }
    });
}
run().then(console.log).catch(console.error);
