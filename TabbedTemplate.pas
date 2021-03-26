unit TabbedTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.StdCtrls, FMX.Gestures, FMX.ListBox, FMX.Objects,
  FMX.Controls.Presentation, FMX.WebBrowser, System.ImageList, FMX.ImgList,
  FMX.Edit, FMX.Platform, FMX.MediaLibrary, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, FMX.ScrollBox, FMX.Memo, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Authenticator.Basic, REST.Response.Adapter, System.Rtti, FMX.Grid.Style,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Grid, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.Bind.DBScope, FMX.Grid, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FireDAC.Stan.StorageBin, Datasnap.DBClient, FMX.Memo.Types, REST.Types;

type
  TTabbedForm = class(TForm)
    HeaderToolBar: TToolBar;
    GestureManager1: TGestureManager;
    Image1: TImage;
    ToolBarLabel: TLabel;
    ImageList1: TImageList;
    TabControl1: TTabControl;
    TabItem2: TTabItem;
    Panel1: TPanel;
    TabItem3: TTabItem;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Label2: TLabel;
    Edit2: TEdit;
    EditButton2: TEditButton;
    HTTPBasic_DelphiPRAXiS: THTTPBasicAuthenticator;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    Label3: TLabel;
    Memo1: TMemo;
    BindSourceDB1: TBindSourceDB;
    FDMemTable1: TFDMemTable;
    BindingsList1: TBindingsList;
    StringGrid1: TStringGrid;
    LinkGridToDataSourceBindSourceDB12: TLinkGridToDataSource;
    ListView1: TListView;
    FDMemTable1ngrn: TStringField;
    FDMemTable1dfrom: TStringField;
    FDMemTable1dto: TStringField;
    FDMemTable1nsi00219: TStringField;
    FDMemTable1nsi00219vnsostk: TStringField;
    FDMemTable1nsi00219nsi00219: TStringField;
    FDMemTable1nsi00219nksost: TStringField;
    FDMemTable1vnaim: TStringField;
    FDMemTable1vfn: TStringField;
    LinkFillControlToField1: TLinkFillControlToField;
    Taxpanel: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Image3: TImage;
    Panel7: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Panel8: TPanel;
    Label7: TLabel;
    VUNP: TLabel;
    Panel9: TPanel;
    Label8: TLabel;
    VNAIMK: TLabel;
    Panel10: TPanel;
    Label9: TLabel;
    VNAIMP: TLabel;
    Panel11: TPanel;
    Label10: TLabel;
    VPADRES: TLabel;
    Panel12: TPanel;
    Label12: TLabel;
    DREG: TLabel;
    Panel13: TPanel;
    Label13: TLabel;
    NMNS: TLabel;
    Panel14: TPanel;
    Label11: TLabel;
    VMNS: TLabel;
    Panel15: TPanel;
    Label15: TLabel;
    VLIKV: TLabel;
    Panel16: TPanel;
    Label17: TLabel;
    DLIKV: TLabel;
    Panel17: TPanel;
    Label19: TLabel;
    VKODS: TLabel;
    HTTPBasicAuthenticator1: THTTPBasicAuthenticator;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Memo2: TMemo;
    Label14: TLabel;
    InstructionsImage: TImage;
    BindSourceDB2: TBindSourceDB;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable2: TFDMemTable;
    TabControl2: TTabControl;
    TI1: TTabItem;
    TI2: TTabItem;
    TI3: TTabItem;
    WebBrowser1: TWebBrowser;
    WebBrowser2: TWebBrowser;
    Label1: TLabel;
    Edit1: TEdit;
    EditButton1: TEditButton;
    TI4: TTabItem;
    WebBrowser3: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure EditButton1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EditButton2Click(Sender: TObject);
    procedure ResetRESTComponentsToDefaults;
    procedure RESTRequestAfterExecute(Sender: TCustomRESTRequest);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListView1ItemsChange(Sender: TObject);
    procedure RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
    procedure RESTRequest1HTTPProtocolError(Sender: TCustomRESTRequest);
    procedure RESTClient1HTTPProtocolError(Sender: TCustomRESTClient);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabbedForm: TTabbedForm;
  hdr_r, hdr_e, tab1_r, tab1_en, tab2_r, tab2_en, tab3_r, tab3_en,
  lab1_r, lab1_en, but1_r, but1_e, shortprefix, longprefix, cbaseURL:string;
  nalogfails:boolean;

