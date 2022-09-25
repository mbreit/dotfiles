FROM debian AS base

RUN groupadd app && useradd -g app -m app

RUN apt-get update && apt-get install sudo && echo app ALL=\(root\) NOPASSWD:ALL >> /etc/sudoers

USER app

FROM base

COPY --chown=app:app . /home/app/dotfiles

WORKDIR /home/app/dotfiles

RUN ./bootstrap-devcontainer.sh

ENV SHELL=/usr/bin/fish

CMD /usr/bin/fish
