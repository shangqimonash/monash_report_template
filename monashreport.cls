% Encode in UTF-8

\NeedsTeXFormat{LaTeX2e}[2015/01/01]
\ProvidesClass{monashreport}
[2017/10/16 v0.1 LaTeX template for Monash PhD milestone report, this is from my previous HKU MSc project report template]
\typeout{Document class 'monashreport' v0.1 by Lai{2017/10}}

\DeclareOption{confirmation}{\def\reporttype{confirmation Report}}
\DeclareOption{mid}{\def\reporttype{progress Review Report}}
\DeclareOption{thesis}{\def\reporttype{thesis}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[a4paper,12pt]{book}[2014/09/29]

% Import the global macro 
\RequirePackage{ifthen}
\RequirePackage{url}
\RequirePackage[titletoc]{appendix}
\RequirePackage[pdftex,pagebackref=false]{hyperref}
\RequirePackage{etoolbox}
% Set the font style
\RequirePackage{palatino}
\RequirePackage{bm}
% Math Package
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\usepackage{amsthm}
\RequirePackage{amsfonts}
% Algorithm package
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
% Set up margin
\RequirePackage{geometry}
\newgeometry{%
  top=20mm, bottom=20mm, left=20mm, right=20mm
}
\savegeometry{reportgeometry}
\loadgeometry{reportgeometry}

%%%%%%%%Line spacing, indent%%%%%%%%
\RequirePackage{indentfirst}
\renewcommand{\baselinestretch}{1.25} 
%\setlength{\parindent}{2em}
\setlength{\parskip}{\medskipamount}
\setlength{\abovecaptionskip}{10pt plus 1pt minus 1pt}
\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt}

%%%%%%%%Output settings%%%%%%%%
\newboolean{PrintVersion}
\setboolean{PrintVersion}{true}

