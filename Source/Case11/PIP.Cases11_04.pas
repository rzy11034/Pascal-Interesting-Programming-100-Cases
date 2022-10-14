unit PIP.Cases11_04;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs;

type
  TFrm_Cases11_04 = class(TForm)
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private

  public

  end;

procedure Main;

implementation

procedure Main;
var
  frm: TFrm_Cases11_04;
begin
  frm := TFrm_Cases11_04.Create(nil);
  try
    Application.Initialize;
    frm.ShowModal;
    Application.Run;
  finally
    frm.Free;
  end;
end;

{$R *.frm}

{ TFrm_Cases11_04 }

procedure TFrm_Cases11_04.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrm_Cases11_04.FormCreate(Sender: TObject);
begin
  Self.Height := 640;
  Self.Width := 800;
  Self.Color := clBlack;
  BorderStyle := TFormBorderStyle.bsDialog;
  Self.Position := TPosition.poScreenCenter;
end;

procedure TFrm_Cases11_04.FormPaint(Sender: TObject);
var
  cvs: TCanvas;
begin
  cvs := Self.Canvas;

  cvs.Pen.Color := clWhite;
  cvs.Rectangle(225, 250, 480, 400);
  cvs.Rectangle(390, 320, 440, 400);
  cvs.Rectangle(260, 290, 300, 330);
  cvs.Line(260, 310, 300, 310);
  cvs.Line(280, 290, 280, 330);
  cvs.Line(200, 200, 455, 200);
  cvs.Line(455, 200, 480, 250);
  cvs.Line(200, 200, 225, 250);
  cvs.Line(160, 230, 200, 200);
  cvs.Line(160, 230, 225, 250);
  cvs.Line(160, 230, 160, 380);
  cvs.Line(160, 380, 225, 400);
end;

end.
