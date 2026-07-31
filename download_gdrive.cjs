const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

const files = [
    { name: 'IMG_3785.jpg', id: '1aXE-WEJ4MYZAH5fbU29Sw8Y8JYjdR_Ju' },
    { name: 'IMG_3786.jpg', id: '1M7A57yg8lriqlZlO9SaJiOBJ_5Mxuyk2' },
    { name: 'IMG_3788.jpg', id: '1fDdIoCM9GDTMHg4HLBFDJLPvOzaKZCJ2' },
    { name: 'IMG_3789.jpg', id: '1r1bZlYjBldt65gr8o2l5M3fftNKtWzRC' },
    { name: 'IMG_3790.jpg', id: '1_zVNF5WEht6uQAmH2YNTg5i74ioJErCr' },
    { name: 'IMG_3791.jpg', id: '1HrrmWiX4auT7ktqHoh8KuA30anh4saIm' },
    { name: 'IMG_3792.jpg', id: '10qnbXxCoDWLLxSZyfewqGgGNH4K-T7H8' },
    { name: 'IMG_3793.jpg', id: '1OOZFYuqXQugF8566-VGOJDNLRFhvCZQc' },
    { name: 'IMG_3795.jpg', id: '1DtJ2uCRX44uKhuWJI2UmhE13dkaL2MW9' },
    { name: 'IMG_3796.jpg', id: '1NsbcUT2xYLIVlu42XXEfPT9-34TlmQeF' },
    { name: 'IMG_3797.jpg', id: '1pLii13j32m3q1nBg7mNyDQ3VCRcahpR9' },
    { name: 'IMG_3798.jpg', id: '1Z3SB7Irj_wlBKeqKi7ORNmH8ROh73A7-' },
    { name: 'IMG_3799.jpg', id: '1g8rkMNx-R1PNkrQbBU2p0UJxqzacnKyf' },
    { name: 'IMG_3800.jpg', id: '1Mw0ReLizC3dQS9zNT7X70BB6hQ8_8BOZ' },
    { name: 'IMG_3802.jpg', id: '1rX1SvqcUX1P7rtPXrLDecFy_vFasuDhi' },
    { name: 'IMG_3803.jpg', id: '1AipvtIiL0Ulh_uLFOdCTIA0E3HWLkbWE' },
    { name: 'IMG_3804.jpg', id: '1DVYJ2xZuZPasubwQRiUteuneTUwDl1yc' },
    { name: 'IMG_3805.jpg', id: '1uiXOwh28YCdU2KQPJSeJaCh96AQI1Kzq' },
    { name: 'IMG_3806.jpg', id: '1se-vh6zVJud_CJBlLAHk0x-MwLFk1U4d' },
    { name: 'IMG_3808.jpg', id: '1pRH9gB9rXqzI5eHV0cDEK286E9ePlP5g' },
    { name: 'IMG_3809.jpg', id: '1O60pKA84l_bHfAXqbUzc4WEq2Amwt-KW' },
    { name: 'IMG_3811.jpg', id: '15JkPRiiR8hKUpC2y9gBcxwLU2hQr-Oe8' },
    { name: 'IMG_3812.jpg', id: '1ALkynw2lb2g4M_wAKtb4NdPDR4BGmUjL' },
    { name: 'IMG_3813.jpg', id: '1DilNl6NDfNXFy927ar9vOhJl9dHNfRSh' },
    { name: 'IMG_6802.JPG', id: '1c12jFknrtqzZbFtPI2AZ0GJ2abckJ-4K' }
];

(async () => {
  const browser = await chromium.launch({
    executablePath: '/home/exelseries/.cache/ms-playwright/chromium-1228/chrome-linux64/chrome',
    headless: true,
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  const page = await browser.newPage();
  
  const destDir = '/home/exelseries/Documents/aniels/website/storage/app/public/imported_products';
  fs.mkdirSync(destDir, { recursive: true });

  for (const item of files) {
    console.log(`Downloading ${item.name}...`);
    try {
      await page.goto(`https://drive.google.com/file/d/${item.id}/view`, { waitUntil: 'domcontentloaded' });
      await page.waitForTimeout(3000);
      
      const imgSrc = await page.evaluate(() => {
        const imgs = Array.from(document.querySelectorAll('img'));
        const target = imgs.find(img => img.src && img.src.includes('googleusercontent.com'));
        return target ? target.src : null;
      });

      if (imgSrc) {
        // Fetch higher resolution version of googleusercontent image
        const highResUrl = imgSrc.replace(/=w\d+-h\d+/, '=w1600').replace(/=s\d+/, '=s1600');
        const response = await page.goto(highResUrl);
        const buffer = await response.body();
        const destPath = path.join(destDir, item.name);
        fs.writeFileSync(destPath, buffer);
        console.log(`SUCCESS ${item.name}: ${buffer.length} bytes (magic header: ${buffer.slice(0, 4).toString('hex')})`);
      } else {
        console.error(`No image element found on view page for ${item.name}`);
      }
    } catch (e) {
      console.error(`Failed ${item.name}: ${e.message}`);
    }
  }

  await browser.close();
})();