%%%%%%%%header and footer%%%%%%%%
\RequirePackage{fancyhdr}
\fancypagestyle{frontmatter}{%
	\pagestyle{empty}
	\fancyhf{}
	%\setlength{\parindent}{2em}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{mainmatter}{
  \fancyhead{}
  \fancyfoot{}
  \if@twoside
    \fancyfoot[RO]{\fontsize{9pt}{\baselineskip}\thepage}
    \fancyfoot[LE]{\fontsize{9pt}{\baselineskip}\thepage} \fancyfoot
  \else
    \fancyfoot[C]{\thepage}
  \fi
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

%%%%%%%hyper-link%%%%%%%%%%%%
\hypersetup{
    plainpages=false,       % needed if Roman numbers in frontpages
    unicode=false,          % non-Latin characters in Acrobat?s bookmarks
    pdftoolbar=true,        % show Acrobat?s toolbar?
    pdfmenubar=true,        % show Acrobat?s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
%    pdftitle={uWaterloo\ LaTeX\ Thesis\ Template},    % title: CHANGE THIS TEXT!
%    pdfauthor={Author},    % author: CHANGE THIS TEXT! and uncomment this line
%    pdfsubject={Subject},  % subject: CHANGE THIS TEXT! and uncomment this line
%    pdfkeywords={keyword1} {key2} {key3}, % list of keywords, and uncomment this line if desired
    pdfnewwindow=true,      % links in new window
    colorlinks=true,        % false: boxed links; true: colored links
    linkcolor=blue,         % color of internal links
    citecolor=green,        % color of links to bibliography
    filecolor=magenta,      % color of file links
    urlcolor=cyan           % color of external links
}
\ifthenelse{\boolean{PrintVersion}}{   % for improved print quality, change some hyperref options
\hypersetup{	% override some previously defined hyperref options
%    colorlinks,%
    citecolor=black,%
    filecolor=black,%
    linkcolor=black,%
    urlcolor=black}
}{} % end of ifthenelse (no else)
     
%%%%%%%%chapter titles%%%%%%%%
\RequirePackage{titlesec}
\titleformat{\chapter}[display]{\Large\bfseries}{Chapter\ \thechapter\,}{0em}{}
\titlespacing{\chapter}{0pt}{0em}{0.8em}
\titlespacing{\section}{0pt}{0.8em}{0.8em}
\titlespacing{\subsection}{0pt}{0.8em}{0.8em}
\titlespacing{\subsubsection}{0pt}{0.2em}{0.2em}

%%%%%%%%glossaries%%%%%%%%
\RequirePackage[acronym]{glossaries}

%%%%%%%%graphics%%%%%%%%
\RequirePackage[pdftex]{graphicx}
\RequirePackage[caption=false,font=footnotesize,labelfont=sf,textfont=sf]{subfig}
\RequirePackage{caption}
\DeclareGraphicsExtensions{.eps,.ps,.jpg,.bmp,.pdf}
\graphicspath{{figure/}}

%%%%%%%%bibliography%%%%%%%%
\bibliographystyle{unsrt}
\RequirePackage[numbers,sort&compress]{natbib}
\renewcommand{\bibname}{References}
\setlength{\bibsep}{0ex}

%%%%%%%%other settings%%%%%%%%
\RequirePackage{setspace}
\hyphenation{Safe-book Twi-tter ab-o-ve app-roaches boo-lean com-ponent cyber-space key-word po-int-ed star-t-ed techno-logy re-commendation}

% front matter before main body
\newcommand{\covermatter}{%
  \clearpage
  \@mainmatterfalse
  \pagestyle{frontmatter}
}

\newcommand{\frontsmatter}{%
  \@mainmattertrue
  \pagestyle{mainmatter}
  \setcounter{page}{1}
  \pagenumbering{Roman}
}

\renewcommand{\mainmatter}{%
  	\clearpage
	\setcounter{page}{1}
	\pagenumbering{arabic}
}


%%%%%%%%report info%%%%%%%%
% Title
\newcommand{\reporttitle}[1]{%
    \def\title{#1}
}

% student name
\newcommand{\reportauthor}[1]{%
  \def\author{#1}
}

% supervisor
\def\supervisorname{}
\newcommand{\supervisor}[1]{%
  \def\supervisorname{#1}
}

% co-supervisor
\def\cosupervisorname{}
\newcommand{\cosupervisor}[1]{%
  \def\cosupervisorname{#1}
}

% department
\def\departmentname{}
\newcommand{\department}[1]{%
  \def\departmentname{#1}
}

% faculty
\def\facultyname{}
\newcommand{\faculty}[1]{%
  \def\facultyname{#1}
}

% university
\def\universityname{}
\newcommand{\university}[1]{%
  \def\universityname{#1}
}

% submission date
\def\submissiondate{}
\newcommand{\submission}[1]{%
  \def\submissiondate{#1}
}

% Copyright
\newcommand{\notice}{%
\clearpage
%\thispagestyle{empty}
{\noindent\Large\textbf{Copyright notice}\vspace*{14pt}\\}
\copyright\ \author\ (\submissiondate)\vspace*{14pt}

\noindent I certify that I have made all reasonable efforts to secure copyright permissions for third-party content included in this thesis and have not knowingly added copyright content to my work without the owner's permission.
}

% Abstract
\newenvironment{abstract}{%
\clearpage
\addcontentsline{toc}{chapter}{Abstract}
%\thispagestyle{empty}
{\noindent\Large\textbf{Abstract}\vspace*{14pt}\\}
}

% Publication List
\newenvironment{publications}{%
\clearpage
\addcontentsline{toc}{chapter}{Publication during enrolment}
%\thispagestyle{empty}
{\noindent\Large\textbf{Publications during enrolment}\vspace*{14pt}\\}
}

% Declaration
\newenvironment{declaration}{%
\clearpage
\addcontentsline{toc}{chapter}{Declaration}
%\thispagestyle{empty}
{\noindent\Large\textbf{Declaration}\vspace*{14pt}\\}
}

% Thesis by publication Declaration
\newenvironment{publicationdeclaration}{%
\clearpage
\addcontentsline{toc}{chapter}{Thesis including published works declaration}
%\thispagestyle{empty}
{\noindent\Large\textbf{Thesis including published works declaration}\vspace*{14pt}\\}
}

% Acknowledgement
\newenvironment{acknowledgements}{%
\clearpage
\addcontentsline{toc}{chapter}{Acknowledgements}
%\thispagestyle{empty}
{\noindent\Large\textbf{Acknowledgements
	}\vspace*{14pt}\\}
}

% Redefine the title page
\newcommand{\titlepg}{
\begin{titlepage}
	\begin{center}
		\vspace*{23pt}
		\IfFileExists{figure/logo.png}{\includegraphics[width=17.37cm]{logo.png}}
		\null\vspace*{98pt}
		\begin{singlespace}
			\fontsize{14pt}{\baselineskip}\selectfont{\emph{\textbf\title}}
			
			\fontsize{12pt}{\baselineskip}\selectfont{\textit{\author}}
			
			\fontsize{12pt}{\baselineskip}\selectfont{\textit{Doctor of Philosophy}}
		\end{singlespace}
		\null\vspace*{144bp}

		\begin{singlespace}
			\fontsize{12pt}{\baselineskip}\selectfont{A \reporttype\ submitted for the degree of \textit{Doctor of Philosophy} at \\Monash University in \textit{\submissiondate}\\ \textit{\facultyname}}
		\end{singlespace}
		\vfill
		\end{center}
\end{titlepage}
}

% Title Page
\renewcommand{\maketitle}{%
	\covermatter
	\titlepg
	\frontsmatter
	% load front pages
	\notice
	\include{data/abstract}
	\include{data/publications}
	\include{data/declaration}
	\include{data/acknowledgements}
}
