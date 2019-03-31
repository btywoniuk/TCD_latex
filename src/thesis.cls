%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{src/thesis}[2018/05/15 v2.2 TCD thesis class]
%-------------------------- initial code -----------------------
\def\logoversion{squarelogo}
\DeclareOption{beltcrest}{\def\logoversion{beltcrest}}
\DeclareOption{shieldcrest}{\def\logoversion{shieldcrest}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
% \LoadClass[a4paper]{report}
% As an alternative to the above could use next line for twosided output
\LoadClass[a4paper,twoside,openright]{report}
\RequirePackage{graphicx} % needed for latest frontpage logo
\RequirePackage{ifthen}   % needed for option parsing for logo
\raggedbottom
%define the default submitted text
\newcommand{\submittedtext}{{A thesis submitted for the degree of}}
\newcommand{\supervisedtext}{{Supervised by}}
%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.
\def\author#1{\gdef\@author{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\college#1{\gdef\@college{#1}}
\def\university#1{\gdef\@university{#1}}
\def\degreedate#1{\gdef\@degreedate{#1}}
%
% Setup choosen logo
\ifthenelse{\equal{\logoversion}{squarelogo}}%
{
\def\logo{{\includegraphics[width=40mm]{img/logo}}}
}{}

%
% Define text area of page and margin offsets
%
\setlength{\topmargin}{0.0in}
\setlength{\oddsidemargin}{0.33in}
\setlength{\evensidemargin}{-0.08in}
\setlength{\textheight}{9.0in}
\setlength{\textwidth}{6.0in}
%
% Environments
%
% This macro define an environment for front matter that is always 
% single column even in a double-column document.
\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}
%define title page layout
\renewcommand{\maketitle}{%
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
  \null\vfill
  \begin{center}
    { \Huge {\bfseries {\@title}} \par}
\vspace*{15mm}
    {{\Large \@author} \par}
\vspace*{2mm}
{\large \vspace*{10mm} {\logo \par} \vspace*{15mm}}
    {{\submittedtext} \par}
\vspace*{1ex}
    {\it {\@degree} \par}
\vspace*{3ex}
    {{\supervisedtext} \par}
    {\it {\@supervisor} \par}
{\large \vspace*{5ex}
    {{\@college} \par}
\vspace*{0.1ex}
    {{\@university} \par}
\vspace*{\fill}
    {\@degreedate}}
  \end{center}
  \null\vfill
\end{alwayssingle}}
% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.
\newenvironment{dedication}
{\begin{alwayssingle}
  \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{verse}\begin{center}}
{\end{center}\end{verse}\end{alwayssingle}}
% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.
\newenvironment{acknowledgements}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}
% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.
\newenvironment{acknowledgementslong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}
% Publications
%
% The publications environment puts a large, bold, centered 
% "publications" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.
\newenvironment{publications}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Publications}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}
% The publicationslong environment puts a large, bold, centered 
% "Publications" label at the top of the page. The Publications itself 
% does not appears in a quote environment so you can get more in.
\newenvironment{publicationslong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Publications}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}
% STATEMENT OF ORIGINALITY
%
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.
\newenvironment{originality}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}
{\bigskip
\begin{flushright}
    \begin{tabular}{p{5cm}}
        \\ \hline
        \centering \@author\\
    \end{tabular}
\end{flushright}}
\end{alwayssingle}}
% The originalitylong environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself does not appears in a quote environment so you can 
% get more in.
\newenvironment{originalitylong}
{\begin{alwayssingle} \thispagestyle{empty}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}
%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.
\renewenvironment{abstract} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}
%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.
\newenvironment{abstractlong} {\begin{alwayssingle} \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}}
{\end{alwayssingle}}
%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately
\newenvironment{abstractseparate} {\begin{alwayssingle} \thispagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@college} \par}
    {University of Oxford \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}
%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).
\newenvironment{romanpages}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}
% ********************************************************************
% Colors
% ********************************************************************
\PassOptionsToPackage{dvipsnames}{xcolor}
    \RequirePackage{xcolor} % [dvipsnames]
\definecolor{halfgray}{gray}{0.55} % chapter numbers will be semi transparent .5 .55 .6 .0
\definecolor{webgreen}{rgb}{0,.5,0}
\definecolor{webbrown}{rgb}{.6,0,0}
% *****************************************************
% Additional packages
% *****************************************************
\usepackage{amssymb}
\usepackage{capt-of}
\usepackage{setspace}
\usepackage[utf8]{inputenc}
\usepackage[version=4]{mhchem}
\usepackage[raggedright]{titlesec}
\usepackage[colorlinks=true]{hyperref}
\usepackage[printonlyused,smaller]{acronym}
\usepackage[backend=biber,bibencoding=ascii,language=auto,style=ieee,sorting=ynt,maxbibnames=10,natbib=true]{biblatex}
% *****************************************************
% Additional packages settings
% *****************************************************
\hypersetup{%
  %draft, % hyperref's draft mode, for printing see below
  colorlinks=true, linktocpage=true, pdfstartpage=3, pdfstartview=FitV,%
  % uncomment the following line if you want to have black links (e.g., for printing)
  %colorlinks=false, linktocpage=false, pdfstartpage=3, pdfstartview=FitV, pdfborder={0 0 0},%
  breaklinks=true, pdfpagemode=UseNone, pageanchor=true, pdfpagemode=UseOutlines,%
  plainpages=false, bookmarksnumbered, bookmarksopen=true, bookmarksopenlevel=1,%
  hypertexnames=true, pdfhighlight=/O,%nesting=true,%frenchlinks,%
  urlcolor=webbrown, linkcolor=RoyalBlue, citecolor=webgreen, %pagecolor=RoyalBlue,%
  %urlcolor=Black, linkcolor=Black, citecolor=Black, %pagecolor=Black,%
  pdftitle={Thesis},%
  pdfauthor={Bartlomiej Tywoniuk},%
  pdfsubject={},%
  pdfkeywords={Thseis, LaTeX, PhD},%
  pdfcreator={pdfLaTeX},%
  pdfproducer={LaTeX with hyperref and classicthesis}%
}
