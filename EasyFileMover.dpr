program EasyFileMover;

uses
  Forms,
  UMain in 'UMain.pas' {frmUmain},
  UDFileAdd in 'UDFileAdd.pas' {frmUDFileAdd};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmUmain, frmUmain);
  Application.Run;
end.
