// テーブルの追加
function addRow(table_id,array_table_html)
{  // 行追加
  var tblObj = document.getElementById(table_id);   // tblObj 対象のテーブル
  var rowCnt = tblObj.rows.length;                  // テーブルの行数を取得
  var colCnt = tblObj.rows[0].cells.length; // 行内セルの数を取得
  var row = tblObj.insertRow(rowCnt);       // 行の末尾に,新規行を追加
  for (var i = 0; i < colCnt; i++)          // セルの数だけループして
  {
    var cell = row.insertCell(i);           // 追加した行にセルを挿入
    cell.innerHTML = array_table_html[i];         // セル内のhtml書き換え
  }
}
// テーブルの削除
function delRow(table_id)
{    // 行削除 
  var tblObj = document.getElementById(table_id);
  var rowCnt = tblObj.rows.length; // 行数
  if(rowCnt==2){alert("これ以上削除できません。");return;}
  tblObj.deleteRow(-1);// 末尾行を削除
}

function addColumn()
{ // 列追加 
  var tblObj=document.getElementById("myTBL");
  var rowCnt = tblObj.rows.length;　// 行数
  var colCnt = tblObj.rows[0].cells.length; // 行内セルの数
  var th = document.createElement( 'th' ); // <TH>要素を生成
  tblObj.rows[0].appendChild( th ); // 一行目に<TH>を付加
  tblObj.rows[0].cells[colCnt].innerHTML= " 行0-列"+colCnt; // セル内容
  for(var i=1;i<rowCnt;i++)
  {// 行数だけループして
    tblObj.rows[i].insertCell(-1);// 行をループしてセルを末尾に追加
    tblObj.rows[i].cells[colCnt].innerHTML= " 行"+i+"-列"+colCnt; // セル内容
  }
}

function delColumn()
{ // 列削除
  var tblObj=document.getElementById("myTBL");
  var rowCnt = tblObj.rows.length; // 行数
  var colCnt = tblObj.rows[0].cells.length;  // 行内セルの数
  if(colCnt==1)
  {
    alert("これ以上削除できません。");
    return;
  }
  for(var i=0;i< rowCnt;i++)
  {// 行数だけループして
    tblObj.rows[i].deleteCell(-1); // 行内セルを末尾から順に削除
  }
}
