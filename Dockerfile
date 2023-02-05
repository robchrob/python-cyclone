FROM alpine:latest

RUN apk add --no-cache\
        curl bash alpine-sdk expat-dev openssl-dev zlib-dev\
        ncurses-dev bzip2-dev xz-dev sqlite-dev libffi-dev tcl-dev\
        linux-headers gdbm-dev readline-dev !gettext-dev

RUN curl https://pyenv.run | bash
RUN cd /root/.pyenv/plugins/python-build/../.. && git pull && cd -
ENV PATH /root/.pyenv/bin:/root/.pyenv/shims:$PATH
RUN eval "$(pyenv init -)"

RUN pyenv install 3.7:latest
RUN pyenv install 3.8:latest
RUN pyenv install 3.9:latest
RUN pyenv install 3.10:latest
RUN pyenv install 3.11:latest
RUN pyenv install 3.12:latest

RUN pyenv global 3.12.0a4

RUN pip install --upgrade pip tox

RUN pyenv local 3.7.16 3.8.16 3.9.16 3.10.9 3.11.1 3.12.0a4

COPY . /app
WORKDIR /app
RUN tox -v -p

RUN pip install -r requirements.txt
RUN pip install -e .[dev]

CMD ["python", "-m", "app"]
