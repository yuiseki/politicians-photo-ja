const fs = require('fs');

const Mecab = require('mecab-async');
const jaconv = require('jaconv');

const { program } = require('commander');
program.version('0.0.1');

const { transform } = require('@moneyforward/stream-util');

const mecab = new Mecab();
mecab.command = "mecab -d /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd";

const parse = (text) => {
  mecab.parse(text, (error, result) => {
    const readings = [];
    for (const token of result) {
      readings.push(token[9]);
    }
    const katakana = readings.join('')[0];
    const hiragana = jaconv.toHiragana(katakana);
    const hebon = jaconv.toHebon(hiragana);
    console.log(hebon);
    fs.mkdirSync(`public/politicians/${hebon[0]}/${hebon}/${text}`, {recursive: true});
  })
}

if (require.main === module) {
  program.parse(process.argv);
  if (program.args.length) {
    const text = program.args[0];
    parse(text);
  } else {
    (async () => {
      for await (const line of process.stdin.pipe(new transform.Lines()) ) {
        parse(line);
      }
    })();
  }
}
