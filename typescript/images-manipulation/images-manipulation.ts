const myImage = new Image();

myImage.src = '9B404173-AB8C-4B96-95FB-E77CE9CC8079.jpeg'

myImage.addEventListener('load', function() {
    const canvas = document.getElementById('canvas1') as HTMLCanvasElement;

    const ctx = (canvas as HTMLCanvasElement)?.getContext('2d');

    canvas.width = 500;
    canvas.height = 706;

    ctx?.drawImage(myImage, 0, 0, canvas.width, canvas.height);

    const pixels = ctx?.getImageData(0, 0, canvas.width, canvas.height);
    console.log(pixels);

    let particlesArray: Particle[] = [];

    const numberOfParticules = 5000;

    let mappedImage = [];

    class Particle {
        private x: number;
        private y: number;
        private speed: number;
        private size: number;
        private velocity: number;

        constructor() {
            this.x = Math.random() * canvas.width;
            this.y = 0;
            this.speed = 0;
            this.size = Math.random() * 1.5 + 1;
            this.velocity = Math.random() * 3.5;
        }

        update() {
            this.y += this.velocity;
            if (this.y >= canvas.height) {
                this.y = 0;
                this.x = Math.random() * canvas.width;
            }
        }

        draw() {

            if (ctx) {
                ctx.beginPath();
                ctx.fillStyle = 'white';
                ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
                ctx.fill();
            }
        }
    }

    function init() {
        for (let i = 0; i < numberOfParticules; i++) {
            particlesArray.push(new Particle);
        }
    }

    init();

    function animate() {
        ctx?.drawImage(myImage, 0, 0, canvas.width, canvas.height);
        if (ctx) {
            ctx.globalAlpha = 0.05;

            ctx.fillStyle = 'rgb(0, 0, 0)';

            ctx.fillRect(0, 0, canvas.width, canvas.height);
            const length = particlesArray.length;

            for (let i = 0; i < length; i++) {
                particlesArray[i].update();
                particlesArray[i].draw();
            }

            requestAnimationFrame(animate);
        }
    }

    animate();
});

