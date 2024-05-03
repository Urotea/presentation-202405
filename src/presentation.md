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
table {margin-left: auto;margin-right: auto;display:table;}
</style>

<!-- _class: lead -->

# App Routerの好きなところを語る

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
1. server actionsでさらにRSCが最高に
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
  languages: ["java", "kotlin", "swift", "golang", "python", "ts", "k8s"],
  sns: [
    {name: "Twitter", id: "@Urotea"},
    {name: "Misskey.io", id: "@use_on"},
  ],
}
```

---

<!-- _header: 自己紹介 -->

- NSSOL時代
  - springでjavaエンジニアとしてキャリアをスタート
  - とあるプロジェクトでAndroidアプリ開発に携わる
  - 同プロジェクトのiOSアプリも担当
  - 別プロジェクトで機械学習やgolangをさらっと触れる
- アンドパッドに転職
  - テックリードとして全体を見つつ主にフロントエンドとインフラを担当

好きなこと：開発の足回りを整えること（CI、 CD、 テスト、 ドキュメント）

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

- https://twitter.com/Urotea
- https://misskey.io/@use_on

---

<!-- _header: RSCが最高すぎる -->

そのコンポーネントは本当にブラウザで組み立てる必要がありますか。
サーバーでHTMLを組み立てた方がシンプルになります。

- ページ遷移も、SEOも、パフォーマンスが改善
- ローディングも、エラー処理も、すべてが簡単に
- レイアウトシフトも考える必要がない

:sparkles:Next.jsのRSCはSPAの恩恵を受けつつ、サーバーサイドレンダリングの恩恵も受けられます。

---

<!-- _header: RSCが最高すぎる -->

```ts
export default async function Page() {
  const res = await fetch('https://...');
  const data = await res.json();
  // ...
}
```

コンポーネント内で非同期処理を書くときHooksを使いますが、難しいですよね。

:+1:RSCでは慣れ親しんだasyncとawaitがそのまま使えます。

---

<!-- _header: コロケーションが最高すぎる -->

コロケーションとは、関連するものを近くに配置することです。

| Pages Router | App Router |
| --- | --- |
| ![height:400](https://urotea.github.io/presentation-202405/images/pagesRouterPath.png) | ![height:400](https://urotea.github.io/presentation-202405/images/appRouterPath.png) |

---

<!-- _header: コロケーションが最高すぎる -->

#### eslintでpackage privateが実現できます

typescriptのexportはプロジェクト全体に影響しますが、eslint-plugin-import-accessを使うとpackage privateが実現できます。
https://zenn.dev/uhyo/articles/eslint-plugin-import-access

![h:300 center](https://res.cloudinary.com/zenn/image/upload/s--pqktcKqv--/c_fit%2Cg_north_west%2Cl_text:notosansjp-medium.otf_55:eslint-plugin-import-access%25E3%2581%25A7%25E3%2581%25AF%25E3%2581%2598%25E3%2582%2581%25E3%2582%258B%25E3%2583%2587%25E3%2582%25A3%25E3%2583%25AC%25E3%2582%25AF%25E3%2583%2588%25E3%2583%25AA%25E5%258D%2598%25E4%25BD%258D%25E3%2582%25AB%25E3%2583%2597%25E3%2582%25BB%25E3%2583%25AB%25E5%258C%2596%2Cw_1010%2Cx_90%2Cy_100/g_south_west%2Cl_text:notosansjp-medium.otf_37:uhyo%2Cx_203%2Cy_121/g_south_west%2Ch_90%2Cl_fetch:aHR0cHM6Ly9zdG9yYWdlLmdvb2dsZWFwaXMuY29tL3plbm4tdXNlci11cGxvYWQvYXZhdGFyLzVjYjFlMDJlNGQuanBlZw==%2Cr_max%2Cw_90%2Cx_87%2Cy_95/v1627283836/default/og-base-w1200-v2.png)

---

<!-- _header: server actionsでさらにRSCが最高に -->

最近発表されたserver actionsで、RSCはさらに強化します。
なんとクライアントサイドjs無しでformのsubmitができます。

```ts
async function createItem(formData) {
  'use server'
  // ...
}
// Server Component
export default async function Home() {
  return (
    <form action={createItem}>
      <input type="text" name="field-name" />
      <SubmitButton />
    </form>
  )
}
```

---

<!-- _header: server actionsでさらにRSCが最高に -->

すべてRSCに寄せなくても十分使えます。
App Routerを使うなら、更新系リクエストはserver actionsの利用を検討してください。
formで登録成功後にリダイレクトするときも、サーバーサイドでリダイレクトできます。

また、server actionsを使うことでApp Routerのキャッシュを有効活用できます。

:+1:App Routerでserver actionsを使わない手はない。

---

<!-- _header: 良いことばかりではない -->

:cry:App Routerは本当にキャッシュが難しい。
https://nextjs.org/docs/app/building-your-application/caching

![height:250 center](https://urotea.github.io/presentation-202405/images/caching-overview.avif)

:sparkles:とりあえずすべてのキャッシュをOFFにするのがおすすめです。
Next.js v14.2からキャッシュが少し柔軟になります。
https://nextjs.org/blog/next-14-2#staletimes-experimental

---

<!-- _header: おわりに -->
