import { ReadStream } from 'flotjs';

export class Slider {

    private _stream: ReadStream;


    constructor(public datas: any[]) {
        this._stream = ReadStream.on(datas);
    }

    public previous(): any {

        if (this._stream.position === -1) {
            this._stream.setToEnd();
            return this._stream.contents[this._stream.position - 1];
        }

        if (this._stream.atEnd()) {
            this._stream.reset();
            return this._stream.next;
        }

        this._stream.setPosition(this._stream.position - 1);

        return this._stream.contents[this._stream.position];
    }

    public next(): any {

        if (this._stream.atEnd()) {
            this._stream.reset();
            return this._stream.next;
        }

        return this._stream.next;
    }

    public elementAt(n: number) {
        return this._stream.contents[n];
    }
}
