# mrbc-pack

複数バージョンのmrubyコンパイラ(mrbc)をビルドし、1つのtar.gzファイルにまとめるツール。

## 概要

GitHub Actionsを使って、`versions.yaml`で定義された複数バージョンのmrubyをLinux向けにビルドし、GitHub Releasesに公開します。

## 使い方

### 1. ビルドするバージョンを定義

`versions.yaml`を編集して、ビルドしたいmrubyのバージョンを指定します：

```yaml
versions:
  - 2.0.1
  - 3.1.0
  - 3.2.0
  - 3.3.0
  - 3.4.0
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

ビルドが完了すると、GitHub Releasesに `build.tar.gz` が公開されます。

## 出力形式

各バージョンのmrbcバイナリと、対応するLICENSE/LEGALファイルが含まれます。

```
build.tar.gz
└── built/
    ├── mrbc-2.0.1
    ├── mrbc-2.0.1-LICENSE
    ├── mrbc-2.0.1-LEGAL
    ├── mrbc-3.1.0
    ├── mrbc-3.1.0-LICENSE
    ├── mrbc-3.1.0-LEGAL
    ├── ...
    ├── mrbc-3.4.0
    ├── mrbc-3.4.0-LICENSE
    └── mrbc-3.4.0-LEGAL
```

## 対応プラットフォーム

- Linux (x86_64)

## ライセンス

MIT License, 2025 Copyright (C) Poporon Network
ビルド済みのmrbcのライセンスは`mrbc-{version}-LICENSE`/`mrbc-{version}-LEGAL`をご覧ください．