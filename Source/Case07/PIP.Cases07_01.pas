unit PIP.Cases07_01;

{$mode objfpc}{$H+}{$J+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.UString;

procedure Main;

implementation

procedure Main;
var
  a, b: TArr_chr;
  visited: TArr_bool;
  temp: string;
  flag: boolean;
  i, l, k, Count, j: integer;
begin
  Count := 0;

  Randomize;
  WriteLn('机器输入四位数****');
  temp := (Random(999) + 1000).ToString;
  a := temp.ToCharArray;

  repeat
    flag := false;
    l := 0;
    k := 0;
    visited := nil;
    SetLength(visited, 4);

    Write('请输入你猜的四位数：');
    ReadLn(temp);

    if temp = 'AAAA' then
    begin
      TArrayUtils_chr.Print(a);
      Continue;
    end;

    b := temp.ToCharArray;
    Count += 1;

    for i := 0 to High(a) do
    begin
      for j := 0 to High(b) do
      begin
        if a[i] = b[j] then
        begin
          if not visited[i] then
          begin
            l += 1;
            visited[i] := true;
          end;

          if i = j then
            k += 1;
        end;
      end;
    end;

    WriteLnF('你猜的结果是：%d数字对-%d位置对。', [l, k]);

    if k = 4 then
    begin
      WriteLn('*****你赢了*****');
      WriteLnF('共猜了%d次。', [Count]);
      flag := true;
    end;
  until flag;
end;

end.
