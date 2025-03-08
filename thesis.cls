%% LaTeX2e class for student theses
%% thesis.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[v1.0.0 Student thesis class]

% Language options. German is also needed in English thesis for the abstract
\DeclareOption{ngerman}{\PassOptionsToPackage{\CurrentOption}{babel}}
\DeclareOption{english}{\PassOptionsToPackage{main=\CurrentOption,ngerman}{babel}}

% Oneside and twoside layout
\DeclareOption{oneside}{\PassOptionsToPackage{\CurrentOption,BCOR=10mm}{typearea}}
\DeclareOption{twoside}{\PassOptionsToPackage{\CurrentOption,BCOR=30mm}{typearea}}

\PassOptionsToPackage{DIV=15}{typearea}
\ProcessOptions\relax
% Used to detect language families
\RequirePackage{translations}

%% ---------------------------------------------------------------
%% | Based on KOMAscript by Markus Kohm http://www.komascript.de |
%% ---------------------------------------------------------------
\LoadClass[11pt,a4paper,titlepage=true,headsepline]{scrbook}

%% ---------------
%% | Page Layout |
%% ---------------
\RequirePackage[headsepline,draft=false]{scrlayer-scrpage}
\pagestyle{scrheadings}

% For one-sided layout, put the page marks on the right margin
\if@twoside%
\else%
	\chead[]{}
	\ohead{\headmark}
	\cfoot[]{}
	\ofoot[\pagemark]{\pagemark}
\fi%

% for code in this style
\RequirePackage{xparse}
\RequirePackage{iftex}

\ifPDFTeX
	% pdflatex packages
	\RequirePackage[T1]{fontenc}
	\RequirePackage[utf8]{inputenc}
\fi
\ifLuaTeX
	% lualatex packages
	\RequirePackage{fontspec}
	\RequirePackage{selnolig}
	\RequirePackage{luatex85}
\fi

%% --------------
%% | Typography |
%% --------------

% serif type: Linux Libertine
\RequirePackage[sb]{libertine}
% Linux Libertine in math mode
\RequirePackage[libertine,varbb]{newtxmath}
\DeclareMathSymbol{v}{\mathalpha}{letters}{23}
% Beramono as monospace font
\RequirePackage[scaled=.78]{beramono}

% various typography options
\RequirePackage[protrusion=true,expansion=true]{microtype}
\RequirePackage{textcomp}
\RequirePackage{slantsc}
\RequirePackage{relsize}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}
\nonfrenchspacing

% default \mathcal{O}
\DeclareFontFamily{OMS}{pzc}{\skewchar\font48}
\DeclareFontShape{OMS}{pzc}{m}{n}{%
	<-6> 	s * [0.95] cmsy5
	<6-7>	s * [0.95] cmsy6
	<7-8>	s * [0.95] cmsy7
	<8-9>	s * [0.95] cmsy8
	<9-10>	s * [0.95] cmsy9
	<10->	s * [0.95] cmsy10
}{}
\DeclareMathAlphabet{\mathcal}{OMS}{pzc}{m}{n}

\RequirePackage[hyphens]{url}
\RequirePackage[breaklinks,colorlinks=false]{hyperref}
\newcommand\setpdf{\hypersetup{%
	pdftitle={\thethesistype},%
	pdfsubject={\@title},%
	pdfauthor={\@author},%
	pdfborder={0 0 0},%
	}%
	\let\theauthor\@author
}

% not even your webbrowser uses monospace for links...
\def\UrlFont{\em}
\let\UrlSpecialsOld\UrlSpecials
\def\UrlSpecials{\UrlSpecialsOld\do\/{\Url@slash}\do\v{\Url@v}\do\p{\Url@p}\do\({\Url@lbrac}\do\){\Url@rbrac}}
\def\Url@slash{\@ifnextchar/{\kern+.02em\textnormal{\char47}\kern-.12em}%
	{\kern.02em\textnormal{\char47}\kern-.15em\penalty\UrlBigBreakPenalty}}
