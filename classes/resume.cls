\ProvidesClass{classes/resume}[2023/02/06 resume]

% (u)pLaTeX非互換パッケージに対して互換させるパッチを読み込む命令
\RequirePackage{plautopatch}

% 2カラム,A4,フォントサイズ9pt
\LoadClass[
    two column,
    paper=a4,
    fontsize=9pt,
    disablejfam,
    head_space=20mm,
    foot_space=20mm,
    gutter=15mm,
    fore-edge=15mm,
    column_gap=10mm]
    {jlreq}

\RequirePackage{ifptex}
\RequirePackage{ifluatex}

\PassOptionsToPackage{hyphens}{url}
\usepackage{secdot} % sectionの数字の後のドットの制御
\sectiondot{subsection}
\usepackage{setspace} % 行間設定用パッケージ
\setstretch{0.8} % 行間設定
\usepackage{caption} % キャプションとサブキャプションのパッケージ
\usepackage{subcaption}
\usepackage{here} % 好きな位置にfigなどを置くためのパッケージ
\usepackage{bm} % ベクトルを大文字で書くためのパッケージ
\usepackage[hyphens]{xurl} % URLを表示するためのパッケージ、ハイフンでの改行を許可
\urlstyle{same} % URLの表示形式を本文と同じにする
\usepackage{enumitem} % 高機能番号付き箇条書きのパッケージ
\usepackage{graphicx} % 画像の挿入、テキストや図の操作のためのパッケージ
\usepackage{amssymb, amsmath} % 高度な数式記述用パッケージ
\usepackage{mathtools} % 高度な数式記述用パッケージ
\usepackage{tabularray} % 高度な表組み用パッケージ
\usepackage{tgtermes} % 欧文、数式のフォントをtimes系に
\usepackage[T1]{fontenc} % 欧文フォントをT1エンコーディングに
% \usepackage{minted} % ソースコード表示の用パッケージ
\usepackage{siunitx} % SI単位記法に準拠した形式で単位を書くためのパッケージ
\usepackage{subfiles} % 大規模な文章を分割して記述して、統合するためのパッケージ
\usepackage{indentfirst} % 最初の段落でインデントするためのパッケージ
\usepackage{type1cm} % 文字の大きさを自由に変えるためのパッケージ

\ifptex
    \ifnativeuptex
    %upLaTeX
        \usepackage[dvipdfmx,unicode,hidelinks,pdfusetitle]{hyperref} % ハイパーリンクをつけるためのパッケージ、unicodeの使用を許可、リンクの下線を消す、pdfのメタデータをタイトルにする
    \else
    %pLaTeX
    \fi
\fi

\ifluatex
    % LuaLaTeX
    \usepackage{luatexja}
    \usepackage[unicode,hidelinks,pdfusetitle]{hyperref} % ハイパーリンクをつけるためのパッケージ、unicodeの使用を許可、リンクの下線罫線を消す、pdfのメタデータをタイトルにする、pdfのバージョンを1.4にする
    % \usepackage{hyperxmp} % PDFのメタデータを設定するためのパッケージ
\fi

\usepackage{tabularx} % 表の幅を指定するためのパッケージ
\usepackage[backend=biber,style=trad-unsrt]{biblatex} % biblatexを使用するためのパッケージ
\addbibresource{references.bib}
\DeclareFieldFormat{journaltitle}{\textit{#1}} % 日本語雑誌名を通常に、英語雑誌名を斜体に

%ページ数の書式
\pagestyle{empty}

% figの余白の調整
% \setlength{\intextsep}{0pt}

% キャプションとサブキャプションの設定
\captionsetup[figure]{labelsep=space, labelformat=simple, name=Fig., skip=3pt, font={stretch=0.8}}
\captionsetup[subfigure]{labelsep=space, labelformat=simple, name=Fig., skip=3pt, font={stretch=0.8}}
\renewcommand*{\thesubfigure}{(\alph{subfigure})}
\captionsetup[table]{labelsep=space, labelformat=simple, name=Table, skip=3pt, font={stretch=0.8}}

% sectionのサイズを合わせる
\RenewBlockHeading{section}{1}{font={\jlreq@keepbaselineskip{\normalsize\bfseries}},after_label_space=0\jlreq@zw}
\RenewBlockHeading{subsection}{2}{font={\jlreq@keepbaselineskip{\normalsize\bfseries}},after_label_space=0\jlreq@zw}
\RenewBlockHeading{subsubsection}{3}{font={\jlreq@keepbaselineskip{\normalsize\bfseries}},after_label_space=0\jlreq@zw}

% セクション類の空白の設定
\ModifyHeading{section}{before_space=5pt, after_space=5pt}
\ModifyHeading{subsection}{before_space=5pt, after_space=5pt}
\ModifyHeading{subsubsection}{before_space=5pt, after_space=5pt}
% セクションタイトルが一行以下なら下、２行以上なら上
% \ModifyHeading{section}{lines=1}
% \ModifyHeading{subsection}{lines=1}
% \ModifyHeading{subsubsection}{lines=1}

% セクションが連続する際の行取りを設定
\SetBlockHeadingSpaces{
    {_section{*},_subsection{before_space=0pt, after_space=5pt}}
    {_subsection{*},_subsubsection{before_space=0pt, after_space=5pt}}
}

% figの余白の調整
% \setlength{\intextsep}{0pt}

% タイトルの設定
\makeatletter
\renewcommand{\@maketitle}{\newpage
    \centering
    \fontsize{14pt}{14pt}\selectfont
    \@title
    \par

    \vspace{.5\jlreq@zh}
    \fontsize{10pt}{10pt}\selectfont
    \@author
    \par
    \vspace{2\jlreq@zh}
}
\normalsize
\makeatother
