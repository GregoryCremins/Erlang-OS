-module(eos).
-export([startOS/0, main/0]).
startOS() ->
  %spawn memory process
  MEM_PID = spawn(memory, running, []),
  MEM_PID ! startup,
  eos:main().
main() -> 
X = io:get_line("> "),
LEN = string:len(X) - 1,
CI = string:substr(X, 1, LEN),
shellcommands:handleCom(CI).

