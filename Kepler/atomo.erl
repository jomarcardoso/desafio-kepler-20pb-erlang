-module(atomo).
-export([startAtomo/3]).

startAtomo(Type, Time, PidKepler) ->
    io:format("Atomo do tipo ~p comecou a esperar por ~p segundos.~n", [Type, integer_to_list(Time)]),

    timer:sleep(Time * 1000),

    io:format("Atomo do tipo ~p terminou de esperar.~n", [Type]),

    PidKepler ! {Type}.