implementation

uses
  System.JSON, REST.Json;
{$R *.fmx}
       type
  TAdapterJSONValue =  class(TInterfacedObject, IRESTResponseJSON)
  private
    FJSONValue: TJSONValue;
  protected
    { IRESTResponseJSON }
    procedure AddJSONChangedEvent(const ANotify: TNotifyEvent);
    procedure RemoveJSONChangedEvent(const ANotify: TNotifyEvent);
    procedure GetJSONResponse(out AJSONValue: TJSONValue; out AHasOwner: Boolean);
    function HasJSONResponse: Boolean;
    function HasResponseContent: Boolean;
  public
    constructor Create(const AJSONValue: TJSONValue);
    destructor Destroy; override;
  end;

  { TAdapterJSONValue }

procedure TAdapterJSONValue.AddJSONChangedEvent(const ANotify: TNotifyEvent);
begin
  // Not implemented because we pass JSON in constructor and do not change it
end;

constructor TAdapterJSONValue.Create(const AJSONValue: TJSONValue);
begin
  FJSONValue := AJSONValue;
end;

destructor TAdapterJSONValue.Destroy;
begin
  // We own the JSONValue, so free it.
  FJSONValue.Free;
  inherited;
end;

procedure TAdapterJSONValue.GetJSONResponse(out AJSONValue: TJSONValue;
  out AHasOwner: Boolean);
begin
  AJSONValue := FJSONValue;
  AHasOwner := True; // We own this object
end;

function TAdapterJSONValue.HasJSONResponse: Boolean;
begin
  Result := FJSONValue <> nil;
end;

function TAdapterJSONValue.HasResponseContent: Boolean;
begin
  Result := FJSONValue <> nil;
end;

procedure TAdapterJSONValue.RemoveJSONChangedEvent(const ANotify: TNotifyEvent);
begin
  // Not implemented because we pass JSON in constructor and do not change it
end;


procedure TTabbedForm.ResetRESTComponentsToDefaults;
begin
  /// reset all of the rest-components for a complete
  /// new request
  ///
  /// --> we do not clear the private data from the
  /// individual authenticators.
  ///
  Memo1.ClearContent;      Memo2.ClearContent;
  RESTClient.ResetToDefaults;
  RESTRequest.ResetToDefaults;
  RESTResponse.ResetToDefaults;
  RESTResponseDataSetAdapter.ResetToDefaults;
{  RESTRequest.CleanupInstance;
  RESTClient.CleanupInstance;
  RESTResponse.CleanupInstance;
  RESTResponseDataSetAdapter.ResponseJSON := nil;}

  RESTClient1.ResetToDefaults;
  RESTRequest1.ResetToDefaults;
  RESTResponse1.ResetToDefaults;
  RESTRequest1.ClearBody;
  RestResponse1.CleanupInstance;
  RESTResponseDataSetAdapter1.ResetToDefaults;
  nalogfails:=false;
  RESTResponseDataSetAdapter1.Response := nil;
{  RESTRequest.CleanupInstance;
  RESTClient.CleanupInstance;
  RESTResponse.CleanupInstance;
  RESTResponseDataSetAdapter1.ResponseJSON := nil;
  RESTResponseDataSetAdapter1.Response := nil;     }

end;

procedure TTabbedForm.RESTClient1HTTPProtocolError(Sender: TCustomRESTClient);
begin
 nalogfails:=true;  SpeedButton1.Visible:=false;
raise Exception.Create('Информация по данному юрлицу не найдена в базе данных Министерства по налогам и сборам Республики Беларусь.')

end;

procedure TTabbedForm.RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
var i:longint;
s,s2, parameter, URL:string;
begin
    memo2.ClearContent;
//  Label14.Text := 'URI: ' + Sender.GetFullRequestURL + ' Execution time: ' +
  //  IntToStr(Sender.ExecutionPerformance.TotalExecutionTime) + 'ms';
   // Label14.Visible:=true;
{   if not nalogfails then if not RESTResponse1.Status.ClientError then  }

     try
                           Memo2.Lines.Add(RESTResponse1.Content);
                           except
                               nalogfails:=true;  //  vunp.Text:='VUNP';
                               raise Exception.Create('Информация по данному юрлицу не найдена в базе данных Министерства по налогам и сборам Республики Беларусь.')
                           end;
      //  Label14.Visible:=true;
        Memo2.Visible:=false;
        Memo2.Align:=TAlignLayout.Client;

