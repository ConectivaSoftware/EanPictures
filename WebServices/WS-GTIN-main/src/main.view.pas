unit main.view;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  main.control, Vcl.Grids, Vcl.ValEdit;

type
  TMainView = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    btnPower: TBitBtn;
    btnSaveConfig: TBitBtn;
    Panel2: TPanel;
    Bevel1: TBevel;
    ValueListEditor1: TValueListEditor;
    GroupBox1: TGroupBox;
    MemoFotoOK: TMemo;
    GroupBox2: TGroupBox;
    MemoFotoErro: TMemo;
    GroupBox3: TGroupBox;
    MemoDescOK: TMemo;
    GroupBox4: TGroupBox;
    MemoDescErro: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnPowerClick(Sender: TObject);
    procedure btnSaveConfigClick(Sender: TObject);
  private
    { Private declarations }
    Control: TMainControl;
    procedure LoadConfigFile;
    procedure SaveConfigFile;
  public
    { Public declarations }
  end;

var
  MainView: TMainView;
  fotoerro, fotook: integer;
  descerro, descok: integer;

implementation
uses main.basedados;
{$R *.dfm}

procedure TMainView.FormCreate(Sender: TObject);
begin
  Control := TMainControl.Create;
  LoadConfigFile;
end;

procedure TMainView.btnSaveConfigClick(Sender: TObject);
begin
  SaveConfigFile;
end;

procedure TMainView.btnPowerClick(Sender: TObject);
begin
  Control.Config.Assign( ValueListEditor1.Strings );
  Control.Power;
  case Control.Active of
    false: btnPower.Caption := 'Start';
    true : btnPower.Caption := 'Stop';
  end;
end;

procedure TMainView.LoadConfigFile;
begin
  ValueListEditor1.Strings.Assign( Control.Config );
end;

procedure TMainView.SaveConfigFile;
begin
  Control.SaveConfig(ValueListEditor1.Strings);
  LoadConfigFile;
end;

end.
