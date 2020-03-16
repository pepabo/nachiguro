## nachiguro

nachiguro は SUZURI の CSS フレームワークです。那智黒石が名前の由来です。

## 開発フロー

開発用ブランチを作り、いつものように作業して、このリポジトリ (nachiguro) に push して PR を作成してください。

### ローカルの SUZURI で変更を確認するために

SUZURI でも新しくブランチを作り、`package.json` を開いてください。`dependencies` の中に `nachiguro` があるはずですから、そこの URL を

```json
  "dependencies": {
    "nachiguro": "github:pepabo/nachiguro#<nachiguro に push した branch 名>",
  },
```

のように変え (`<>` の記号は実際には書かないでください) 、 `docker-compose run --rm app npm install` コマンドを実行してください。

nachiguro に新たに push した commit をローカルの SUZURI に反映するときにもこのコマンドを実行してください。

### nachiguro の PR が approve されたら

PR を merge し、

```bash
git checkout master
git pull
```

してください。(いまの PR が merge された最新の master になるはずです。)

そうしたら `git tag` と打ってタグの一覧を確認してください。そして最新のタグより 1 つ数字を増やした新しいタグで

```bash
git tag <新しいタグ>
git push origin <新しいタグ>
```

を実行してください。

SUZURI 側では、さきほど変更確認用に作成したブランチで `package.json` を

```json
  "dependencies": {
    "nachiguro": "github:pepabo/nachiguro#<新しいタグ>",
  },
```

と書き換えて `npm install` を実行し、

```
git add package*.json
git commit
git push -u origin <ブランチ名>
```

としていつものように PR を作成し、approve をもらって merge してください。
