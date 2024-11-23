%----------------------------------------------------------------------------------------------------%
%
% -> Class Clarification
%
%----------------------------------------------------------------------------------------------------%
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{hitrep}[2024/11/15 v0.1 Report template for student in Harbin Institute of Technology]

\LoadClass[zihao = -4]{ctexart}

%----------------------------------------------------------------------------------------------------%
%
% -> Package
%
%----------------------------------------------------------------------------------------------------%
% ----- Control -----
\RequirePackage{ifthen}
\RequirePackage{ifplatform}

% ----- Layout -----
\RequirePackage[a4paper,hmargin=3.17cm,vmargin=2.54cm]{geometry}

% ----- Fix font size -----
\RequirePackage{anyfontsize}

% ----- Footer -----
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

% ----- Color -----
\RequirePackage{color}
\RequirePackage[dvipsnames, svgnames, x11names]{xcolor}

% ----- Enum list -----
% \RequirePackage{enumerate}
\RequirePackage{enumitem}

% ----- Math -----
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{bm}

% ----- Links -----
\RequirePackage[
    hidelinks,
    breaklinks = true,
    bookmarksopen = true,
    bookmarksopenlevel = 2
]{hyperref}

% ----- References -----
\RequirePackage[nameinlink]{cleveref}

% ----- Float element -----
\RequirePackage{float}
\RequirePackage{caption}

% ----- Table -----
\RequirePackage{booktabs}
\RequirePackage{makecell}
\RequirePackage{multirow}

% ----- Images -----
\RequirePackage{graphicx}
\RequirePackage{subcaption}

% ----- Algorithms -----
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage[noend]{algpseudocode}

%----------------------------------------------------------------------------------------------------%
%
% -> Options
%
%----------------------------------------------------------------------------------------------------%
\gdef\hitrep@readingreport{读书报告}
\gdef\hitrep@experimentalreport{实验报告}
\gdef\hitrep@reporttype{\hitrep@experimentalreport}

