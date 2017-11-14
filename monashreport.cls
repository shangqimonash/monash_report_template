% Encode in UTF-8

\NeedsTeXFormat{LaTeX2e}[2015/01/01]
\ProvidesClass{monashreport}
[2017/10/16 v0.1 LaTeX template for Monash PhD milestone report, this is from my previous HKU MSc project report template]
\typeout{Document class 'monashreport' v0.1 by Lai{2017/10}}

\DeclareOption{confirmation}{\def\reporttype{Confirmation Report}}
\DeclareOption{thesis}{\def\reporttype{Thesis}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[a4paper,12pt]{book}[2014/09/29]

% Import the global macro 
\RequirePackage{ifthen}
\RequirePackage{url}
\RequirePackage[titletoc]{appendix}
\RequirePackage{hyperref}
\RequirePackage{etoolbox}
% Set the font style
\RequirePackage{palatino}
\RequirePackage{bm}
% Set up margin
\RequirePackage{geometry}
\newgeometry{%
  top=25mm, bottom=25mm, left=35mm, right=35mm
}
\savegeometry{reportgeometry}
\loadgeometry{reportgeometry}

%%%%%%%%Line spacing, indent%%%%%%%%
\RequirePackage{indentfirst}
\renewcommand{\baselinestretch}{1.66} 
\setlength{\parindent}{2em}
\setlength{\abovecaptionskip}{10pt plus 1pt minus 1pt}
\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt}


%%%%%%%%header and footer%%%%%%%%
\RequirePackage{fancyhdr}
\fancypagestyle{frontmatter}{%
	\pagestyle{empty}
	\fancyhf{}
	\setlength{\parindent}{2em}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{mainmatter}{
  \fancyhead{}
  \fancyfoot{}
  \if@twoside
    \fancyfoot[RO]{\zihao{-5}\thepage}
    \fancyfoot[LE]{\zihao{-5}\thepage} \fancyfoot
  \else
    \fancyfoot[C]{\thepage}
  \fi
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}


%%%%%%%%table of contents%%%%%%%%
\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\normalsize}{\thecontentslabel\ }{}
     {\hspace{.5em}\titlerule*[4pt]{.}\contentspage}
\titlecontents{section}[2em]{\vspace{0.1\baselineskip}\normalsize}
{\thecontentslabel\ }{}
     {\hspace{.5em}\titlerule*[4pt]{.}\contentspage}
\titlecontents{subsection}[4em]{\vspace{0.1\baselineskip}\normalsize}
{\thecontentslabel\ }{}
     {\hspace{.5em}\titlerule*[4pt]{.}\contentspage}
     
%%%%%%%%chapter titles%%%%%%%%
\RequirePackage{titlesec}
\titleformat{\chapter}[display]{\Large\bfseries}{Chapter\ \thechapter\,}{0em}{}
\titlespacing{\chapter}{0pt}{-0.2em}{0.8em}
\titlespacing{\section}{0pt}{-0.2em}{0.8em}
%%%%%%%%graphics%%%%%%%%
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{subcaption}
\DeclareGraphicsExtensions{.eps,.ps,.jpg,.bmp}
\graphicspath{{figure/}}

%%%%%%%%bibliography%%%%%%%%
\bibliographystyle{unsrt}
\RequirePackage[numbers,sort&compress]{natbib}
\renewcommand{\bibname}{References}
\setlength{\bibsep}{0ex}

%%%%%%%%other settings%%%%%%%%
\RequirePackage{setspace}
\hyphenation{Safe-book Twi-tter app-roaches com-ponent cyber-space po-int-ed star-t-ed techno-logy re-commendation}

% front matter before main body
\renewcommand{\frontmatter}{%
  \clearpage
  \@mainmatterfalse
  \pagestyle{frontmatter}
}

\newcommand{\contentsmatter}{%
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

% Abstract
\newenvironment{abstract}{%
\clearpage
%\thispagestyle{empty}
\vspace*{\baselineskip}
\begin{center}
\Large\textbf{Abstract}
\end{center}
}

% Declaration
\newenvironment{declaration}{%
\clearpage
%\thispagestyle{empty}
\vspace*{\baselineskip}
\begin{center}
\Large\textbf{Declaration}
\end{center}
}

% Acknowledgement
\newenvironment{acknowledgements}{%
\clearpage
%\thispagestyle{empty}
\vspace*{\baselineskip}
\begin{center}
\Large\textbf{Acknowledgements}
\end{center}
}

% Redefine the title page
\newcommand{\titlepg}{
\begin{titlepage}
	\begin{center}
		\null\vskip1cm
		\begin{singlespace}
			\fontsize{24pt}{2.5\baselineskip}\selectfont{\textbf\textsf\title}
		\end{singlespace}
		\vfill

		\begin{singlespace}
			\fontsize{12pt}{1.66\baselineskip}\selectfont\textbf\textsf{A \reporttype\ submitted in fulfilment of the requirements for\\ the candidature of\\[0.3cm] Doctor of Philosophy}
		\end{singlespace}
		\vfill

		\begin{singlespace}
			\fontsize{12pt}{\baselineskip}\selectfont\textbf\textsf{By}\\[0.6cm]
			\fontsize{16pt}{\baselineskip}\selectfont\textbf\textsf{\author}\\[0.2cm]
			\fontsize{12pt}{1.66\baselineskip}\selectfont\textbf\textsf{Supervisor: \supervisorname}\\
			\ifdefempty{\cosupervisorname}{}{\textbf\textsf{Co-supervisor: \cosupervisorname}}
		\end{singlespace}

		\vfill\vfill
		\IfFileExists{figure/logo.jpg}{\includegraphics[width=4cm]{logo.jpg}}

		\departmentname
		
		\facultyname
		
		\universityname
		
		\submissiondate
	\end{center}

	\IfFileExists{\include{data/abstract}}
	\IfFileExists{\include{data/declaration}}
	\IfFileExists{\include{data/acknowledgements}}

\end{titlepage}
}

% Title Page
\renewcommand{\maketitle}{%
	\frontmatter
	\titlepg
}