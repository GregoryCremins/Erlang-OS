-module(memory).
-export([running/0]).
running() ->
	io:fwrite("Memory started"),
	MEM = dict:new(),
	MEM_0 = (memory, [], MEM),
	memCommandLoop(MEM_0),
	io:fwrite("Memory has ended, thank you for your business"),
	end;
memCommmandLoop(dict) ->
	receive
		load ->
			STRIPPED = string:(msg, both, $\s)
			if
				string:length(STRIPPED) rem 2 == 0 ->
					memory:load(msg, dict),
					memCommandLoop();
		show ->
			memory:show(dict),
			memCommandLoop();
		shutdown ->
			end();
load(msg, dict) ->
	INDEX = string:chr(msg, $\s),
	HEX = string:substring(msg, 0, index);
	
	
			
			