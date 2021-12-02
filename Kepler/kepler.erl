-module(kepler).
-export([startKepler/1]).
-import(produtor, [startProdutor/2]).

loop(State) ->
    receive
        {Type} ->
            io:format("Atomo do tipo ~p recebido.~n", [Type]),

            Increment = fun(X) -> X + 1 end, 
            NewState = maps:update_with(Type, Increment, 1, State),

            io:format("~p~n", [maps:to_list(NewState)]),

            CanCreate = verifyIfCanCreateMolecules(NewState),

            if
                CanCreate == true ->
                    io:format("Deu pra criar molecula.~n"),

                    DecrementH = fun(H) -> H - 2 end,
                    DecrementO = fun(O) -> O - 1 end,
                    Contador = fun(C) -> C + 1 end,
                    NewMapH = maps:update_with("H", DecrementH, NewState),
                    NewMapO = maps:update_with("O", DecrementO, NewMapH),
                    NewMapContador = maps:update_with("Moleculas Formadas", Contador, 1, NewMapO),

                    io:format("~p~n", [maps:to_list(NewMapContador)]),
                    
                    loop(NewMapContador);
                true ->
                    io:format("Ainda nao deu pra criar molecula.~n"),
                    loop(NewState)
            end
    end.

verifyIfCanCreateMolecules(Map) ->
    Length = length(maps:keys(Map)),

    if
        Length >= 2 ->
            HydrogenNumber = maps:get("H", Map),
            OxygenNumber = maps:get("O", Map),

            if
                (HydrogenNumber >= 2) and (OxygenNumber >= 1) ->
                    CanCreate = true;
                true ->
                    CanCreate = false
            end;
        true ->
            CanCreate = false
    end,
    CanCreate.

startKepler(Interval) ->
    spawn(produtor, startProdutor, [Interval, self()]),
    
    loop(maps:new()).