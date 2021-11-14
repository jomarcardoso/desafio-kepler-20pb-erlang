-module(kepler).
-export([startKepler/1]).
-import(produtor, [startProdutor/2]).

loop(State) ->
    receive
        {Type} ->
            String = "Atomo do tipo " ++ Type,
            io:format(String ++ " recebido.~n"),

            Increment = fun(X) -> X + 1 end, 
            NewState = maps:update_with(Type, Increment, 1, State),

            io:format("~p~n", [maps:to_list(NewState)]),
            loop(NewState)
    end.


startKepler(Interval) ->
    spawn(produtor, startProdutor, [Interval, self()]),
    
    loop(maps:new()).