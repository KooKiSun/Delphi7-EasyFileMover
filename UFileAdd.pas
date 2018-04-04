unit UFileAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmFileAdd = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    cmInsert: TButton;
    cmDelete: TButton;
    lbx_FileList: TListBox;
    Label1: TLabel;
    edFromDir: TEdit;
    edFindFile: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edFindFileExt: TEdit;
    memo1: TMemo;
    procedure cmInsertClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFileAdd: TfrmFileAdd;

implementation

{$R *.dfm}

procedure TfrmFileAdd.cmInsertClick(Sender: TObject);
var
  FilePatch: string;
begin
  FilePatch := edFindFile.Text + edFindFileExt.Text;
  lbx_FileList.Items.Add(FilePatch);
end;

end.