\def\Url@v{\kern-0.07em\textit{v}}
\def\Url@p{\kern-0.03em\textit{p}}
\def\Url@lbrac{\textit{(}\kern-0.02em}
\def\Url@rbrac{\kern-0.08em\textit{)}\kern+0.03em}

% KOMA script options
\clubpenalties=4 10000 10000 150 0 
\widowpenalties=4 10000 10000 150 0
\displaywidowpenalties=4 10000 10000 150 0

\addtokomafont{subsection}{\bfseries}
\addtokomafont{subsubsection}{\bfseries}
\addtokomafont{paragraph}{\bfseries}
\setkomafont{title}{\huge\sffamily\bfseries}
\setkomafont{subtitle}{\normalfont\large}

\deffootnote[1em]{1em}{1em}{\textsuperscript{\thefootnotemark}}

\RequirePackage{csquotes}
\MakeOuterQuote{"}
\MakeInnerQuote{´}

%% --------
%% | Math |
%% --------

\RequirePackage{amsmath}
\RequirePackage{mathtools}
\RequirePackage{mathdots}
%\RequirePackage{amssymb}
\let\openbox\relax
\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage{nicefrac}
\RequirePackage{scalerel}

\DeclarePairedDelimiterX\set[1]{\lbrace}{\rbrace}{\def\given{\;\delimsize\vert\;}#1}
\DeclarePairedDelimiterX\ceil[1]{\lceil}{\rceil}{#1}
\DeclarePairedDelimiterX\floor[1]{\lfloor}{\rfloor}{#1}
\DeclarePairedDelimiterX\abs[1]{\vert}{\vert}{#1}
\DeclarePairedDelimiterX\parenthesize[1]{(}{)}{#1}
\DeclareMathOperator{\avg}{avg}

\newcommand{\positive}{\ensuremath{^+}}
\newcommand{\notneg}{\ensuremath{_0\positive}}
\newcommand{\negative}{\ensuremath{^-}}
\newcommand{\notpos}{\ensuremath{_0\negative}}

\newcommand{\true}{\ensuremath{\mathit{true}}}
\newcommand{\false}{\ensuremath{\mathit{false}}}
\newcommand{\bool}{\ensuremath{\mathbb{B}}}

\newcommand{\nat}{\ensuremath{\mathbb{N}\positive}}
\newcommand{\natzero}{\ensuremath{\mathbb{N}_0}}
\newcommand{\integer}{\ensuremath{\mathbb{Z}}}
\newcommand{\rational}{\ensuremath{\mathbb{Q}}}
\newcommand{\real}{\ensuremath{\mathbb{R}}}

\newcommand{\imag}{\ensuremath{i}}
\newcommand{\complex}{\ensuremath{\mathbb{C}}}

\newtheoremstyle{scalestyle} % Name
{}%                          % Space above
{}%                          % Space below
{\itshape}%                  % Body font
{}%                          % Indent amount
{\sffamily\bfseries}%        % Theorem head font
{:}%                         % Punctuation after theorem head
{ }%                         % Space after theorem head, ' ', or \newline
{}%                          % Theorem head spec (can be left empty, meaning `normal')

\theoremstyle{scalestyle}
\newtheorem{definition}{Definition}\numberwithin{definition}{chapter}
\newtheorem{theorem}[definition]{\protect\ifcurrentbaselanguage{English}{Theorem}{Satz}}
\newtheorem{lemma}[definition]{Lemma}
\newtheorem{proposition}[definition]{Proposition}
\newtheorem{corollary}[definition]{\protect\ifcurrentbaselanguage{English}{Corollary}{Korollar}}
\newtheorem{conjecture}[definition]{\protect\ifcurrentbaselanguage{English}{Conjecture}{Vermutung}}
\newtheorem{construction}[definition]{\protect\ifcurrentbaselanguage{English}{Construction}{Konstruktion}}
\newtheorem{observation}[definition]{\protect\ifcurrentbaselanguage{English}{Observation}{Beobachtung}}
\newtheorem{question}[definition]{\protect\ifcurrentbaselanguage{English}{Question}{Frage}}

\newenvironment{proofSketch}[1][\proofname\ifcurrentbaselanguage{English}{~Sketch}{skizze}]
{\begin{proof}[#1]\renewcommand\qedsymbol{\qedideasymbol}}
{\end{proof}}

%% ------------
%% | Graphics |
%% ------------

\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{pgfplots}
\RequirePackage{pgfplotstable}
\pgfplotsset{compat=newest}
\usepgfplotslibrary{colormaps}
% show graphics in draft mode
\setkeys{Gin}{draft=false}

% floats
\RequirePackage[labelfont={sf,bf}]{caption}
\RequirePackage[absolute,overlay]{textpos}
% don't indent captions
\setcapindent{0pt}

% colors
\providecommand{\colorprovide}[2]{\@ifundefined{\string\color@#1}{\colorlet{#1}{#2}}{}}
\NewDocumentCommand{\definekitcolor}{ m m O{rgb}}{
	\definecolor{kit-#1}{#3}{#2}
	\colorlet{kit-#1100}{kit-#1!100}
	\colorlet{kit-#170}{kit-#1!70}
	\colorlet{kit-#150}{kit-#1!50}
	\colorlet{kit-#130}{kit-#1!30}
	\colorlet{kit-#115}{kit-#1!15}
	
	\pgfplotsset{
		colormap={kit-#1}{color=(kit-#1100) color=(kit-#115)}
	}
}

\definekitcolor{red}{.25,1,1,0}[cmyk]
\definekitcolor{orange}{0,.45,1,0}[cmyk]
\definekitcolor{yellow}{0,.05,1,0}[cmyk]
\definekitcolor{palegreen}{.44,.74,.26}
\definekitcolor{green}{0,.59,.51}
\definekitcolor{cyan}{.0,.68,.91}
\definekitcolor{blue}{.27,.29,.67}
\definekitcolor{purple}{.73,.10,.55}
\definekitcolor{brown}{.68,.51,.20} % dont use brown...

% redefine xcolor colors
\colorlet{cyan}{kit-cyan}
\colorlet{green}{kit-green}
\colorlet{orange}{kit-orange}
\colorlet{violet}{kit-purple!50!kit-blue}

\colorlet{blue}{kit-blue}
\colorlet{darkgray}{black!70}
\colorlet{lightgray}{black!15}
\colorlet{purple}{kit-purple}

\colorlet{brown}{kit-brown}
\colorlet{lightgray}{black!50}
\colorlet{magenta}{kit-yellow}
\definecolor{magenta}{rgb}{.82,.23.44}
\colorlet{red}{kit-red}
\colorlet{yellow}{kit-yellow}

% rainbow list
\newcommand{\definekitcolorlist}[1]{
	\pgfplotscreateplotcyclelist{kit-#1}{
		{kit-red#1},
		{kit-orange#1},
		{kit-yellow#1},
		{kit-palegreen#1},
		{kit-cyan#1},
		{kit-blue#1},
		{kit-purple#1},
	}
	\pgfplotsset{
		colormap={kit-rainbow-#1}{
			color=(kit-red#1) 
			color=(kit-orange#1)
			color=(kit-yellow#1)
			color=(kit-palegreen#1)
			color=(kit-cyan#1)
			color=(kit-blue#1)
			color=(kit-purple#1)
		}
	}
}

\pgfplotscreateplotcyclelist{kit}{
	{kit-red},
	{kit-orange},
	{kit-yellow},
	{kit-palegreen},
	{kit-cyan},
	{kit-blue},
	{kit-purple},
}
\pgfplotsset{
	colormap={kit-rainbow}{
		color=(kit-red) 
		color=(kit-orange)
		color=(kit-yellow)
		color=(kit-palegreen)
		color=(kit-cyan)
		color=(kit-blue)
		color=(kit-purple)
	}
}

\definekitcolorlist{100}
\definekitcolorlist{70}
\definekitcolorlist{50}
\definekitcolorlist{30}
\definekitcolorlist{15}

% tikz
\usetikzlibrary{positioning}
\usetikzlibrary{shapes}
\usetikzlibrary{decorations}
\usetikzlibrary{decorations.pathmorphing}
\usetikzlibrary{calc}
\usetikzlibrary{automata}
\usetikzlibrary{datavisualization}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{fit}
\usetikzlibrary{graphs}
\usetikzlibrary{decorations.shapes}
\usetikzlibrary{decorations.markings}
\usetikzlibrary{backgrounds}
\usetikzlibrary{scopes}

\tikzset{
	%Define standard arrow tip
	>=stealth,
	% Define arrow style
	pil/.style={
		->,
		thick,
		shorten <=2pt,
		shorten >=2pt,},
}

%% --------------
%% | Pseudocode |
%% --------------
\usepackage[ruled,vlined,linesnumbered,algochapter]{algorithm2e}
\DontPrintSemicolon
\SetArgSty{textnormal}

%%%%%%%%%%%%%%%%%%%%
% Fix block height %
%%%%%%%%%%%%%%%%%%%%
\newlength{\vlineOffset}
\setlength{\vlineOffset}{3pt}
\setlength{\algomargin}{15pt}
\SetInd{1.5pt}{13.5pt}
\SetVlineSkip{\vlineOffset}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Line number indentation fix %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\algocf@Vline}[1]{%
	\strut\par\nointerlineskip%
	\algocf@push{\skiprule}% 
	\hbox{\vrule\hspace{-0.4pt}%
	\vtop{\algocf@push{\skiptext}%
	\vtop{\algocf@addskiptotal #1}\Hlne}}\vskip\skiphlne%
	\algocf@pop{\skiprule}%
	\nointerlineskip%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Alligned Input and Output key words %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\SetKwInOut}[2]{%
	\sbox\algocf@inoutbox{\KwSty{#2\algocf@typo:}}%
	\expandafter\ifx\csname InOutSizeDefined\endcsname\relax%
		\newcommand\InOutSizeDefined{}\setlength{\inoutsize}{\wd\algocf@inoutbox}%
		\sbox\algocf@inoutbox{\parbox[t]{\inoutsize}{\KwSty{#2\algocf@typo\hfill:}}\hspace{0.42em}}%
		\setlength{\inoutindent}{\wd\algocf@inoutbox}%
	\else%
		\ifdim\wd\algocf@inoutbox>\inoutsize%
			\setlength{\inoutsize}{\wd\algocf@inoutbox}%
			\sbox\algocf@inoutbox{\parbox[t]{\inoutsize}{\KwSty{#2\algocf@typo\hfill:}}\hspace{0.42em}}%
			\setlength{\inoutindent}{\wd\algocf@inoutbox}%
		\fi%
	\fi%
	\algocf@newcommand{#1}[1]{%
		\ifthenelse{\boolean{algocf@hanginginout}}{\relax}{\algocf@seteveryparhanging{\relax}}%
		\ifthenelse{\boolean{algocf@inoutnumbered}}{\relax}{\algocf@seteveryparnl{\relax}}{%
			\let\\\algocf@newinout\hangindent=\inoutindent\hangafter=1\parbox[t]{\inoutsize}{%
				\KwSty{#2\algocf@typo:}%
			}\,~{##1}\par%
		}%
		\algocf@linesnumbered%
		\ifthenelse{\boolean{algocf@hanginginout}}{\relax}{\algocf@reseteveryparhanging}%
	}%
}
\SetKwInOut{Input}{Input}
\SetKwInOut{Output}{Output}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Additional commands                                                                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\Comment}[2][r]{\tcp*[#1]{#2\hspace{-13pt}}}
\newcommand{\BlockEnd}{\vspace{-\vlineOffset}\vspace{-0.4pt}}

\SetKwFor{FOR}{for}{do}{}
\renewcommand{\For}[2]{\FOR{#1}{#2\BlockEnd}}
\newcommand{\ForComment}[3]{\FOR(\Comment[f]{#1}){#2}{#3\BlockEnd}}

\SetKwFor{FOREACH}{for each}{do}{}
\renewcommand{\ForEach}[2]{\FOREACH{#1}{#2\BlockEnd}}
\newcommand{\ForEachComment}[3]{\FOREACH(\Comment[f]{#1}){#2}{#3\BlockEnd}}

\SetKwFor{WHILE}{while}{do}{}
\renewcommand{\While}[2]{\WHILE{#1}{#2\BlockEnd}}
\newcommand{\WhileComment}[3]{\WHILE(\Comment[f]{#1}){#2}{#3\BlockEnd}}

\SetKwIF{IF}{ELSEIF}{ELSE}{if}{then}{else if}{else}{}
\renewcommand{\If}[2]{\IF{#1}{#2\BlockEnd}}
\newcommand{\IfComment}[3]{\IF(\Comment[f]{#1}){#2}{#3\BlockEnd}}
\renewcommand{\ElseIf}[2]{\ELSEIF{#1}{#2\BlockEnd}}
\newcommand{\ElseIfComment}[3]{\ELSEIF(\Comment[f]{#1}){#2}{#3\BlockEnd}}
\renewcommand{\Else}[1]{\ELSE{#1\BlockEnd}}
\newcommand{\ElseComment}[2]{\ELSE(\Comment[f]{#1}){#2\BlockEnd}}

\newcommand{\Not}{\ensuremath{\operatorname{\textbf{not}}}\xspace}
\renewcommand{\And}{\ensuremath{\operatorname{\textbf{and}}}\xspace}
\newcommand{\Or}{\ensuremath{\operatorname{\textbf{or}}}\xspace}
\newcommand{\With}{\ensuremath{\operatorname{\textbf{with}}}\xspace}
\newcommand{\Break}{\ensuremath{\operatorname{\textbf{break}}}\xspace}
\newcommand{\Continue}{\ensuremath{\operatorname{\textbf{continue}}}\xspace}

%% ----------
%% | Tables |
%% ----------
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{tabu}
\RequirePackage{diagbox}
\RequirePackage{colortbl}

\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}

%% ----------------
%% | Bibliography |
%% ----------------
\usepackage[citestyle=authoryear,style=alphabetic,backend=biber,maxbibnames=100, maxcitenames=4, maxalphanames=4, sorting=anyt]{biblatex}
\DeclareFieldFormat[article,online]{title}{\mkbibquote{#1\isdot}}
\DeclareFieldFormat{labelalpha}{#1}
\DefineBibliographyStrings{english}{
	byeditor = {Edited by},
	jourvol = {Volume},
	number = {Number},
}
\DeclareFieldFormat[article]{volume}{\bibstring{jourvol}\addnbspace #1}
\renewcommand\multicitedelim{\,|\,}
\renewcommand*{\mkbibacro}[1]{\expandafter\MakeUppercase\expandafter{#1}}

\AtEveryBibitem{%
	%\clearfield{title}
	%\clearfield{journaltitle}
	\clearname{translator}
	\clearname{annotator}
	\clearname{commentator}
	\clearfield{introduction}
	\clearfield{foreword}
	\clearfield{afterword}
	\clearfield{subtitle}
	\clearfield{titleaddon}
	%\clearfield{maintitle}
	\clearfield{mainsubtitle}
	\clearfield{maintitleaddon}
	%\clearname{editor}
	\clearname{editora}
	\clearname{editorb}
	\clearname{editorc}
	\clearfield{journalsubtitle}
	\clearfield{journaltitleaddon}
	\clearfield{issuetitle}
	\clearfield{issuesubtitle}
	\clearfield{issuetitleaddon}
	%\clearfield{language}
	\clearfield{howpublished}
	\clearfield{origlanguage}
	%\clearfield{part}
	%\clearfield{edition}
	%\clearfield{volume}
	\clearfield{volumes}
	\clearfield{series}
	\clearfield{number}
	%\clearname{publisher}
	\clearfield{location}
	\clearfield{eid}
	\clearfield{issue}
	%\clearfield{month}
	\clearfield{version}
	\clearfield{type}
	\clearfield{note}
	%\clearfield{issn}
	\clearfield{eid}
	\clearfield{chapter}
	%\clearfield{pages}
	\clearfield{pagetotal}
	\clearfield{addendum}
	\clearfield{pubstate}
	%\clearfield{eprint}
	\clearfield{eprintclass}
	%\clearfield{eprinttype}

	\ifentrytype{online}{}{% Remove url except for @online
		\clearfield{url}
		\clearfield{urlyear}
		\clearfield{urlmonth}
		\clearfield{urlday}
	}

	\iffieldundef{eprint}{}{
		\clearfield{doi}
	}
}

%% --------------
%% | Title page |
%% --------------

% Logos
\newcommand{\thegrouplogo}{}
\newcommand{\grouplogo}[1]{\renewcommand{\thegrouplogo}{#1}}
\newcommand{\printgrouplogo}{\includegraphics[height=1.8cm]{logos/\thegrouplogo}}
\newcommand{\nogrouplogo}{\renewcommand{\printgrouplogo}{}}

\newlength{\pageoffset}
\if@twoside%
	\setlength{\pageoffset}{1mm}%
\else%
	\setlength{\pageoffset}{-12mm}%
\fi%

\titlehead{%
% KIT logo german/english
\ifcurrentbaselanguage{English}
{\includegraphics[height=1.8cm]{logos/kitlogo_en_cmyk}}
{\includegraphics[height=1.8cm]{logos/kitlogo_de_cmyk}}
\hfill
% Scale logo
\printgrouplogo

\begin{tikzpicture}[remember picture,overlay]%
	%current page.north west
	\draw[line width=1pt]%
		($(current page.south east)+(-12mm,+17mm)$){[rounded corners=6mm] --%
		($(current page.south west)+(+\ta@bcor,+17mm)-(\pageoffset,0mm)$)} --%
		($(current page.north west)+(+\ta@bcor,-12mm)-(\pageoffset,0mm)$){[rounded corners=6mm] --%
		($(current page.north east)+(-12mm,-12mm)$)} --%
	cycle%
	{};%
\end{tikzpicture}%

\if@twoside%
	\begin{textblock}{10}(3,15.43)
\else%
	\begin{textblock}{10}(2.33,15.43)
\fi%
	\small{\textsf{
		\ifcurrentbaselanguage{English}
		{KIT -- The Research University in the Helmholtz Association}
		{KIT -- Die Forschungsuniversität in der Helmholtz-Gemeinschaft}
	}}
\end{textblock}

\begin{textblock}{10}[0,0](12,15.36)
	\Large{\href{https://www.kit.edu}{\textbf{\textsf{www.kit.edu}}}}
\end{textblock}

}

\setkomafont{title}{\Huge\sffamily\bfseries}
\setkomafont{subtitle}{\normalfont\Large}

\uppertitleback{Karlsruher Institut für Technologie\\ Fakultät für Informatik\\ Postfach 6980\\ 76128 Karlsruhe}

%% variables for title page
\newcommand{\theinstitute}{\ifcurrentbaselanguage{English}
{Institute of Theoretical Informatics (ITI)}
{Institut für Theoretische Informatik (ITI)}}
\newcommand{\thethesistype}{}
\newcommand{\thereviewerone}{}
\newcommand{\thereviewertwo}{}
\newcommand{\theadvisorone}{}
\newcommand{\theadvisortwo}{}
\newcommand{\typereviewerone}{}
\newcommand{\typereviewertwo}{}
\newcommand{\typeadvisorone}{}
\newcommand{\theeditstart}{}
\newcommand{\theeditend}{}

\newcommand{\selecttype}[3]{%
	\ifthenelse{\equal{#1}{m}}{#2}{%
	\ifthenelse{\equal{#1}{w}}{#3}{%
		#1%
	}}%
}

%% formatting commands for titlepage
\newcommand{\thesistype}[1]{\subtitle{\vskip2em #1 \ifcurrentbaselanguage{English}{of}{von}}%
\renewcommand{\thethesistype}{#1}}
\newcommand{\myinstitute}[1]{\renewcommand{\theinstitute}{#1}}
\newcommand{\reviewerone}[2]{\renewcommand{\typereviewerone}{#1}\renewcommand{\thereviewerone}{#2}}
\newcommand{\reviewertwo}[2]{\renewcommand{\typereviewertwo}{#1}\renewcommand{\thereviewertwo}{#2}}
\newcommand{\advisorone}[2]{\renewcommand{\typeadvisorone}{#1}\renewcommand{\theadvisorone}{#2}}
\newcommand{\advisortwo}[2]{\renewcommand{\theadvisortwo}{#2}}

\newcommand{\editingtime}[2]{%
\renewcommand{\theeditstart}{#1}%
\renewcommand{\theeditend}{#2}%
%% do not show the date
\date{}
}

\newcommand{\settitle}{%
\publishers{%
\Large
\ifcurrentbaselanguage{English}%
{At the Department of Informatics}%
{an der Fakultät für Informatik}\\
\theinstitute\\[2em]
\begin{tabular}{l l}
	\ifcurrentbaselanguage{English}{Reviewer}{\selecttype{\typereviewerone}{Erstgutachter}{Erstgutachterin}}: & \thereviewerone\\
	\ifcurrentbaselanguage{English}{Second reviewer}{\selecttype{\typereviewertwo}{Zweitgutachter}{Zweitgutachterin}}: & \thereviewertwo\\
	\ifthenelse{\equal{\theadvisortwo}{}}{%
		\ifcurrentbaselanguage{English}{Advisor}{\selecttype{\typeadvisorone}{Betreuer}{Betreuerin}}: & \theadvisorone\\
	}{%
		\ifcurrentbaselanguage{English}{Advisors}{Betreuer}: & \theadvisorone\\
		& \theadvisortwo\\
	}
\end{tabular}
\vskip2em
\theeditstart{} -- \theeditend
}
}

%% -----------------------------
%% | Abstract/Acknowledgements |
%% -----------------------------

\newcommand{\abstract}[1][\abstractname]{\chapter*{#1}}
\newcommand{\Abstract}[1][\abstractname]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}}

\def\ackname{Acknowledgments}
\def\abstractname{Abstract}
\def\switcht@deutsch{\svlanginfo
	\def\ackname{Danksagung}
	\def\abstractname{Kurzfassung}
}
\def\switcht@english{\svlanginfo
	\def\ackname{Acknowledgements}
	\def\abstractname{Abstract}
}

%% In English theses, an additional German Abstract is needed.
\newcommand{\includeabstract}{
\ifcurrentbaselanguage{English}{
% include English and German abstracts
\thispagestyle{plain}
\input{sections/abstract_en.tex}
\begin{otherlanguage}{ngerman}
\input{sections/abstract_de.tex}
\end{otherlanguage}
}{
% include only German abstract
\include{sections/abstract_de}
}
}

%% ------------
%% | Packages |
%% ------------

% various
\usepackage[textsize=tiny]{todonotes}
\usepackage{tabto}
\usepackage{needspace}

% draft mode
\RequirePackage{ifdraft}
\RequirePackage{ifthen}

% enumerate subsubsections
\setcounter{secnumdepth}{3}

% subimport of files
\RequirePackage{import}

% languages
\RequirePackage{babel}

% hyphenation for compound words
\RequirePackage[shortcuts]{extdash}

\RequirePackage{blindtext}

% appendix
\RequirePackage[toc,title,header]{appendix}
\noappendicestocpagenum

\newlength{\myTotalHeight}
\colorprovide{bulletColor}{green}
\newcommand{\kitBulletNumbered}[2][bulletColor]{%
	\pgfmathsetlength{\myTotalHeight}{depth("p")+height("H")}%
	\begin{pgfpicture}{0mm}{0.5*depth("p")}{\myTotalHeight}{\myTotalHeight}%
		{\pgfsetcornersarced{\pgfpoint{.667ex}{.667ex}} 
			\pgfpathmoveto{\pgfpoint{0em}{\myTotalHeight}} 
			\pgfpathlineto{\pgfpoint{\myTotalHeight}{\myTotalHeight}}
			\pgfpathlineto{\pgfpoint{\myTotalHeight}{0em}}}
		{\pgfsetcornersarced{\pgfpoint{.667ex}{.667ex}}
			\pgfpathmoveto{\pgfpoint{\myTotalHeight}{0em}}
			\pgfpathlineto{\pgfpointorigin}
			\pgfpathlineto{\pgfpoint{0em}{\myTotalHeight}}}
		\color{#1}
		\pgfusepath{fill}
		\pgftext[at=\pgfpoint{.5*\myTotalHeight}{.5*\myTotalHeight}]{\textcolor{white}{\textnormal{\smaller#2}}}
	\end{pgfpicture}%
}

\newcommand{\kitBullet}[1][bulletColor]{%
	\begin{pgfpicture}{0mm}{0mm}{1.5ex}{1.5ex}%
		{\pgfsetcornersarced{\pgfpoint{.5ex}{.5ex}} 
			\pgfpathmoveto{\pgfpoint{0cm}{1.5ex}} 
			\pgfpathlineto{\pgfpoint{1.5ex}{1.5ex}}
			\pgfpathlineto{\pgfpoint{1.5ex}{0cm}}}
		{\pgfsetcornersarced{\pgfpoint{.5ex}{.5ex}}
			\pgfpathmoveto{\pgfpoint{1.5ex}{0cm}}
			\pgfpathlineto{\pgfpointorigin}
			\pgfpathlineto{\pgfpoint{0cm}{1.5ex}}}
		\color{#1}
		\pgfusepath{fill}
	\end{pgfpicture}%
}

\newcommand\qedideasymbol{%
	\begin{pgfpicture}{0mm}{0mm}{1.5ex}{1.5ex}
		{\pgfsetcornersarced{\pgfpoint{.5ex}{.5ex}} 
			\pgfpathmoveto{\pgfpoint{0cm}{1.5ex}} 
			\pgfpathlineto{\pgfpoint{1.5ex}{1.5ex}}
			\pgfpathlineto{\pgfpoint{1.5ex}{0cm}}}
		{\pgfsetcornersarced{\pgfpoint{.5ex}{.5ex}}
			\pgfpathmoveto{\pgfpoint{1.5ex}{0cm}}
			\pgfpathlineto{\pgfpointorigin}
			\pgfpathlineto{\pgfpoint{0cm}{1.5ex}}}
		\color{black}
		\pgfusepath{draw}
	\end{pgfpicture}%
}
\renewcommand{\qedsymbol}{\kitBullet[black]}

\setlist[itemize]{label=\kitBullet}
\setlist[enumerate,1]{label=\kitBulletNumbered{\arabic*}}
\setlist[enumerate,2]{label=\kitBulletNumbered{\Roman*}}
\setlist[enumerate,3]{label=\kitBulletNumbered{\alph*}}

% cleveref
\RequirePackage[capitalise,noabbrev]{cleveref}
