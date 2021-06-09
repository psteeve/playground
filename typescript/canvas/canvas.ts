window.onload = () => {
    const canvas: HTMLCanvasElement = document.getElementById('canvas') as HTMLCanvasElement;

    if (canvas.getContext) {
        const context = canvas.getContext('2d');

        console.log(context);

    }

}
