unit PIP.Cases12_03;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.UString,
  DeepStar.Math;

procedure Main;

implementation

const
  FileName = '../../Source/Case12/InFile_12_03.txt';

function NumList(num, n: integer): TArr_int;
var
  res: TArr_int;
  i: integer;
begin
  SetLength(res, n);

  num += 1;
  i := 0;
  while i < n do
  begin
    if TMath.IsPrime(num) then
    begin
      res[i] := num;
      num += 1;
      i += 1;
    end
    else
    begin
      num += 1;
    end;
  end;

  Result := res;
end;

procedure Main;
var
  sl, tempSL: TStringList;
  i, num, n, j: integer;
  strs: TArr_str;
  str: string;
  sb: TStringBuilder;
begin
  tempSL := TStringList.Create();
  try
    sl := TStringList.Create();
    try
      sl.LoadFromFile(CrossFixFileName(FileName));

      for i := 0 to sl.Count - 1 do
      begin
        str := sl[i];
        strs := str.Split([' ']);
        num := strs[0].ToInteger;
        n := strs[1].ToInteger;

        sb := TStringBuilder.Create();
        try
          for j in NumList(num, n) do
          begin
            sb.AppendFormat('%d%s', [j, ' ']);
          end;

          tempSL.Add(sb.ToString);
        finally
          sb.Free;
        end;
      end;
    finally
      sl.Free;
    end;

    tempSL.WriteBOM := true;
    tempSL.SaveToFile('OutFile.txt', TEncoding.UTF8);
  finally
    tempSL.Free;
  end;
end;

end.