if (Length(Memo2.Lines.Text)>2)
{or nalogfails or RESTResponse1.Status.ClientError) then  vunp.Text:='VUNP' else }
then begin
                s:='</VUNP>'; s2:='<VUNP>';
if pos(s,Memo2.Text)>pos(s2,Memo2.Text) then
  vunp.Text:=copy(Memo2.Text,pos(s2,Memo2.Text)+length(s2),pos(s,Memo2.text ) - pos(s2,Memo2.text)-length(s2))
  else vunp.Text:='-';
s:='</VNAIMK>'; s2:='<VNAIMK>';
if pos(s,Memo2.Text)>pos(s2,Memo2.Text) then
  vnaimk.Text:=copy(Memo2.Text,pos(s2,Memo2.Text)+length(s2),pos(s,Memo2.text ) - pos(s2,Memo2.text)-length(s2))
  else vnaimk.Text:='-';
 s:='</VNAIMP>'; s2:='<VNAIMP>';
if pos(s,Memo2.Text)>pos(s2,Memo2.Text) then
  vnaimp.Text:=copy(Memo2.Text,pos(s2,Memo2.Text)+length(s2),pos(s,Memo2.text ) - pos(s2,Memo2.text)-length(s2))
  else vnaimp.Text:='-';
s:='</VPADRES>'; s2:='<VPADRES>';
if pos(s,Memo2.Text)>pos(s2,Memo2.Text) then
  vpadres.Text:=copy(Memo2.Text,pos(s2,Memo2.Text)+length(s2),pos(s,Memo2.text ) - pos(s2,Memo2.text)-length(s2))
  else vpadres.Text:='-';
 s:='</DREG>'; s2:='<DREG>';
if pos(s,Memo2.Text)>pos(s2,Memo2.Text) then
  dreg.Text:=copy(Memo2.Text,pos(s2,Memo2.Text)+length(s2),pos(s,Memo2.text ) - pos(s2,Memo2.text)-length(s2))
  else dreg.Text:='-';
  s:='</NMNS>'; s2:='<NMNS>';
if pos(s,Memo2.Text)>pos(s2,Memo2.Text) then
  nmns.Text:=copy(Memo2.Text,pos(s2,Memo2.Text)+length(s2),pos(s,Memo2.text ) - pos(s2,Memo2.text)-length(s2))
  else nmns.Text:='-';
   s:='</VMNS>'; s2:='<VMNS>';
if pos(s,Memo2.Text)>pos(s2,Memo2.Text) then
  vmns.Text:=copy(Memo2.Text,pos(s2,Memo2.Text)+length(s2),pos(s,Memo2.text ) - pos(s2,Memo2.text)-length(s2))
  else vmns.Text:='-';
  s:='</VKODS>'; s2:='<VKODS>';
if pos(s,Memo2.Text)>pos(s2,Memo2.Text) then
  vkods.Text:=copy(Memo2.Text,pos(s2,Memo2.Text)+length(s2),pos(s,Memo2.text ) - pos(s2,Memo2.text)-length(s2))
  else vkods.Text:='-';
    s:='</DLIKV>'; s2:='<DLIKV>';
if pos(s,Memo2.Text)>pos(s2,Memo2.Text) then
  dlikv.Text:=copy(Memo2.Text,pos(s2,Memo2.Text)+length(s2),pos(s,Memo2.text ) - pos(s2,Memo2.text)-length(s2))
  else dlikv.Text:='-';
      s:='</VLIKV>'; s2:='<VLIKV>';
