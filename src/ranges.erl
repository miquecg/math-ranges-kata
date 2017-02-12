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
    inclusive_range(binary_to_integer(<<RangeStartBin>>), binary_to_integer(<<RangeEndBin>>));
parse_range(<<"()">>) ->
    {};
parse_range(<<"(", RangeStartBin, ",", RangeEndBin, ")">>) ->
    exclusive_range(binary_to_integer(<<RangeStartBin>>), binary_to_integer(<<RangeEndBin>>));
parse_range(<<"(]">>) ->
    {};
parse_range(<<"[)">>) ->
    {}.

-spec inclusive_range(RangeStart :: integer(), RangeEnd :: integer()) ->
    {RangeStart :: integer(), RangeEnd :: integer()}.
inclusive_range(RangeStart, RangeEnd) when RangeStart =< RangeEnd ->
    {RangeStart, RangeEnd}.

-spec exclusive_range(RangeStart :: integer(), RangeEnd :: integer()) ->
    {RangeStart :: integer(), RangeEnd :: integer()} | {}.
exclusive_range(RangeStart, RangeStart) ->
    {};
exclusive_range(RangeStart, RangeEnd) when RangeEnd =:= RangeStart + 1 ->
    {};
exclusive_range(RangeStart, RangeEnd) when RangeEnd > RangeStart ->
    {RangeStart + 1, RangeEnd - 1}.
