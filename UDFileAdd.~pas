unit UDFileAdd;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TfrmUDFileAdd = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edFromDir: TEdit;
    edFindFile: TEdit;
    edFindFileExt: TEdit;
    lbx_FileList: TListBox;
    memo1: TMemo;
    Label4: TLabel;
    edFileName: TEdit;
    cmInsert: TButton;
    cmDelete: TButton;
    procedure cmInsertClick(Sender: TObject);
    procedure edFileNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmDeleteClick(Sender: TObject);
  private
    //모든 파일리스트를 얻는 프로시져
    procedure GetFileList(sDir: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUDFileAdd: TfrmUDFileAdd;

implementation

{$R *.dfm}

procedure TfrmUDFileAdd.cmInsertClick(Sender: TObject);
var
  FilePatch: string;
begin
  if Pos('*', edFileName.Text) > 0 then
    GetFileList(edFromDir.Text)
  else
  begin
    FilePatch := edFindFile.Text + edFileName.Text + edFindFileExt.Text;
    lbx_FileList.Items.Add(FilePatch);
    edFileName.Text := '';
  end;
end;

procedure TfrmUDFileAdd.edFileNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    cmInsertClick(cmInsert);
end;

procedure TfrmUDFileAdd.cmDeleteClick(Sender: TObject);
var
  i : Integer;
begin
  if lbx_FileList.Items.Count > 0 then
  begin
    for i := lbx_FileList.Items.Count -1 Downto 0 do
    begin
      if lbx_FileList.Selected[i] then
        lbx_FileList.Items.Delete(i);
    end;
  end;
end;

procedure TfrmUDFileAdd.GetFileList(sDir: string);
var
  TempList : TSearchRec;
  UpperDir: String;
begin

  lbx_FileList.Clear;
  if sDir <> '' then
  begin
    UpperDir := sDir;
    if edFindFileExt.Text <> '' then
    begin
      if edFindFile.Text = '' then
        sDir := sDir + '\*'
      else
        sDir := sDir + '\' + edFindFile.Text;

      if Pos('.', edFindFileExt.Text) > 0 then
        sDir := sDir + edFindFileExt.Text
      else
        sDir := sDir + '.' + edFindFileExt.Text;
    end
    else
    begin
      if edFindFile.Text = '' then
        sDir := sDir + '\*' + edFindFile.Text
      else
        sDir := sDir + '\' + edFindFile.Text;
    end;

    if FindFirst(sDir, faAnyFile, TempList) = 0 then
    begin
      edFromDir.Text := UpperDir;
      repeat
        if not (TempList.Name = '.') and not (TempList.Name = '..') then  //상위루트 제외
          lbx_FileList.Items.Add(TempList.Name);
      until FindNext(TempList) <> 0;
    end;
  end;
end;

end.
