# 日本の政治家の写真集 | Japanese Politicians photo collection

## これは何 | What is this

- 日本の政治家の写真集です
- wikidataおよびwikimedia commonsのデータが元になっています


## データ構造 | Data structure
- public
  - politicians
    - A～Z

例

- `public/politicians/A/A/安倍晋三`
- `public/politicians/S/SU/菅義偉`

## 使い方 | Usage
政治家の写真が大量にほしいとき、
```
git clone --depth 1 https://github.com/yuiseki/politicians-photo-ja
```
とやって使えます

## 更新方法 | How to update
### セットアップ | Setup
`mecab-ipadic-neologd` が必須です

#### Ubuntu
```
sudo apt install mecab libmecab-dev mecab-ipadic-utf8 git make curl xz-utils file
git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd
cd mecab-ipadic-neologd
./bin/install-mecab-ipadic-neologd -n
```

### セットアップ完了後
```
./add-photo.sh 菅義偉
```

または

```
cat data/歴代内閣総理大臣.txt | ./add-photo.sh
```