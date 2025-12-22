# mrbc-pack

複数バージョンのmrubyコンパイラ(mrbc)をビルドし、1つのtar.gzファイルにまとめるツール。

## 概要

GitHub Actionsを使って、`versions.yaml`で定義された複数バージョンのmrubyをLinux向けにビルドし、GitHub Releasesに公開します。

## 使い方

### 1. ビルドするバージョンを定義

`versions.yaml`を編集して、ビルドしたいmrubyのバージョンを指定します：

```yaml
versions:
  - "3.0.0"
  - "3.1.0"
  - "3.2.0"
  - "3.3.0"
```

### 2. ワークフローを実行

1. GitHubリポジトリの **Actions** タブを開く
2. **Build mruby compilers** ワークフローを選択
3. **Run workflow** をクリック
4. パラメータを入力：
   - **Branch**: `versions.yaml`が含まれるブランチ（デフォルト: `main`）
   - **Release tag**: リリースタグ名（例: `v1.0.0`）
5. **Run workflow** をクリックして実行

### 3. リリースをダウンロード

ビルドが完了すると、GitHub Releasesに `mrbc-pack-{tag}.tar.gz` が公開されます。

```bash
# ダウンロードして展開
tar -xzf mrbc-pack-v1.0.0.tar.gz

# 使用例
./mrbc-3.3.0 your_script.rb
```

## 出力形式

```
mrbc-pack-{tag}.tar.gz
├── mrbc-3.0.0
├── mrbc-3.1.0
├── mrbc-3.2.0
└── mrbc-3.3.0
```

## 対応プラットフォーム

- Linux (x86_64)

## ライセンス

このリポジトリのコードはMITライセンスです。
mrubyのライセンスについては[mruby/mruby](https://github.com/mruby/mruby)を参照してください。
