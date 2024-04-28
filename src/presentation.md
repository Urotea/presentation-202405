---
marp: true
theme: academic
paginate: true
math: katex
footer: '@Urotea all rights reserved.'
---

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100..900&display=swap');
section {
  font-family: "Noto Sans JP", sans-serif;
  font-optical-sizing: auto;
  font-weight: <weight>;
  font-style: normal;
}
</style>

<!-- _class: lead -->

# App Routerの良いところを語らせてほしい

#### App Routerに完全移行したら最高だった話

<br>

**Urotea**

---

<!-- _header: 目次 -->

1. 自己紹介

1. （宣伝）App Routerに完全移行した話
1. はじめに
1. RSCが最高すぎる
1. コロケーションが最高すぎる
1. server actionsでさらにRSCが加速する
1. 良いことばかりではない
1. おわりに

---

<!-- _header: 自己紹介 -->

```js
export const selfIntroduction = {
  name: "柿森隆生",
  age: 32,
  work_for: [
    {
      name: "株式会社ANDPAD",
      since_year: 2021
      retirement_year: null,
    },
    {
      name: "NSSOL",
      since_year: 2016
      retirement_year: 2021,
    },
  ],
  languages: ["java", "kotlin", "swift", "golang", "ts"],
  sns: [
    {name: "Twitter", id: "@Urotea"},
    {name: "Misskey.io", id: "@use_on"},
  ],
}
```

---

<!-- _header: （宣伝）App Routerに完全移行した話 -->

https://zenn.dev/urotea/articles/3fbaa77d77b788

![height:350 center](https://res.cloudinary.com/zenn/image/upload/s--N74gF2lq--/c_fit%2Cg_north_west%2Cl_text:notosansjp-medium.otf_55:1%25E5%25B9%25B4%25E3%2581%258B%25E3%2581%2591%25E3%2581%25A6Next.js%25E3%2581%25AEapp%2520router%25E3%2581%25B8%25E5%25AE%258C%25E5%2585%25A8%25E7%25A7%25BB%25E8%25A1%258C%25E3%2581%2597%25E3%2581%259F%25E8%25A9%25B1%2Cw_1010%2Cx_90%2Cy_100/g_south_west%2Cl_text:notosansjp-medium.otf_37:urotea%2Cx_203%2Cy_121/g_south_west%2Ch_90%2Cl_fetch:aHR0cHM6Ly96ZW5uLWRldi5naXRodWIuaW8vZGVmYXVsdC1hdmF0YXJzL2RhcmsvdS5wbmc=%2Cr_max%2Cw_90%2Cx_87%2Cy_95/v1627283836/default/og-base-w1200-v2.png)

#### いいねをお待ちしております:smile:

---

<!-- _header: はじめに -->

このスライドでは私がPages RouterからApp Routerに全面移行して感じた良いところを紹介します。
Next.jsの機能に限らずRSCなどのReactの機能にも触れます。

細かいTipsや実装例は省略しますが、詳しく知りたい方はsns等で連絡ください。

---

<!-- _header: RSCが最高すぎる -->

#### asyncとawaitがそのまま使える

```ts
export default async function Page() {
  const res = await fetch('https://...');
  const data = await res.json();
  // ...
}
```

データフェッチでuseEffect、SWR、suspenseを使うのは難しいです。
asyncとawaitで書かせて欲しいとずっと思っていました。

asyncコンポーネントについて書いてある記事がなんとここに。
https://zenn.dev/urotea/articles/71f0afb4156a33

---

<!-- _header: コロケーションが最高すぎる -->

コロケーションとは、関連するものを近くに配置することです。

---
