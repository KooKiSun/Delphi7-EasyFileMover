unit UMain;

interface

uses
{
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, FileCtrl;
}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, ShellCtrls, FileCtrl, ShellApi;

type
  TfrmUmain = class(TForm)
    Panel1: TPanel;
    memo1: TMemo;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label1: TLabel;
    edFromDir: TEdit;
    Label2: TLabel;
    edToDir: TEdit;
    cmInsert: TButton;
    cmCopyFiles: TButton;
    cmDelete: TButton;
    sh_FromList: TShellTreeView; // Samples에 위치함.
    sh_ToList: TShellTreeView;
    edFindFile: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edFindFileExt: TEdit;
    cmFolderCopy: TButton;
    lbx_FileList: TListBox;
    procedure sh_FromListChange(Sender: TObject; Node: TTreeNode);
    procedure edFindFileKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sh_ToListChange(Sender: TObject; Node: TTreeNode);
    procedure cmCopyFilesClick(Sender: TObject);
    procedure cmFolderCopyClick(Sender: TObject);
    procedure cmDeleteClick(Sender: TObject);
    procedure cmInsertClick(Sender: TObject);
  private
  //모든 파일리스트를 얻는 프로시져
  procedure GetFileList(sDir: string);

  function CopyFiles(const fromFile, toFile: string): Boolean;
  function CopyDir(const fromDir, toDir: string): Boolean;
  function MoveDir(const fromDir, toDir: string): Boolean;
  function DelDir(dir: string): Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUmain: TfrmUmain;

implementation
  uses UDFileAdd;

{$R *.dfm}

procedure TfrmUmain.sh_FromListChange(Sender: TObject; Node: TTreeNode);
begin
  if Node = Nil then exit; //Node의 포인터 주소값이 0이면 실행 안 함

  GetFileList(sh_FromList.Path);////탐색기 폴더에서 파일리스트 불러오기
end;

procedure TfrmUmain.GetFileList(sDir: string);
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

procedure TfrmUmain.edFindFileKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    GetFileList(sh_FromList.Path);
end;

procedure TfrmUmain.sh_ToListChange(Sender: TObject; Node: TTreeNode);
begin
  edToDir.Text := sh_ToList.Path;
end;

function TfrmUmain.CopyFiles(const fromFile, toFile: string): Boolean;
var
  fos: TSHFileOpStruct;
  i : Integer;
begin
  ZeroMemory(@fos, SizeOf(fos));
  {
  with fos do
  begin
    wFunc  := FO_COPY;
    fFlags := FOF_FILESONLY;
    pFrom  := PChar(fromDir + #0);
    pTo    := PChar(toDir)
  end;
  Result := (0 = ShFileOperation(fos));
  }
  if lbx_FileList.Items.Count > 0 then
  begin
    for i := 0 to lbx_FileList.Items.Count - 1 do
    begin
      if ExtractFileName(lbx_FileList.Items.Strings[i]) <> '' then
        CopyFile(pchar(fromFile + '\' + lbx_FileList.Items.Strings[i]), pchar(ToFile + '\' + lbx_FileList.Items.Strings[i]), False);
    end;
  end;
end;

function TfrmUmain.CopyDir(const fromDir, toDir: string): Boolean;
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc  := FO_COPY;
    fFlags := FOF_FILESONLY;
    pFrom  := PChar(fromDir + #0);
    pTo    := PChar(toDir)
  end;
  Result := (0 = ShFileOperation(fos));
end;

function TfrmUmain.MoveDir(const fromDir, toDir: string): Boolean;
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc  := FO_MOVE;
    fFlags := FOF_FILESONLY;
    pFrom  := PChar(fromDir + #0);
    pTo    := PChar(toDir)
  end;
  Result := (0 = ShFileOperation(fos));
end;

function TfrmUmain.DelDir(dir: string): Boolean;
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc  := FO_DELETE;
    fFlags := FOF_SILENT or FOF_NOCONFIRMATION;
    pFrom  := PChar(dir + #0);
  end;
  Result := (0 = ShFileOperation(fos));
end;

procedure TfrmUmain.cmCopyFilesClick(Sender: TObject);
begin
  if MessageDlg('목록에 있는 파일을 복사하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Screen.Cursor := crHourGlass;
    try
      CopyFiles(edFromDir.Text, edToDir.Text);
      if MessageDlg('파일 복사가 끝났습니다. 확인하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        ShellExecute(Handle, 'open','explorer', PAnsiChar(edToDir.Text), nil, SW_NORMAL);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmUmain.cmFolderCopyClick(Sender: TObject);
begin
  if MessageDlg('지정한 폴더를 복사하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Screen.Cursor := crHourGlass;
    try
      if CopyDir(edFromDir.Text, edToDir.Text) = True then
      begin
        if MessageDlg('폴더 복사가 끝났습니다. 확인하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          ShellExecute(Handle, 'open','explorer', PAnsiChar(edToDir.Text), nil, SW_NORMAL);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmUmain.cmDeleteClick(Sender: TObject);
var
  i : Integer;
begin
  if lbx_FileList.Items.Count > 0 then
  begin
    if MessageDlg('선택한 파일을 목록에서 삭제하시겠습니까?'
                  + #13#10 + '실제 파일이 삭제 되지는 않습니다.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      for i := lbx_FileList.Items.Count -1 Downto 0 do
      begin
        if lbx_FileList.Selected[i] then
          lbx_FileList.Items.Delete(i);
      end;
    end;
  end;
end;

procedure TfrmUmain.cmInsertClick(Sender: TObject);
var
  frmUDFileAdd : TfrmUDFileAdd;
  i, j : Integer;
begin
  frmUDFileAdd := TfrmUDFileAdd.Create(nil);
  try
    frmUDFileAdd.edFromDir.Text := edFromDir.Text;
    if frmUDFileAdd.ShowModal = mrOk then
    begin
      if frmUDFileAdd.lbx_FileList.Items.Count > 0 then
      begin
        //기존에있던 파일들과 중복되지 않도록.
        for i := frmUDFileAdd.lbx_FileList.Items.Count -1 Downto 0 do
        begin
          for j := 0 to lbx_FileList.Items.Count -1 do
          begin
            if frmUDFileAdd.lbx_FileList.Items.Count > 0 then
            begin
              if frmUDFileAdd.lbx_FileList.Items.Strings[i] = lbx_FileList.Items.Strings[j] then
                frmUDFileAdd.lbx_FileList.Items.Delete(i);
            end;
          end;
        end;
      end;

      if frmUDFileAdd.lbx_FileList.Items.Count > 0 then
      begin
        //기존에있던 파일들과 중복되지 않도록.
        for i := 0 to frmUDFileAdd.lbx_FileList.Items.Count -1 do
          lbx_FileList.Items.Add(frmUDFileAdd.lbx_FileList.Items.Strings[i]);
      end;
    end;
  finally
    frmUDFileAdd.Free;
  end;
end;

end.
