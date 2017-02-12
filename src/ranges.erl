-module(ranges).

%% API
-export([get_all_points/1]).


-spec get_all_points(Range :: binary()) ->
    tuple().
get_all_points(<<"[]">>) ->
    {};
get_all_points(<<"[", Number, "]">>) ->
    {binary_to_integer(<<Number>>)}.
