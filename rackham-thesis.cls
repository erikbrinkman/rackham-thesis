% This is an option style (substyle) for writing a dissertation
% in the Rackham required format using reportx.sty.  -- jin ji, 1/88
% Modified on 05/19/88, jj.
% Modified on 12/13/88, for "CHAPTER" in toc and \@makecaption, jj.
% Modified on 01/08/89, for sections in loap (look for \@sect), jj.
% Modified on 89/11/29  by tex
%          Removed the last three lines of file which consisted of
%          <blank line>
%          % Get something else
%          \input indent
% Modified on 07/24/1992 by Roque D. Oliveira.
%          \startappendices was modified to work
%          with the New Font Selection Scheme.
%          Further (similar) changes may be needed for other macros.
% Modified Sep. 2008 by Jason Gilbert: Obsolete code removed or updated to 
%          better conform to LaTeX2e, list of abbreviations added, 
%          made copyright page cleaner, fixed Appendices, Bibliography, 
%          margins, title page, frontispiece, bottom-center page numbers,
%          two-side printing, added in-dissertation abstract and abstract
%          that prints separately at the end.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rackham-thesis}[2018/02/15 Rackham Thesis Class]

%-- Package options --
\newcommand\@setspacing\onehalfspacing
\DeclareOption{doublespace}{\renewcommand\@setspacing\doublespacing}
\newcommand\@titlecommand\@makethesistitle
\DeclareOption{proposal}{\renewcommand\@titlecommand\@makeproposaltitle}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions\relax

\LoadClass[12pt]{report}
\RequirePackage{setspace}

\@setspacing
\renewcommand\maketitle\@titlecommand

