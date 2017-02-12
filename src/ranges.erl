-module(ranges).

%% API
-export([get_all_points/1]).


-spec get_all_points(Range :: binary()) ->
    tuple().
get_all_points(Range) when is_binary(Range) ->
    TrimmedRange = binary:replace(Range, <<" ">>, <<>>),
    case parse_range(TrimmedRange) of
        {RangeStart, RangeEnd} ->
            list_to_tuple(lists:seq(RangeStart, RangeEnd));
        {} ->
            {}
    end.


%%===================================================================
%% Internal functions
%%===================================================================

-spec parse_range(Range :: binary()) ->
    {RangeStart :: integer(), RangeEnd :: integer()} | {}.
parse_range(<<"[]">>) ->
    {};
parse_range(<<"[", RangeStartBin, ",", RangeEndBin, "]">>) ->
    RangeStart = binary_to_integer(<<RangeStartBin>>),
    RangeEnd = binary_to_integer(<<RangeEndBin>>),
    true = RangeStart =< RangeEnd,
    {RangeStart, RangeEnd};
parse_range(<<"()">>) ->
    {};
parse_range(<<"(", _, ")">>) ->
    {}.
