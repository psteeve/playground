import { PositionableStream, streamOn } from 'flotjs';

export function format(text: string, spec: Record<string, (stream: PositionableStream) => unknown>) {
    const response: Record<string, unknown> = {};
    const stream = streamOn(text);

    Object.keys(spec)
        .forEach(key => {
            response[key] = spec[key](stream);
        });

    return response;
}