if pos(s,Memo2.Text)>pos(s2,Memo2.Text) then
  Vlikv.Text:=copy(Memo2.Text,pos(s2,Memo2.Text)+length(s2),pos(s,Memo2.text ) - pos(s2,Memo2.text)-length(s2))
  else vlikv.Text:='-';

  if pos(';',vnaimk.Text)>0 then vnaimk.text:=copy(vnaimk.text,0,pos(';',vnaimk.Text)-6)+'"'+copy(vnaimk.text,pos(';',vnaimk.Text)+1,length(vnaimk.Text)-pos('&quot;',vnaimk.Text));
 if pos(';',vnaimk.Text)>0 then vnaimk.text:=copy(vnaimk.text,0,pos(';',vnaimk.Text)-6)+'"'+copy(vnaimk.text,pos(';',vnaimk.Text)+1,length(vnaimk.Text)-pos('&quot;',vnaimk.Text));
   if pos(';',vnaimp.Text)>0 then vnaimp.text:=copy(vnaimp.text,0,pos(';',vnaimp.Text)-6)+'"'+copy(vnaimp.text,pos(';',vnaimp.Text)+1,length(vnaimp.Text)-pos('&quot;',vnaimp.Text));
   if pos(';',vnaimp.Text)>0 then vnaimp.text:=copy(vnaimp.text,0,pos(';',vnaimp.Text)-6)+'"'+copy(vnaimp.text,pos(';',vnaimp.Text)+1,length(vnaimp.Text)-pos('&quot;',vnaimp.Text));

       SpeedButton1.Visible:=true;

                                                            end;
end;

procedure TTabbedForm.RESTRequest1HTTPProtocolError(Sender: TCustomRESTRequest);
begin
nalogfails:=true;
 vunp.Text:='-';    SpeedButton1.Visible:=false;

   //if RESTResponse1.Status.ClientError then
   // ResetRESTComponentsToDefaults;
    // RestRequest1.Cancel;
  //   RestRequest1.ClearBody;
raise Exception.Create('Информация по данному юрлицу не найдена в базе данных Министерства по налогам и сборам Республики Беларусь.')


end;

procedure TTabbedForm.RESTRequestAfterExecute(Sender: TCustomRESTRequest);
 var i:longint;
begin
    memo1.ClearContent;
 // Label3.Text := 'URI: ' + Sender.GetFullRequestURL + ' Execution time: ' +
   // IntToStr(Sender.ExecutionPerformance.TotalExecutionTime) + 'ms';
   if assigned(RESTResponse.JSONValue) then
  begin
    Memo1.Lines.Text := TJson.Format(RESTResponse.JSONValue) ;
             Label3.Visible:=false;
             Memo1.Align:=TAlignLayout.Top;
             Memo1.Visible:=false;
             StringGrid1.Visible:=false;
             Listview1.Visible:=TRUE;

     end
  else
  begin
    Memo1.Lines.Add(RESTResponse.Content);
        Label3.Visible:=true;
        Memo1.Visible:=false;
        Memo1.Align:=TAlignLayout.Client;
        StringGrid1.Visible:=false;
        Listview1.Visible:=true;
   raise Exception.Create('Сервер Минюста выдал ошибку при обработке запроса. Поиск осуществляется только по коммерческим юрлицам, либо сервер недоступен.')    ;

  end;


  end;

procedure TTabbedForm.Edit1KeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);

begin
if not CharInSet(KeyChar,['0'..'9']) then
begin
KeyChar := #0;
end;
if length(Edit1.Text)<8 then EditButton1.Enabled:=false;
if length(Edit1.Text)=8 then EditButton1.Enabled:=true;
if length(Edit1.Text)>8 then KeyChar := #0;


end;

procedure TTabbedForm.EditButton1Click(Sender: TObject);
var prefix:string;
 i:byte;    s, r:string;

 begin
