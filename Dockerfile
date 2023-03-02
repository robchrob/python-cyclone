FROM alpine:latest

RUN apk add --no-cache\
        curl bash alpine-sdk expat-dev openssl-dev zlib-dev\
        ncurses-dev bzip2-dev xz-dev sqlite-dev libffi-dev tcl-dev\
        linux-headers gdbm-dev readline-dev !gettext-dev

RUN curl https://pyenv.run | bash
RUN cd /root/.pyenv/plugins/python-build/../.. && git pull && cd -
ENV PATH /root/.pyenv/bin:/root/.pyenv/shims:$PATH
RUN eval "$(pyenv init -)"

RUN pyenv install 3.12:latest
RUN pyenv global 3.12-dev

RUN pip install --upgrade pip tox
RUN pip install -r requirements.txt

COPY . /app
WORKDIR /app

RUN pip install -e .

ENTRYPOINT ["python", "-m", "crzycoder"]