% Define placeholder commands if hyperref not imported
\newcommand\@pdfbookmark[2]{\ifdefined\pdfbookmark\pdfbookmark{#1}{#2}\fi}
\newcommand\@phantomsection{\ifdefined\phantomsection\phantomsection\fi}
\newcommand\@texorpdfstring[2]{\ifdefined\texorpdfstring\texorpdfstring{#1}{#2}\else#1\fi}

%-- Page styles --

\def\ps@chappage{% The first page of each chapter has bottom-center page numbers -jj.
 \def\@oddhead{}
 \def\@oddfoot{\hfil \rm \thepage \hfil}
 \let\@evenhead\@oddhead 
 \let\@evenfoot\@oddfoot
}

\def\ps@plain{%
% \def\@oddhead{\hfil \rm \thepage \hfil} % These two lines of code make top-center page numbers on other pages -jg
% \def\@oddfoot{}
 \def\@oddhead{} % These two lines of code make bottom-center page numbers on other pages -jg
 \def\@oddfoot{\hfil \rm \thepage \hfil}
 \let\@evenhead\@oddhead 
 \let\@evenfoot\@oddfoot
}

%-- Margins --
\if@twoside \oddsidemargin 0.5in \evensidemargin 0in \marginparwidth .6in \textheight=8.95in
\else \oddsidemargin 0.5in \marginparwidth .9in \textheight=9.0in\fi% left margin=1in + oddsidemargin, marginparwidth: text box for margin notes
\topmargin -.7in \headheight 0.35in \headsep 0.35in \footskip 0.5in % header and footer margins
\textwidth=6.0in % width of the text body on a page
% The top margin = 1in plus vspace. For some reason, need to subtract 0.35in also. -jg
\def\vertadjust{\vspace{-0.35in}} % Required for proper vertical spacing. -jg
\def\twoinmar{\vertadjust\vspace{1.0in}} % Two inch top margin -jg
\def\twohalfinmar{\vertadjust\vspace{1.5in}} % Two and a half inch top margin -jg

%-- Front pages --

% jj: This \ttlpg is the same as \titlepage in report.sty.
\def\ttlpg{\@restonecolfalse \if@twocolumn \@restonecoltrue \onecolumn
 \else \newpage \fi \thispagestyle{empty} \c@page \z@}

% Define title fields
\newcommand\degree[1]{\renewcommand\@degree{#1}}
\newcommand\@degree{\@latex@error{No \noexpand\degree given}\@ehc}

\newcommand\department[1]{\renewcommand\@department{#1}}
\newcommand\@department{\@latex@error{No \noexpand\department given}\@ehc}

\newcommand\committee[1]{\renewcommand\@committee{#1}}
\newcommand\@committee{\@latex@error{No \noexpand\committee given}\@ehc}

% Define new maketitle to create title page
\newcommand\@makethesistitle{
 \ttlpg
 \@pdfbookmark{Title Page}{Title Page}
 \begin{singlespace}
 \hbox{ }
 \twohalfinmar
 \begin{center}
 \begin{onehalfspacing} % For the `Large' font size, this will look single spaced. -jg
  {\Large\bf \@title \mbox{}} \\
 \end{onehalfspacing}
  \vfill
  by \\
  \vspace{2ex} % ex is the height of the lowercase 'x' for the current font. -jg
  \@author \\
  \vfill
   A dissertation submitted in partial fulfillment \\
   of the requirements for the degree of \\
   \@degree \\
   (\@department) \\
   in The University of Michigan \\
   \@date \\
 \end{center}
 \vfill
  Doctoral Committee: \\[2ex]
  \mbox{ }\hspace{0.6in}
  \parbox{5.3in}{\@committee}
 \end{singlespace}

 % FIXME This is set in both thesis and propose title, but it should be just set as we always want it to be set
 % Set things for next page
 \setcounter{page}{1}   % -- begins with "ii"
 \pagestyle{chappage}   % -- numbers at bottom
 \renewcommand{\thepage}{\roman{page}}   % roman numeral
}

% Define new maketitle to create title page
\newcommand\@makeproposaltitle{
 \ttlpg
 \@pdfbookmark{Title Page}{Title Page}
 \begin{singlespace}
 \hbox{ }
 \twohalfinmar
 \begin{center}
 \begin{onehalfspacing} % For the `Large' font size, this will look single spaced. -jg
  {\Large\bf \@title \mbox{}} \\
 \end{onehalfspacing}
  \vfill
  Thesis Proposal \\
  \vspace{2ex}
  by \\
  \vspace{2ex} % ex is the height of the lowercase 'x' for the current font. -jg
  \@author \\
  \vfill
   \@department \\
   University of Michigan \\
   \@date \\
 \end{center}
 \vfill
  Doctoral Committee: \\[2ex]
  \mbox{ }\hspace{0.6in}
  \parbox{5.3in}{\@committee}
 \end{singlespace}

 % Set things for next page
 \setcounter{page}{1}   % -- begins with "ii"
 \pagestyle{chappage}   % -- numbers at bottom
 \renewcommand{\thepage}{\roman{page}}   % roman numeral
}

\def\frontispiece#1{
 \ttlpg
 \@pdfbookmark{Frontispiece}{Frontispiece}
 \hbox{ }
 \vertadjust
 \vfill
 \begin{center}
	 \begin{singlespace}
		 #1
	 \end{singlespace}
 \end{center}
 \vfill
 \if@twoside \clearpage\hbox{}\thispagestyle{empty} \fi
 \twoinmar
 \setcounter{page}{1}
}

\def\copyrightpage{
 \ttlpg
 \@pdfbookmark{Copyright}{Copyright}
 \hbox{ }
 \vertadjust
 \vfill
 \begin{center}
  \begin{singlespace}
   \underline{\copyright\hspace{0.2in}{\@author}\hspace{0.2in}\number\year}\\
   \vspace{0.1in}All Rights Reserved
  \end{singlespace}
 \end{center}
 \vfill
 \setcounter{page}{1}
}

\def\dedication#1{
 \newpage
 \@phantomsection
 \addcontentsline{toc}{chapter}{\@texorpdfstring{DEDICATION}{Dedication}}
 \hbox{ }
 \vertadjust
 \vfill
 \begin{center}
	 \textit{#1}
 \end{center}
 \vfill
}

\def\acknowledgments{
 \newpage
 \@phantomsection
 \addcontentsline{toc}{chapter}{\@texorpdfstring{ACKNOWLEDGMENTS}{Acknowledgments}}
 \hbox{ }
 \twoinmar
 \centerline{\large\bf ACKNOWLEDGEMENTS}
 \vspace{0.7in}
}
\let\acknowledgements\acknowledgments

\def\preface{
 \newpage
 \@phantomsection
 \addcontentsline{toc}{chapter}{\@texorpdfstring{PREFACE}{Preface}}
 \hbox{ }
 \twoinmar
 \centerline{\large\bf PREFACE}
 \vspace{0.7in}
}

%-- Table of contents and lists --

\def\dotfill{\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep mu$}\hfill}

% jj: The only difference is \dotfill instead of \hfil.
\def\l@chapter#1#2{\pagebreak[3]
 \vskip 1.0em plus 1pt \@tempdima 1.5em \begingroup % em is the width of capital M for the current font. -jg
 \parindent \z@ \rightskip \@pnumwidth
 \parfillskip -\@pnumwidth
 {\bf \leavevmode #1}\dotfill \hbox to\@pnumwidth{\hss #2}\par
 \endgroup
}

\def\l@chap{\@dottedtocline{1}{0.5em}{3.5em}}
\def\l@section{\@dottedtocline{2}{5.0em}{2.3em}}
\def\l@subsection{\@dottedtocline{3}{8.3em}{3.2em}}
\def\l@subsubsection{\@dottedtocline{4}{12.5em}{4.1em}}

\setcounter{tocdepth}{3} % Number of section layers to show in TOC (i.e. section, subsection, subsubsection)
\setcounter{secnumdepth}{3} % Number of subsection layers to allow in document

\def\l@figure{\@dottedtocline{1}{1.0em}{3.5em}}
\let\l@table\l@figure
\let\l@map\l@figure
\let\l@anything\l@figure
\def\l@appendix{\@dottedtocline{1}{1.0em}{2.5em}}
\let\l@abbreviation\l@figure

\renewcommand\tableofcontents{%
 \newpage
 \@pdfbookmark{Table of Contents}{Contents}
 \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
 \hbox{ }
 \twoinmar
 \centerline{\large\bf TABLE OF CONTENTS}
 \vspace{0.7in}
 \begin{singlespace}
  \@starttoc{toc}\if@restonecol\twocolumn\fi
 \end{singlespace} 
}

% Various lists

\newcommand{\@list}[3]{
 \cleardoublepage
 \@phantomsection
 \addcontentsline{toc}{chapter}{\@texorpdfstring{\uppercase{List of #1}}{List of #1}}
 \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
 \hbox{ }
 \twoinmar
 \centerline{\large\bf\uppercase{List of #1}}
 \vspace{0.7in}  % FIXME Make this length
 \begin{singlespace}
   \@starttoc{#3}\if@restonecol\twocolumn\fi
   \addtocontents{#3}{\noindent\underline{\bf #2}\hfill\rm\protect\newline}
 \end{singlespace}
}

\renewcommand{\listoffigures}{\@list{Figures}{Figure}{lof}}
\renewcommand{\listoftables}{\@list{Tables}{Table}{lot}}
\newcommand{\listofappendices}{\@list{Appendices}{Appendix}{loap}}

% FIXME Update
\newcommand\listofabbreviations{% Uses the acronym package -jg
 \newpage
 \@phantomsection
 \addcontentsline{toc}{chapter}{\@texorpdfstring{LIST OF ABBREVIATIONS}{List of Abbreviations}}
 \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
 \hbox{ }
 \twoinmar
 \centerline{\large\bf LIST OF ABBREVIATIONS}
 \vspace{0.7in}
 \begin{singlespace}
  \begin{acronym}
   \input{abbr}
  \end{acronym}
 \end{singlespace} 
}

\def\abstract#1{
 \newpage
 \@phantomsection
 \addcontentsline{toc}{chapter}{\@texorpdfstring{ABSTRACT}{Abstract}}
 \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
 \hbox{ }
 \centerline{\large\bf ABSTRACT}
 \vspace{0.25in}
 \begin{center}
  \begin{singlespace}
   \@title \\
  \end{singlespace}
   by \\
   \@author \\
 \end{center}
 \vspace{0.4in}
 \noindent Chair: #1 \vspace{0.1in}

 % intentionally left blank for paragraph break
}

%-- Start chapters --

\def\thechapter {\Roman{chapter}}
\def\thesection {\@arabic\c@chapter.\@arabic\c@section}
\def\thefigure {\@arabic\c@chapter.\@arabic\c@figure}
\def\thetable {\@arabic\c@chapter.\@arabic\c@table}
\def\theequation {\@arabic\c@chapter.\@arabic\c@equation}

\newcounter{map}[chapter]
\def\themap{\@arabic\c@chapter.\@arabic\c@map}
\def\fps@map{tbp}
\def\ftype@map{1}
\def\ext@map{lom}
\def\fnum@map{Map \themap}
\def\map{\@float{map}}
\let\endmap\end@float
\@namedef{map*}{\@dblfloat{map}}
\@namedef{endmap*}{\end@dblfloat}

\newcommand\@startthechapters{%
 \def\@chapapp{CHAPTER}
 \addtocontents{toc}{\protect\mbox{ }\protect\newline\noindent{\bf CHAPTER}\protect\newline}
 \addtocontents{toc}{\hbox{ }}
 \clearpage % This has to be before the rest.  jj
 \if@twoside \ifodd\c@page \else \ttlpg \hbox{ }\fi\fi % For two-sided printing, make sure Chapter I starts on right-hand page. jg
 \clearpage
 \setcounter{chapter}{0}
 \setcounter{page}{1} % -- ...always begin with ii.
 \renewcommand{\thepage}{\arabic{page}}
 \pagestyle{plain}
 \def\tocname{toc}
 \@modifybib
}

\newif\if@firstchap
\@firstchaptrue

\def\@chapter[#1]#2{%
 \if@firstchap \@firstchapfalse \@startthechapters \fi % Start chapters at first chapter
 \ifnum \c@secnumdepth >\m@ne
  \refstepcounter{chapter}
  \typeout{\@chapapp\space\thechapter.}
  \addtocontents{toc}{\hbox{ }}
  \addcontentsline{toc}{chap}{\protect\numberline{\hbox{ }\hfill\bf\thechapter.\hspace{5pt}}{\bf #1}}
  \addtocontents{toc}{\hbox{ }}
 \else
  \addtocontents{toc}{\hbox{ }}
  \addcontentsline{toc}{chap}{#1}
  \addtocontents{toc}{\hbox{ }}
 \fi
 \if@twocolumn \@topnewpage[\@makechapterhead{#2}]
 \else \@makechapterhead{#2} \@afterheading \fi
}

\def\@makechapterhead#1{%
 \hbox{ }
 \twoinmar
 {\parindent 0pt \raggedright
  \ifnum \c@secnumdepth >\m@ne
  \centerline{\large\bf \@chapapp{} \thechapter} \par
  \vskip 0.3in \fi
  \begin{center}
   \Large\bf #1
  \end{center}
  \nobreak \vskip 0.7in
 }
 \@afterindenttrue
}

\def\section{\@startsection{section}{1}{\z@}{3.5ex plus 1ex minus
 .2ex}{2.3ex plus .2ex}{\large\bf}}
\def\subsection{\@startsection{subsection}{2}{\z@}{3.25ex plus 1ex minus
 .2ex}{1.5ex plus .2ex}{\normalsize\bf}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{3.25ex plus
 1ex minus .2ex}{1.5ex plus .2ex}{\normalsize\bf}}

\long\def\@caption#1[#2]#3{%
 \addtocontents{\csname ext@#1\endcsname}{\hbox{ }}
 \addcontentsline{\csname ext@#1\endcsname}{#1}{\protect\numberline{\csname
  the#1\endcsname}{\ignorespaces\protect\small\protect\normalsize\rm #2}}
 \par
 \begingroup
  \@parboxrestore
  \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces\protect\small\normalsize\rm #3}
  \par
 \endgroup
}

\long\def\@makecaption#1#2{
 \vskip 10pt
 \setbox\@tempboxa\hbox{#1: #2}
 \ifdim \wd\@tempboxa >\hsize
  \setbox\@tempboxa\hbox{#1: }
  \def\@tempdimj{\hsize}
  \advance\@tempdimj -\wd\@tempboxa
  \hbox to\hsize{#1: \parbox[t]{\@tempdimj}{#2}}
 \else \hbox to\hsize{\hfill\box\@tempboxa\hfill}
 \fi}

%-- Appendices and bibliography --

\let\@oldchapter\chapter

\renewcommand\appendix{\par
 \def\thechapter {\Alph{chapter}}
 \def\theappendix{\Alph{chapter}}
 \def\thesection{\theappendix.\arabic{section}}
 \def\theequation{{\rm \theappendix}.\arabic{equation}}
 \def\thefigure{{\rm \theappendix}.\@arabic\c@figure}
 \def\thetable{{\rm \theappendix}.\@arabic\c@table}
 \def\themap{{\rm \theappendix}.\@arabic\c@map}

 \setcounter{chapter}{0}
 \setcounter{section}{0}
 \def\@chapapp{APPENDIX}
 \pagestyle{plain}
 \clearpage
 \hbox{}
 \if@twoside \ifodd\c@page \else\thispagestyle{empty} \clearpage\hbox{}\fi\fi
 \thispagestyle{chappage}
 \@phantomsection
 \addcontentsline{toc}{chapter}{\@texorpdfstring{APPENDICES}{Appendicies}}
 \hbox{ }
 \vertadjust
 \vfill
 \centerline{\large\bf APPENDICES} % The half title page
 \vfill

    \renewcommand\chapter[1]{%
     \clearpage \global\@topnum\z@ \@afterindenttrue
     \refstepcounter{chapter}
     \typeout{\@chapapp\space\theappendix.}
     \hbox{}
     \if@twoside \ifodd\c@page \else\thispagestyle{empty} \clearpage\hbox{}\fi\fi
     \addcontentsline{loap}{appendix}{\protect\numberline{\theappendix.}{\ignorespaces\rm ##1}}
     \hbox{ }
     \twoinmar
     \centerline{\large\bf \@chapapp{} \theappendix} \par
     \vspace{0.3in}
     \begin{center}
      \Large\bf ##1
     \end{center}
     \vspace{0.7in}
     \par\@afterindenttrue
    }
}

\def\endofchapterbibliography{%
 \clearpage
 \hbox{ }
 \twoinmar
 \begin{center}
  {\large \bf BIBLIOGRAPHY}
 \end{center}
 \vspace{0.75in}
}


\newcommand\@modifybib{
    \ifdefined\printbibliography
        \let\@oldprintbibliography\printbibliography
        \renewcommand{\printbibliography}{%
         \let\chapter\@oldchapter
         \clearpage
         \hbox{}
         \if@twoside \ifodd\c@page \else\thispagestyle{empty} \clearpage\hbox{} \fi\fi
         \thispagestyle{chappage}
         \@phantomsection
         \addcontentsline{toc}{chapter}{\@texorpdfstring{BIBLIOGRAPHY}{Bibliography}}
         \hbox{ }
         \vertadjust
         \vfill
         \centerline{\large\bf BIBLIOGRAPHY} % The half title page
         \vfill
         \renewcommand{\bibname}{\vspace{-.13in}\centerline{\large\bf BIBLIOGRAPHY}}
         \begin{singlespace}
             \@oldprintbibliography
         \end{singlespace}
        }
    \else
    \fi
}

% This fixes a warning with hyperref
% Contributed by Chansoo Lee
\providecommand*{\toclevel@chap}{0}