s:=Edit1.Text;     r:='';
for I := 0 to length(s) do  if CharInSet(s[i],['0'..'9']) then r:=r+s[i];
Edit1.Text:=r;

    Label14.Visible:=false;    SpeedButton1.Visible:=true;     nalogfails:=false;
    VUNP.Text:='-';
   VNAIMK.Text:='-';
   VNAIMP.Text:='-';
   VPADRES.Text:='-';
   DREG.Text:='-';
   NMNS.Text:='-';
   VMNS.Text:='-';
   VKODS.Text:='-';
   DLIKV.Text:='-';
   VLIKV.Text:='-';

  {
  try
  RESTClient1.BaseURL := 'http://www.portal.nalog.gov.by/grp/getData?unp=100063737';
  RESTClient1.Authenticator := HTTPBasicAuthenticator1;

  RESTRequest1.Resource := '';

  HTTPBasicAuthenticator1.Username := '';
  HTTPBasicAuthenticator1.Password := '';

  RESTRequest1.Execute;
   finally
   VUNP.Text:='-';
   VNAIMK.Text:='-';
   VNAIMP.Text:='-';
   VPADRES.Text:='-';
   DREG.Text:='-';
   NMNS.Text:='-';
   VMNS.Text:='-';
   VKODS.Text:='-';
   DLIKV.Text:='-';
   VLIKV.Text:='-';

   ResetRESTComponentsToDefaults;
   // RESTResponseDataSetAdapter1.Response := nil; // Prevent memory leak

    //   RestRequest1.Cancel;
     //RestRequest1.ClearBody;

   end;               }
   ResetRESTComponentsToDefaults;
  //  RestRequest1.ClearBody; Memo2.ClearContent;


  RESTClient1.BaseURL := 'http://www.portal.nalog.gov.by/grp/getData?unp='+Edit1.Text;
  RESTClient1.Authenticator := HTTPBasicAuthenticator1;



  RESTRequest1.Resource := '';

  HTTPBasicAuthenticator1.Username := '';
  HTTPBasicAuthenticator1.Password := '';


          RESTRequest1.Execute;

//  RESTResponseDataSet1.Response := nil; // Prevent memory leak



if (VUNP.Text='VUNP') or (VUNP.Text='-') then begin
SpeedButton1.Visible:=false;
  TI4.Visible:=false;
end;

      WebBrowser1.URL:=shortprefix+Edit1.Text;
WebBrowser1.Navigate(shortprefix+Edit1.Text);


WebBrowser2.URL:=longprefix+Edit1.Text;
WebBrowser2.Navigate(longprefix+Edit1.Text);

   WebBrowser3.URL:='http://www.portal.nalog.gov.by/debtor/#!ul;unp='+Edit1.Text;
WebBrowser3.Navigate('http://www.portal.nalog.gov.by/debtor/#!ul;unp='+Edit1.Text);

end;

procedure TTabbedForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
RESTResponseDataSetAdapter.ResponseJSON := nil; // Prevent memory leak
RESTResponseDataSetAdapter1.ResponseJSON := nil; // Prevent memory leak
RESTResponseDataSetAdapter.Response := nil; // Prevent memory leak
RESTResponseDataSetAdapter1.Response := nil; // Prevent memory leak
end;

procedure TTabbedForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
 // TabbedForm.FullScreen:=true;

  lab1_r:=' УНП (9 цифр)';
   but1_r:='Переслать';
   longprefix:='http://egr.gov.by/egrn/eFindPrintSub.jsp?N=';
   shortprefix:='http://egr.gov.by/egrn/QR.jsp?N=';
  // TabbedForm.Height:=Screen.Height;
   Webbrowser1.Navigate;
  // Tabbedform.WindowState:=TWindowState.wsMaximized;
   cBaseURL:= 'http://egr.gov.by/api/v2/egr/getShortInfoByRegName/';
   editButton1.Text:=#$1F50E;
   editbutton1.Canvas.Fill.Color:=TAlphaColor($FF000000) or TAlphaColor($FFFFFF);
   editButton2.Text:=#$1F50E;
      editbutton2.Canvas.Fill.Color:=TAlphaColor($FF000000) or TAlphaColor($FFFFFF);
    Label1.Text:= 'УНП (9 цифр)';
    webbrowser1.Navigate;
    ResetRESTComponentsToDefaults;


end;

procedure TTabbedForm.EditButton2Click(Sender: TObject);
var i:longint;
       LJSON: TJSONValue;
  LIntf: IRESTResponseJSON;