\DeclareOption{exp}{\gdef\hitrep@reporttype{\hitrep@experimentalreport}}
\DeclareOption{reading}{\gdef\hitrep@reporttype{\hitrep@readingreport}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

%----------------------------------------------------------------------------------------------------%
%
% -> Global Variables
%
%----------------------------------------------------------------------------------------------------%
\gdef\hitrep@subject{}
\NewDocumentCommand{\subject}{m}{
    \gdef\hitrep@subject{#1}
}
\gdef\hitrep@department{}
\NewDocumentCommand{\department}{m}{
    \gdef\hitrep@department{#1}
}
\gdef\hitrep@major{}
\NewDocumentCommand{\major}{m}{
    \gdef\hitrep@major{#1}
}
\gdef\hitrep@author{}
\RenewDocumentCommand{\author}{m}{
    \gdef\hitrep@author{#1}
}
\gdef\hitrep@studentid{}
\NewDocumentCommand{\studentid}{m}{
    \gdef\hitrep@studentid{#1}
}
\gdef\hitrep@studenttype{}
\NewDocumentCommand{\studenttype}{m}{
    \gdef\hitrep@studenttype{#1}
}

%----------------------------------------------------------------------------------------------------%
%
% -> Layout
%
%----------------------------------------------------------------------------------------------------%
\renewcommand*{\baselinestretch}{1.5}
\setlength{\baselineskip}{16pt}
\setlength{\parskip}{12pt}

%----------------------------------------------------------------------------------------------------%
%
% -> Table of Content
%
%----------------------------------------------------------------------------------------------------%
\newcommand{\toc}{
    \phantomsection
    \addcontentsline{toc}{section}{\contentsname}
    \tableofcontents
}

%----------------------------------------------------------------------------------------------------%
%
% -> Fonts
%
%----------------------------------------------------------------------------------------------------%
\setmainfont{Times New Roman}

\ifwindows
    \setCJKmainfont[AutoFakeBold, AutoFakeSlant]{SimSun}
\fi
\ifmacosx
    \setCJKmainfont[AutoFakeBold, AutoFakeSlant]{Songti SC}
\fi

%----------------------------------------------------------------------------------------------------%
%
% -> Footer
%
%----------------------------------------------------------------------------------------------------%
\pagestyle{fancy}
\newcommand{\hitrep@footmark}{\zihao{5}第~~~\thepage{}~~~页~~（共~~\pageref{LastPage}~~页）\phantom{mmm}}
\fancyhf{}
\fancyfoot[R]{\hitrep@footmark}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.5bp}

%----------------------------------------------------------------------------------------------------%
%
% -> Enum List
%
%----------------------------------------------------------------------------------------------------%
\setlength{\itemindent}{0pt}

%----------------------------------------------------------------------------------------------------%
%
% -> Cover
%
%----------------------------------------------------------------------------------------------------%
\RequirePackage{xeCJKfntef}

\newcommand{\hitrep@optiontitle}[2][3.81cm]{\begin{CJKfilltwosides}[b]{#1}#2\end{CJKfilltwosides}}

\newcommand{\hit@year}{\ifnum\month>1 {\the\year}\else {\the\numexpr\year-1\relax}\fi}
\newcommand{\hit@semester}{\ifcase \month \or 秋\or 春\or 春\or 春\or 春\or 春\or 夏\or 夏\or 秋\or 秋\or 秋\or 秋\fi}

\renewcommand{\maketitle}{
    \begin{center}
        {\zihao{-2}\heiti \uline{\ \ \hit@year\ \ }年\uline{\ \ \hit@semester\ \ }季学期研究生课程考核}

        {\zihao{-3}\heiti \hitrep@reporttype}
    \end{center}
    {
        \zihao{4}
        \renewcommand{\arraystretch}{1.5}
        \noindent\begin{tabular}{@{}p{4cm}@{}p{5.07cm}@{}p{2.86cm}@{}p{2.73cm}@{}}
            \hitrep@optiontitle{考核科目}           & \multicolumn{3}{@{}l@{}}{: \hitrep@subject} \\
            \hitrep@optiontitle{学生所在院（系）}   & \multicolumn{3}{@{}l@{}}{: \hitrep@department} \\
            \hitrep@optiontitle{学生所在学科}       & \multicolumn{3}{@{}l@{}}{: \hitrep@major} \\
            \hitrep@optiontitle{学生姓名}           & \multicolumn{3}{@{}l@{}}{: \hitrep@author} \\
            \hitrep@optiontitle{学号}               & \multicolumn{3}{@{}l@{}}{: \hitrep@studentid} \\
            \hitrep@optiontitle{学生类别}           & \multicolumn{3}{@{}l@{}}{: \hitrep@studenttype} \\
            \hitrep@optiontitle{考核结果}           &                       & \hitrep@optiontitle[2.15cm]{阅卷人} &
        \end{tabular}
    }
    \zihao{-4}
    \newpage
}

%----------------------------------------------------------------------------------------------------%
%
% -> Algorithms
%
%----------------------------------------------------------------------------------------------------%
\floatname{algorithm}{算法}

\renewcommand{\algorithmicrequire}{\textbf{输入：}}
\renewcommand{\algorithmicensure}{\textbf{输出：}}

\newcommand{\Break}{\State\textbf{break}}
\renewcommand{\Call}[2]{#1(#2)}
\newcommand{\Get}{ $\gets$ }

\algrenewtext{Function}[2]{\textbf{function} #1(#2)}

%----------------------------------------------------------------------------------------------------%
%
% -> Caption
%
%----------------------------------------------------------------------------------------------------%
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{sfive}{\zihao{5}}

\captionsetup{
    format          =   plain,
    labelsep        =   quad,
    font            =   { song, sfive },
    justification   =   centering
}

\AtBeginDocument{
    \crefformat{table}{#2表 #1#3 }
    \crefformat{figure}{#2图 #1#3 }
    \crefformat{subfigure}{#2图 #1#3 }
    \crefformat{equation}{#2公式 (#1)#3 }
    \crefformat{algorithm}{#2算法 #1#3 }
    \crefformat{subsection}{ #2#1 小节#3}

    \crefrangeformat{equation}{公式(#3#1#4) $\sim$ (#5#2#6)}
}

%----------------------------------------------------------------------------------------------------%
%
% -> Title Style
%
%----------------------------------------------------------------------------------------------------%
\RequirePackage{titlesec}

\titleformat{\section}{\songti \bf \zihao{-3}}{\thesection}{1em}{}

\titleformat{\subsection}{\songti \bf \zihao{4}}{\thesubsection}{1em}{}

\titleformat{\subsubsection}{\songti \bf \zihao{-4}}{\thesubsubsection}{1em}{}

%----------------------------------------------------------------------------------------------------%
%
% -> Math Formula
%
%----------------------------------------------------------------------------------------------------%
\everymath{\displaystyle}
\setlength{\abovedisplayskip}{0pt}
\setlength{\belowdisplayskip}{0pt}

%----------------------------------------------------------------------------------------------------%
%
% -> References
%
%----------------------------------------------------------------------------------------------------%
\RequirePackage{gbt7714}

\bibliographystyle{gbt7714-numerical}

%----------------------------------------------------------------------------------------------------%
%
% -> New Environments
%
%----------------------------------------------------------------------------------------------------%
\newcounter{hitrep@counter@numpar}
\def\hitrep@oldcmd@item{\item}
\newenvironment{numpar}{%
    \def\item{\par\refstepcounter{hitrep@counter@numpar}(\thehitrep@counter@numpar) }%
}{%
    \setcounter{hitrep@counter@numpar}{0}%
    \def\item\hitrep@oldcmd@item%
}
