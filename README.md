## これだけは抑えておくポイント
- ViewControllerで画面を追加するときは，画面に対応するクラスファイルを作成する．
- ボタンを押しても何も起こらないときは関連付けを確認してみる．

## エラーが起きたところの原因，解決法
- safe area layout guide before ios 9.0のエラーが2つ出た．  
  1つ目は，Main.storyboardの一番左のペーパー形のアイコンからUse safe area layout guidesのチェックをはずしたら解消された．
  2つ目は，DeploymentTargetを８.0から10.0にしたら解決した．

- Views without any layout constraints may clip their content or overlap other viewsのエラーが出た．  
  これはMain.storyboardの三角のような形のアイコン(Resolve Auto Layout Issuesというらしい)からReset to Suggested Constraintsを選択すると解消された．


## テキストの改善点
- DeploymentTargetを８.0にする指示があったが，エラーが出てしまったので確認する必要がある．

  
