unit PIP.Cases05_01;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

procedure Main;
var
  start, end_, i, k, m, Count: integer;
  flag: boolean;
begin
  flag := true;
  Count := 0;
  Write('Input START and END:');
  start := 1;
  end_ := 1000;
  WriteLnF('%d-%d', [start, end_]);
  WriteLnF('.......... prime table(%d-%d)..........', [start, end_]);

  for m := start to end_ do
  begin
    k := round(sqrt(m));
    for i := 2 to k do
    begin
      if m mod i = 0 then
      begin
        flag := false;
        Break;
      end;
    end;

    if flag then
    begin
      WriteF('%-4d', [m]);
      Count += 1;
      if Count mod 10 = 0 then
        WriteLn;
    end;

    flag := true;
  end;

  WriteLnF(NEW_LINE + 'The total is %d', [Count]);
end;

end.
