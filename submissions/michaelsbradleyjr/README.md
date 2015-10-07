# Run locally

Clone this repository if you have not yet done so.

```bash
git clone https://github.com/staltz/flux-challenge.git
```

Then run the following commands in a terminal.

```bash
cd flux-challenge/server && npm install . && npm start
```

Now startup a static web server in another terminal, e.g. using the
[http-server](https://github.com/indexzero/http-server) utility.

```bash
cd flux-challenge && http-server -p 5000
```

Finally, open this submissions's
[index.html](http://localhost:5000/submissions/michaelsbradleyjr/index.html) in
your browser.

*May the Force be with you!*

# Development

First [install Elm](http://elm-lang.org/install). If you're on a mac, you can
use [homebrew-cask](http://caskroom.io/).

```bash
brew cask install elm-platform
```

Copy the stylesheet into place and fire up
[Elm Reactor](https://github.com/elm-lang/elm-reactor), which is installed as
part of the [Elm Platform](https://github.com/elm-lang/elm-platform).

```bash
cd flux-challenge/submissions/michaelsbradleyjr && \
   cp ../../styles.css ./ && \
   elm-reactor
```

Now load [Main.elm](http://localhost:8000/Main.elm) in your browser;
alternatively, you can enter the Reactor's
[debug environment](http://localhost:8000/Main.elm?debug).
