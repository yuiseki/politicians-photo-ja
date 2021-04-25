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
```
./add-photo.sh 菅義偉
```

または

```
cat data/歴代内閣総理大臣.txt | ./add-photo.sh
```