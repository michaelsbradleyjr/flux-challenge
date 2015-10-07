## Run locally

First [install Elm](http://elm-lang.org/install). If you're on a mac, you can
use [homebrew-cask](http://caskroom.io/).

```bash
brew cask install elm-platform
```

Clone this repository if you have not yet done so.

```bash
git clone https://github.com/staltz/flux-challenge.git
```

Then run the following commands in a terminal.

```bash
cd flux-challenge/server && npm install . && npm start
```

In another terminal, compile the source and fire up
[Elm Reactor](https://github.com/elm-lang/elm-reactor), already installed as
part of the Elm platform.

```bash
cd flux-challenge/submissions/michaelsbradleyjr && \
   cp ../../styles.css ./ && \
   elm-make Main.elm && elm-reactor
```

Finally, open [http://localhost:8000/index.html](http://localhost:8000/index.html) in your browser.

Alternatively, you can enter the Reactor's [debug environment](http://localhost:8000/Main.elm?debug).

*May the Force be with you!*
