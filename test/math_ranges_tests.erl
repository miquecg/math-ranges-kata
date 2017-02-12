-module(math_ranges_tests).

-include_lib("eunit/include/eunit.hrl").


inclusive_limits_ranges_test_() ->
    ?_assertEqual({}, ranges:get_all_points(<<"[]">>)),
    ?_assertEqual({0}, ranges:get_all_points(<<"[0]">>)),
    ?_assertEqual({1}, ranges:get_all_points(<<"[1]">>)).
