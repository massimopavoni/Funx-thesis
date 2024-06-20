% LaTeX Class 'unicam_thesis' for composing MSc and BSc thesis
% 
% Originally written by
% Andrea Polini <andrea.polini@unicam.it>
% Francesco De Angelis <francesco.deangelis@unicam.it>
% 
% Revised and simplified by Massimo Pavoni for multi-language support and other smaller improvements

% Document class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unicam-thesis}[2024/05/29 - LaTeX class for composing thesis at
  University of Camerino - School of Science and Technologies]

% Get limited language options from the document
\DeclareOption{italian}{\PassOptionsToPackage{\CurrentOption}{babel,varioref}}
\DeclareOption{english}{\PassOptionsToPackage{\CurrentOption}{babel,varioref}}

\newcommand{\@ptoption}{1pt}
\newcommand{\@type}{twoside}
% \DeclareOption{10pt}{\renewcommand{\@ptoption}{0pt}}
% \DeclareOption{11pt}{\renewcommand{\@ptoption}{1pt}}
% \DeclareOption{12pt}{\renewcommand{\@ptoption}{2pt}}
% \DeclareOption{twoside}{\renewcommand{\@type}{twoside}}
% \DeclareOption{oneside}{\renewcommand{\@type}{oneside}}
% \DeclareOption{pdf}{\pdftrue}
\ExecuteOptions{oneside,12pt}
\ProcessOptions{\relax}

% Load book class for a4 paper size
\LoadClass[\@type,a4paper,1\@ptoption]{book}

% ----------------------------------------------------------------
% Load support packages

% Page geometry
\RequirePackage[top=3cm, bottom=3cm, inner=3.5cm, outer=3cm]{geometry}

% Character sets
\RequirePackage[utf8]{inputenc}
\RequirePackage[T3,T1]{fontenc}

\RequirePackage[x11names]{xcolor}
\RequirePackage{colortbl}
\RequirePackage{graphicx}
\RequirePackage{makeidx}
\RequirePackage{wrapfig}
\RequirePackage[metapost]{mfpic}
\RequirePackage{arydshln}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{subfig}
\RequirePackage{xspace}
\RequirePackage{array}
\RequirePackage{times}
\RequirePackage{longtable}
\RequirePackage{fancyhdr}
\RequirePackage[noenc, safe]{tipa}

\pagestyle{fancy}