begin
InstructionsImage.Visible:=false;

  ResetRESTComponentsToDefaults;

  RESTClient.BaseURL := cBaseURL;
  RESTClient.Authenticator := HTTPBasic_DelphiPRAXiS;

  RESTRequest.Resource := Edit2.Text;

  HTTPBasic_DelphiPRAXiS.Username := '';
  HTTPBasic_DelphiPRAXiS.Password := '';

  RESTRequest.Execute;

  ///parse
    LJSON := TJSONObject.ParseJSONValue(Memo1.Lines.Text);
  if LJSON = nil then

    raise Exception.Create('Сервер Минюста выдал ошибку при обработке запроса. Поиск осуществляется только по коммерческим юрлицам, либо сервер недоступен.')    ;

  // Provide the JSON value to the adapter
  LIntf := TAdapterJSONValue.Create(LJSON);
  RESTResponseDataSetAdapter.ResponseJSON := LIntf;

  RESTResponseDataSetAdapter.Active := True;
  Listview1.Visible:=TRUE;
  Listview1.Align:=TalignLayout.Client;


 for i := 0 to ListView1.ItemCount-1 do

 try
  if (ListView1.Items[i].Objects.FindObject('Text7') as TListItemText).Text='Действующий' then
     (ListView1.Items[i].Objects.FindObject('Text7') as TListItemText).TextColor:=TAlphaColorRec.Green;

  if (ListView1.Items[i].Objects.FindObject('Text8') as TListItemText).Text='2' then
     (ListView1.Items[i].Objects.FindObject('Text7') as TListItemText).TextColor:=TAlphaColorRec.Red;

 if (ListView1.Items[i].Objects.FindObject('Text8') as TListItemText).Text='5' then
     (ListView1.Items[i].Objects.FindObject('Text7') as TListItemText).TextColor:=TAlphaColorRec.Red;

     if (ListView1.Items[i].Objects.FindObject('Text8') as TListItemText).Text='3' then
     (ListView1.Items[i].Objects.FindObject('Text7') as TListItemText).TextColor:=TAlphaColorRec.Orangered;
       if (ListView1.Items[i].Objects.FindObject('Text8') as TListItemText).Text='4' then
     (ListView1.Items[i].Objects.FindObject('Text7') as TListItemText).TextColor:=TAlphaColorRec.Orangered;
     except

  end;


end;

procedure TTabbedForm.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IFDEF ANDROID}
  case EventInfo.GestureID of
    sgiLeft:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount-1] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex+1];
      Handled := True;
    end;

    sgiRight:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex-1];
      Handled := True;
    end;
  end;
{$ENDIF}
end;

procedure TTabbedForm.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
Edit1.Text:=(AItem.Objects.FindObject('Text1') as TListItemText).Text;
TabControl1.TabIndex:=0;
EditButton1Click(Sender);
end;

procedure TTabbedForm.ListView1ItemsChange(Sender: TObject);
var AItem: TListViewItem;
i:integer;
begin

end;

procedure TTabbedForm.SpeedButton1Click(Sender: TObject);
var
  vSharingService: IFMXShareSheetActionsService;
 prefix:string;
begin
if TabControl2.ActiveTab=TI1 then prefix:=shortprefix;
if TabControl2.ActiveTab=TI2 then prefix:=longprefix;
if TabControl2.ActiveTab=TI4 then prefix:='http://www.portal.nalog.gov.by/debtor/#!ul;unp=';
if TabControl2.ActiveTab=TI3 then begin
 Label14.Visible:=false;
    prefix:=Label7.Text+vunp.Text+#13#10+label8.Text+vnaimk.Text+#13#10+label9.Text+vnaimp.Text+#13#10+label10.Text+vpadres.Text+#13#10+label12.text+dreg.Text+#13#10+label13.Text+nmns.Text+#13#10+
    label11.Text+vmns.Text+#13#10+label19.Text+vkods.Text+#13#10+label17.Text+dlikv.Text+#13#10+label15.Text+vlikv.Text+#13#10;
       TPlatformServices.Current.SupportsPlatformService(IFMXShareSheetActionsService, vSharingService);
     vSharingService.Share(nil, prefix +#13#10+ ' [подготовлено с помощью приложения "Проверка контрагента" Лаборатории по ускорению устойчивого развития ПРООН в Беларуси] ', nil);
 end else  begin
 if length(Edit1.Text)=9 then  TPlatformServices.Current.SupportsPlatformService(IFMXShareSheetActionsService, vSharingService);
  vSharingService.Share(nil, prefix+Edit1.Text+#13#10+' [подготовлено с помощью приложения "Проверка контрагента" Лаборатории по ускорению устойчивого развития ПРООН в Беларуси] ', nil);
 end;


end;

end.
