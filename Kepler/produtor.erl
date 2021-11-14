-module(produtor).
-export([startProdutor/2]).
-import(atomo, [startAtomo/3]).

random(Min, Max) ->
    Result = round(rand:uniform(Max - Min) + Min),
    Result.

startProdutor(Interval, PidKepler) ->
    Time = random(10, 30),
    Type = round(rand:uniform(2)),

    if
        Type == 1 ->
            spawn(atomo, startAtomo, ["H", Time, PidKepler]);
        Type == 2 ->
            spawn(atomo, startAtomo, ["O", Time, PidKepler])
    end,

    timer:sleep(Interval),

    startProdutor(Interval, PidKepler).