\setlength{\headheight}{15pt}
\renewcommand{\sectionmark}[1]{\markright{#1}{}} \fancyhf{}
\fancyhead[LE]{\textit{\nouppercase{\rightmark}}}
\fancyhead[RO]{\textit{\nouppercase{\rightmark}}}
\fancyfoot[LE,RO]{\thepage}

\fancypagestyle{plain}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

% \RequirePackage{helvet}
\renewcommand{\familydefault}{\rmdefault}
\renewcommand{\rmdefault}{cmr}

\RequirePackage{varioref}
\RequirePackage{babel}

\makeindex
\date{}

\RequirePackage[nottoc,notlof,notlot]{tocbibind}

\RequirePackage[babel]{csquotes}
\RequirePackage[style=alphabetic, backend=biber]{biblatex}

% More useful packages because nobody thought about them

\RequirePackage{float}
\RequirePackage{tabularx}
\RequirePackage{tikz}

\usetikzlibrary{3d}
\usetikzlibrary{arrows.meta}

\RequirePackage{simplebnf}

\newenvironment{spacedbnf}
{\begin{bnf}(prod-sep=5pt, row-sep=2pt)}
    {\end{bnf}}

\RequirePackage[final]{listings}

\lstdefinelanguage{Funx}{
  keywords={let, in, with, out, module},
  otherkeywords={=, :, ->, \\, if, then, else, fi, ., /, \%, *, +, -, !!, ||, &&, <, <=, >, >=, ==, !=, \$, Bool, Int, True, False},
  morekeywords=[2]{if, then, else, fi},
  morekeywords=[3]{., /, \%, *, +, -, !!, ||, &&, <, <=, >, >=, ==, !=, \$},
  morekeywords=[4]{Bool, Int},
  morekeywords=[5]{True, False},
  sensitive=true
}

\lstdefinestyle{funxCode}{
  language=Funx,
  frame=tbrl,
  basicstyle=\scriptsize\ttfamily,
  keywordstyle=\color{Firebrick3}\bfseries\ttfamily,
  keywordstyle=[2]\color{Purple1}\bfseries\ttfamily,
  keywordstyle=[3]\color{Green4}\bfseries\ttfamily,
  keywordstyle=[4]\color{RoyalBlue3}\bfseries\ttfamily,
  keywordstyle=[5]\color{Coral4}\bfseries\ttfamily,
  stringstyle=\itshape,
  flexiblecolumns=true,
  captionpos=b,
  abovecaptionskip=10pt,
  belowcaptionskip=0pt,
  frame=single,
  numbers=left,
  numberstyle={\tiny }
}

\lstdefinestyle{javaCode}{
  language=Java,
  frame=tbrl,
  basicstyle=\scriptsize\ttfamily,
  keywordstyle=\ttfamily\bf,
  stringstyle=\itshape,
  flexiblecolumns=true,
  commentstyle=\itshape,
  captionpos=b,
  abovecaptionskip=10pt,
  belowcaptionskip=0pt,
  frame=single,
  numbers=left,
  numberstyle={\tiny }
}

\RequirePackage[pdftex,bookmarks=true,colorlinks=true,linkcolor=black,citecolor=black]{hyperref}

% ---------------------------------------------------------------------------
% --- Numbering
% ---------------------------------------------------------------------------
%\setcounter{secnumdepth}{1}

% ---------------------------------------------------------------------------
% --- Empty pages...
% ---------------------------------------------------------------------------

\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}
\let\cleardoublepage\clearemptydoublepage


% ---------------------------------------------------------------------------
% --- FRONTPAGE
% ---------------------------------------------------------------------------
\newcommand{\mychaptertitlefont}{\fontseries{s}\fontsize{20}{24}\selectfont}
\newcommand{\mytitlefont}{\fontseries{b}\sc\fontsize{15}{24}\selectfont}
\newcommand{\mysubtitlefont}{\fontseries{s}\fontsize{13}{16}\selectfont}
\newcommand{\authorfont}{\fontseries{s}\fontsize{14}{14}\selectfont}
\newcommand{\largefont}{\fontseries{s}\fontsize{18}{14}\selectfont}
\newcommand{\bigfont}{\fontseries{s}\fontsize{20}{14}\selectfont}
\newcommand{\biggerfont}{\fontseries{s}\fontsize{26}{22}\selectfont}

\def\author#1{\gdef\@theauthor{#1}}
\def\university#1{\gdef\@theuniversity{#1}}
\def\school#1{\gdef\@theschool{#1}}
\def\course#1{\gdef\@thecourse{#1}}
\def\advisor#1{\gdef\@theadvisor{#1}}
\def\coadvisor#1{\gdef\@thecoadvisor{#1}}
\def\coadvisor1#1{\gdef\@thecoadvisor1{#1}}
\def\coadvisor2#1{\gdef\@thecoadvisor2{#1}}
\def\academicyear#1{\gdef\@theacademicyear{#1}}
\def\matricola#1{\gdef\@thematricola{#1}}

\def\title#1{\gdef\@thetitle{#1}}
\def\subtitle#1{\gdef\@thesubtitle{#1}}

\def\deliverabletype#1{\gdef\@thedeliverabletype{#1}}
\def\deliverableno#1{\gdef\@thedeliverableno{#1}}
\def\naturedeliverable#1{\gdef\@thenaturedeliverable{#1}}
\def\disseminationlevel#1{\gdef\@thedisseminationlevel{#1}}
\def\internalno#1{\gdef\@theinternalno{#1}}
\def\contractualdeliverydate#1{\gdef\@thecontractualdeliverydate{#1}}
\def\actualdeliverydate#1{\gdef\@theactualdeliverydate{#1}}
\def\contributingwp#1{\gdef\@thecontributingwp{#1}}
\def\editors#1{\gdef\@theeditors{#1}}
\def\reviewers#1{\gdef\@thereviewers{#1}}

\def\@theauthors{}
\def\@thetitle{}
\def\@thesubtitle{}

\newcommand{\HRule}{\rule{\linewidth}{0pt}}

% Italian captions
\addto{\captionsitalian}{
  \renewcommand{\contentsname}{Indice}
  \renewcommand{\figurename}{Figura}
  \renewcommand{\tablename}{Tabella}
  \renewcommand{\lstlistingname}{Codice}
  \renewcommand{\lstlistlistingname}{Elenco dei codici}
  \gdef\@schoolComplete{Scuola di \@theschool}
  \gdef\@courseComplete{Corso di \@thecourse}
  \gdef\@authorDesc{Laureando}
  \gdef\@advisorDesc{Relatore}
  \gdef\@studentIDDesc{Matricola}
  \gdef\@academicYearDesc{A.A.}
}

% English captions
\addto{\captionsenglish}{
  \renewcommand{\contentsname}{Contents}
  \renewcommand{\figurename}{Figure}
  \renewcommand{\tablename}{Table}
  \renewcommand{\lstlistingname}{Code}
  \renewcommand{\lstlistlistingname}{List of codes}
  \gdef\@schoolComplete{School of \@theschool}
  \gdef\@courseComplete{\@thecourse}
  \gdef\@authorDesc{Student}
  \gdef\@advisorDesc{Advisor}
  \gdef\@studentIDDesc{Student ID}
  \gdef\@academicYearDesc{A.Y.}
}

\renewcommand{\maketitle}{%
\thispagestyle{empty}
%\enlargethispage{4\baselineskip}
\setlength{\parindent}{0mm}
\setlength{\parskip}{0mm}

\begin{center}
  \includegraphics[width=15mm]{Resources/Images/university-crest}\par%
  \vspace{0.15cm}%
  {\rmfamily \Large \bfseries \@theuniversity \par}%
  \vspace{0.15cm}%
  \hrule%
  \vspace{0.15cm}%
  {\rmfamily \Large \scshape \@schoolComplete \par}%
  \vspace{0.15cm}%
  {\rmfamily \large \@courseComplete \par}%
  \vspace*{\stretch{7}}%
  {\rmfamily \LARGE \bfseries \@thetitle \par}%
  \vspace*{\stretch{7}}%
  {\@authorDesc \hfill \@advisorDesc \par}%
  {\bfseries \large \@theauthor \hfill \@theadvisor \par}%
\end{center}
{\bfseries \small \@studentIDDesc\ \@thematricola}%
\begin{center}
  \vspace*{\stretch{7}}%
  \hrule%
  \vspace{0.15cm}%
  {\large \@academicYearDesc\ \@theacademicyear}%
\end{center}

\newpage
\setlength{\parindent}{1em}
\setlength{\parskip}{2pt}
\cleardoublepage
}



% ---------------------------------------------------------------------------
%    Headers
% ---------------------------------------------------------------------------
\pagestyle{fancy}

%\fancyhead{}
%\fancyhead[RO,LE]{\thepage}
%\fancyhead[LO,RE]{\small\nouppercase\leftmark}
%\fancyfoot[F]{}

%\renewcommand{\plainheadrulewidth}{1pt}
%\renewcommand{\headrulewidth}{1pt}


% \renewcommand{\headrulewidth}{0.4pt}
% \renewcommand{\footrulewidth}{0.4pt}

% \lhead{\@thedate}
% \chead{}
% \rhead{\@tas3 Consortium}
% \lfoot{\@tas3 ICT-216287}
% \cfoot{}
% \rfoot{\thepage/\pageref{LastPage}}

% % make space for the rule
% \fancypagestyle{plain}{%
%   \lhead{\@thedate}
%   \chead{}
%   \rhead{\@tas3 Consortium}
%   \lfoot{\@tas3 ICT-216287}
%   \cfoot{}
%   \rfoot{\thepage/\pageref{LastPage}}
% }

% ---------------------------------------------------------------------------
% --- MISC COMMANDS
% ---------------------------------------------------------------------------

\newcommand{\localized}[2]{%
  \iflanguage{italian}{#1}{%
    \iflanguage{english}{#2}{%
      % Add more language conditions as needed
      \PackageError{unicam_thesis}{Unsupported language}{The selected language is not supported.}%
    }%
  }%
}

\def\date#1{\gdef\@thedate{#1}}

% \newcommand{\comment}[2]{}
% \newcommand{\comment}[2]{\marginpar{\textcolor{red}{\ding{74}}}\footnote{\textcolor{red}{\it\scriptsize {\textbf{\sf \underline{#1}:~}#2}}}}



\newcommand{\abstract}[1]{
  \newpage
  \noindent
  \fbox{\parbox{.98\linewidth}{
      \vspace{-5mm}
      \section*{Abstract}
      \par
      #1
    }}\\[1cm]}
\newcommand{\keywords}[1]{
  \noindent\fbox{\parbox{.98\linewidth}{
      \vspace{-5mm}
      \section*{Keyword List }
      \par
      #1
    }}
}

\setlength{\baselineskip}{17pt}





%\addtolength{\leftskip}{10mm}

%\titleformat{\chapter}[display]
%  {\bfseries\LARGE}
%  {\filleft\MakeUppercase{\chaptertitlename} \Huge\thechapter}
%  {1ex}{\titlerule\vspace{3ex}\filright}

% \titleformat{name=\chapter,numberless=false}[display]
%   {\large}
%   {\vspace{-12mm}}
%   {1ex}{\mychaptertitlefont \thechapter \hspace{4mm}}

% \titleformat{name=\chapter,numberless=true}[display]
%   {\large}
%   {\vspace{-12mm}}
%   {1ex}{\mychaptertitlefont}


%\titlespacing{\chapter}{0mm}{*0}{*1}

%\titleformat{\chapter}[leftmargin]
%  {\bfseries\LARGE}
%  {\filleft\MakeUppercase{\chaptertitlename} \Huge\thechapter}
%  {1ex}{\titlerule\vspace{3ex}\filright}

%\titleformat{\section}
%    {\bfseries\Large\upshape}
%    {\thesection.}{.2em}{}

%\titlespacing{\section}{-12mm}{*2}{*2}

%\titleformat{\subsection}
%    {\vspace{.8ex}\bfseries\large}
%    {\thesubsection}{.5em}{}
% per ripristinare il numero di subsection sostituire la riga qui sopre
% con quella qui sotto...
%    {\thesubsection.}{.5em}{}

%\titlespacing{\subsection}{-6mm}{*2}{*2}

%\titleformat{\subsubsection}[runin]
%    {\vspace{.8ex}\bfseries\normalsize\slshape}
%    {\quadratino}{.5em}{}[.]

%\titlespacing{\subsubsection}{0mm}{*1}{*1}

%\newcommand{\rilegatura}{2mm}
%\addtolength\oddsidemargin{\rilegatura}
%\addtolength\evensidemargin{-\rilegatura}

% \titlecontents{part}[0pt] {\addvspace{4mm} 
%   \sc
%   \Large}{\thecontentslabel\quad}{}{\titlerule*[5pt]{}\contentspage}

% \titlecontents{chapter}[0pt] {\addvspace{4mm} 
% %  \bfseries
%   \large}{\thecontentslabel\quad}{}{\titlerule*[5pt]{.}\contentspage}

% \titlecontents{section}[4mm] {\addvspace{2pt} 
% %  \bfseries
%   }{\thecontentslabel\quad}{}{\titlerule*[5pt]{.}\contentspage}

% \titlecontents{subsection}[9mm] {\addvspace{2pt}}
%   {\thecontentslabel\quad}{}{\titlerule*[5pt]{.}\contentspage}

% \titlecontents{figure}[0pt] {\addvspace{4mm}}{Figure
%   \thecontentslabel :\enspace}{}{\titlerule*[5pt]{.}\contentspage}

% \titlecontents{table}[0pt] {\addvspace{4mm}}{Table
%   \thecontentslabel :\enspace}{}{\titlerule*[5pt]{.}\contentspage}


\newcommand{\historyitem}[3]{
  #1 & #2 & #3 \\ \hline
}
\newenvironment{history}
{
  \newpage
  \section*{Document History}
  \begin{tabular}{|p{20mm}|p{82mm}|p{40mm}|}
    \hline
    \textbf{Version} & \textbf{Type of change} & \textbf{Author(s)} \\
    \hline
    }
    {
  \end{tabular}
}
\newcommand{\reviewitem}[4]{
  #1 & #2 & #3 & #4 \\ \hline
}
\newenvironment{review}
{
  \newpage
  \section*{Document Reviews}
  \begin{tabular}{|p{22mm}|p{20mm}|p{33mm}|p{63mm}|}
    \hline
    \textbf{Date} & \textbf{Version} & \textbf{Reviewer} & \textbf{Comment} \\
    \hline
    }
    {
  \end{tabular}
}
\newcommand{\acronym}[2]{
  #1 & #2 \\ \hline
}
\newenvironment{acronyms}
{
  \newpage
  \chapter*{Table of Acronyms}
  \addcontentsline{toc}{chapter}{Table of Acronyms}
  \begin{tabular}{|>{\centering}p{41mm}|p{106mm}|}
    \hline
    \textbf{Acronym} & \textbf{Expanded Version} \\
    \hline
    }
    {
  \end{tabular}
}



\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{plain}%
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
      \refstepcounter{chapter}%
      \typeout{\@chapapp\space\thechapter.}%
      \addcontentsline{toc}{chapter}%
      {\protect\numberline{\thechapter}#1}%
    \else
      \addcontentsline{toc}{chapter}{#1}%
    \fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]%
  \else
    \@makechapterhead{#2}%
    \@afterheading
  \fi}
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
    \Huge \bfseries % \@chapapp\space
    \thechapter .  #1\par\nobreak
    %        \par\nobreak
    %        \vskip 20\p@
    %      \fi
    %    \fi
    %    \interlinepenalty\@M
    %    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@schapter#1{\if@twocolumn
    \@topnewpage[\@makeschapterhead{#1}]%
  \else
    \@makeschapterhead{#1}%
    \@afterheading
  \fi}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}