unit PIP.Cases12_04;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

type
  TNode = record
    Flag: boolean;
    Next: integer;
  end;

  TArr_TNode = array of TNode;

var
  arr:TArr_TNode;

procedure Main;
var
  j, i, k: Integer;
begin
  SetLength(arr, 31);
  WriteLn('最终结果为（s：被扔下海，b：在船上）：');

  for i := 1 to 30 do
  begin
    arr[i].Flag := true;
    arr[i].Next := i+1;
  end;
  arr[30].Next:=1;

  j:=30;
  for i := 0 to 14 do
  begin
    k:=0;
    while true do
    begin
      if k<9 then
      begin
        j:=arr[j].Next;
        if arr[j].Flag then
          k+=1;
      end
      else
      begin
        Break;
      end;
    end;
    arr[j].Flag := false;
  end;

  for i := 1 to 30 do
    WriteF('%s', [specialize IfThen<string>(arr[i].Flag, 'b', 's')]);
  WriteLn;
end;

end.
