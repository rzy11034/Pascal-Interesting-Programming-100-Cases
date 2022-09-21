unit PIP.Cases06_01;

{$mode objfpc}{$H+}{$J+}
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
  score: TArr2D_int;
  zhang, wang, li, last, i, j: integer;
begin
  SetLength(score, 4, 4);
  score[1, 1] := 7;
  score[2, 1] := 8;
  score[3, 1] := 9;

  for zhang := 4 to 6 - 1 do
  begin
    for wang := 4 to 7 - 1 do
    begin
      for li := 4 to 7 - 1 do
      begin
        if (zhang <> wang) and (li <> zhang) and (li <> wang)
          and (15 - zhang - score[1, 1] <> 15 - wang - score[2, 1])
          and (15 - zhang - score[1, 1] <> 15 - li - score[3, 1])
          and (15 - wang - score[2, 1] <> 15 - li - score[3, 1]) then
        begin
          score[1, 2] := zhang; score[1, 3] := 15 - zhang - 7;
          score[2, 2] := wang; score[2, 3] := 15 - wang - 8;
          score[3, 2] := li; score[3, 3] := 15 - li - 9;
        end;
      end;
    end;
  end;

  WriteLn('array score:');
  for i := 1 to 3 do
  begin
    for j := 1 to 3 do
    begin
      Write(score[i, j], '   ');

      if score[i, j] = 1 then
        last := i;
    end;

    WriteLn;
  end;


  case last of
    1: WriteLn('The, last one reached the end is a child form family Zhang.');
    2: WriteLn('The, last one reached the end is a child form family Wang.');
    3: WriteLn('The, last one reached the end is a child form family Li.');
  end;
end;

end.
