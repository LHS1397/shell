FROM python:3

WORKDIR /home/lovish/shell

COPY . .

CMD [ "python", "test.py" ]
