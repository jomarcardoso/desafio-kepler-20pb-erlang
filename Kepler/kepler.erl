-module(kepler).
-export([startKepler/1]).
-import(produtor, [startProdutor/2]).

loop() ->
    receive
        {Type} ->
            String = "Atomo do tipo " ++ Type,
            io:format(String ++ " recebido.~n"),
            loop()
    end.


startKepler(Interval) ->
    spawn(produtor, startProdutor, [Interval, self()]),
    
    loop().