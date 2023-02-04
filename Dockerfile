FROM alpine:latest

#RUN apk add --no-cache\
#        curl bash alpine-sdk expat-dev openssl-dev zlib-dev\
#        ncurses-dev bzip2-dev xz-dev sqlite-dev libffi-dev tcl-dev\
#        linux-headers gdbm-dev readline-dev !gettext-dev
#

RUN apk add curl bash git patch gcc g++ make zlib-dev

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

COPY ./requirements.txt .

RUN pyenv global 3.7.15
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN pyenv global 3.8.15
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN pyenv global 3.9.15
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN pyenv global 3.10.8
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN pyenv global 3.11.0
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN pyenv global 3.12.0a2
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install "tox<4"

RUN pyenv local 3.7.15 3.8.15 3.9.15 3.10.8 3.11.0 3.12.0a2

COPY . /app
WORKDIR /app

RUN tox
