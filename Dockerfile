FROM python:3.9-alpine

WORKDIR /app/

COPY ./ /app/

RUN apk update && apk add --no-cache alpine-sdk \ 
                                     python3-dev \
                                     libffi-dev \
                                     openssl-dev \
                        && rm -rf /var/cache/apk/*

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r /app/requirements.txt

COPY . .

CMD ["python3 -m forwarder"]
