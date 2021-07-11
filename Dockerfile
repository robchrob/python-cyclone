FROM alpine:latest

RUN apk add --no-cache\
        curl bash alpine-sdk expat-dev openssl-dev zlib-dev\
        ncurses-dev bzip2-dev xz-dev sqlite-dev libffi-dev tcl-dev\
        linux-headers gdbm-dev readline-dev !gettext-dev

RUN curl https://pyenv.run | bash
RUN cd /root/.pyenv/plugins/python-build/../.. && git pull && cd -
ENV PATH /root/.pyenv/bin:/root/.pyenv/shims:$PATH
RUN eval "$(pyenv init -)"

RUN pyenv install 3.7.11
RUN pyenv install 3.8.11
RUN pyenv install 3.9.6
RUN pyenv local 3.7.11 3.8.11 3.9.6

COPY requirements*.txt /app/
RUN pip install -r /app/requirements-tools.txt
RUN pip install -r /app/requirements-linter.txt

COPY . /app
WORKDIR /app

RUN tox -p
