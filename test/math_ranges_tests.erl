-module(math_ranges_tests).

-include_lib("eunit/include/eunit.hrl").


inclusive_limits_ranges_test_() ->
    ?_assertEqual({}, ranges:get_all_points(<<"[]">>)),
    ?_assertEqual({0}, ranges:get_all_points(<<"[0]">>)),
    ?_assertEqual({1}, ranges:get_all_points(<<"[1]">>)),
    ?_assertEqual({1}, ranges:get_all_points(<<"[1, 1]">>)),
    ?_assertEqual({1, 2}, ranges:get_all_points(<<"[1, 2]">>)),
    ?_assertEqual({3, 4, 5}, ranges:get_all_points(<<"[3, 5]">>)),
    ?_assertEqual({2, 3, 4, 5, 6, 7}, ranges:get_all_points(<<"[2, 7]">>)).

excluding_limits_ranges_test_() ->
    ?_assertEqual({}, ranges:get_all_points(<<"()">>)),
    ?_assertEqual({}, ranges:get_all_points(<<"(0)">>)),
    ?_assertEqual({}, ranges:get_all_points(<<"(1)">>)),
    ?_assertEqual({}, ranges:get_all_points(<<"(1,1)">>)),
    ?_assertEqual({}, ranges:get_all_points(<<"(1,2)">>)),
    ?_assertEqual({2}, ranges:get_all_points(<<"(1,3)">>)).
