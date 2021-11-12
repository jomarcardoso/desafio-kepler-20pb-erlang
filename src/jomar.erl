-module(jomar).
-export([start/0]).
  geraOxigenio() ->
		Value = (rand:uniform(20) + 10),
		timer:sleep(Value * 1000),
		Oxigenio = "oxigenio" + Value,
		io:format("oxigênio com energia suficiente~n", [Oxigenio]),
		Oxigenio.
  geraHidrogenio() ->
		timer:sleep((rand:uniform(20) + 10) * 1000)
		io:format("hidrogênio com energia suficiente~n", []).
	start() ->
		oxigenio_PID = spawn(jomar, geraOxigenio, []),
    hidogenio_PID = spawn(jomar, geraHidrogenio, []).