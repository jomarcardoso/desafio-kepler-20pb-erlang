-module(atomo).
-export([startAtomo/3]).

startAtomo(Type, Time, PidKepler) ->
    String = "Atomo do tipo " ++ Type,
    String2 = String ++ " começou a esperar por ",
    String3 = String2 ++ integer_to_list(Time),
    String4 = String3 ++ " segundos.~n",
    io:format(String4),

    timer:sleep(Time * 1000),

    String5 = "Atomo do tipo " ++ Type,
    String6 = String5 ++ " terminou de esperar.~n",
    io:format(String6),

    if
        Type == "H" ->
            PidKepler ! {"H"};
        Type == "O" ->
            PidKepler ! {"O"}
    end.
