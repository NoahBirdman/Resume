\ProvidesClass{bergman-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{888888}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{black}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{black}
\fi
\colorlet{textcolor}{black}
\colorlet{headercolor}{black}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont[]{DejaVu Sans Condensed}
\newfontfamily\thinfont[]{DejaVu Sans Condensed}
\newfontfamily\headingfont[]{DejaVu Sans Condensed}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{DejaVu Sans Condensed}

%\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

%\newfontfamily\bodyfont[]{Arial}
%\newfontfamily\thinfont[]{Arial}
%\newfontfamily\headingfont[]{Arial}
%
%\defaultfontfeatures{Mapping=tex-text}
%\setmainfont[Mapping=tex-text, Color=textcolor]{Arial}

%\setmathfont{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[5]{%
  \begin{tikzpicture}[remember picture,overlay]
    %\node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3.5cm] (box) at (current page.north){};
    \node [anchor=north west] (name) at (current page text area.north west |- 0,2) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\bodyfont #1} {\bodyfont  #2}
    };
     \node [anchor=north east](email) at (current page text area.north east |- 3,1.95) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #4%
    };
     \node [anchor=north east] (phone) at (email.south east) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
     \node [anchor=north east](website) at (phone.south east) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #5%
    };
  \end{tikzpicture}
  \vspace{-3\parskip}
}




%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage[left=2cm,top=2.5cm,right=2cm,bottom=1.25cm,nohead,nofoot]{geometry}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{parskip}
\RequirePackage{titlesec}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        black\or%
        black\or%
        black\or%
        black\or%
        black\or%
        black\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{0pt}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \hrule
  \par\vspace{\parskip}
}



\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}



%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%
%\RequirePackage{Array}
\RequirePackage{tabularx}
\RequirePackage{xifthen}

\RequirePackage{enumitem} %adjust space before enumerate topsep=0pt
\newenvironment{itemizenosep}{%
\begin{itemize}
\let\olditem\item
\vspace{-8pt}}%
{\vspace*{-10pt}\end{itemize}}

\setlength{\tabcolsep}{0pt}

\newcolumntype{L}{>{\hsize=1cm\raggedleft}X}%

\newenvironment{entrylist}{%
  %\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}%Original
  \vspace{-8pt}
  \tabularx{\textwidth}{LXr}
  %\begin{tabular*}{\textwidth}{l}
}{%
  \endtabularx
}
%Use pretty colors for each heading
%\renewcommand{\bfseries}{\headingfont\color{headercolor}}


%\newcommand{\entry}[5]{%
%  &\begin{minipage}[t]{0.8\linewidth}%
%		\textbf{#1}\\% 
%	    #4\\%
%	    #5%
%	\end{minipage}
% 	\hfill
%  	\begin{minipage}[t]{0.18\linewidth}
%	  	\begin{\flushleft}%
%	  	{\small\addfontfeature{Color=darkgray} #2}\\%
%	  	{\small\addfontfeature{Color=darkgray} #3}%
%	  	\end{\flushleft}%
%  	\end{minipage}
%  }

%\newcommand{\entry}[5]{%
% 	&\parbox[t]{0.4\linewidth}{%
%	    \textbf{#1}%
%    }%
%	&\parbox[t]{0.4\linewidth}{%
%	   	{\small\addfontfeature{Color=darkgray} #2}%
%	}\\
%    &\parbox[t]{0.4\linewidth}{%
%    	#4%
%    }%
%    &\parbox[t]{0.4\linewidth}{%
%    	{\small\addfontfeature{Color=darkgray} #3}%
%    }\\
%    &\parbox[t]{0.4\linewidth}{%
%    	#5\vspace{\parsep}%
%    }&}
%  
%\newcommand{\entry}[5]{%
% 	& \textbf{#1} & {\small\addfontfeature{Color=darkgray} #2} \\%
%    & #4 & {\small\addfontfeature{Color=darkgray} #3} \\%
%    & #5 &%
%    }

\newcommand{\entry}[5]{%
 	& \textbf{#1} &{\small\addfontfeature{Color=black} #2}\tabularnewline%
    & #4 & {\small\addfontfeature{Color=black} #3} \tabularnewline%
    & #5 & \tabularnewline%
    }
  
\newcommand{\entryFourItem}[4]{%
 	& \textbf{#1} &{\small\addfontfeature{Color=black} #2}\tabularnewline%
    & #4 & {\small\addfontfeature{Color=black} #3}\vspace*{2pt} \tabularnewline%
    }
%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

%\RequirePackage[absolute,overlay]{textpos}
%\setlength{\TPHorizModule}{1cm}
%\setlength{\TPVertModule}{1cm}
%\newenvironment{aside}{%
%  \let\oldsection\section
%  \renewcommand{\section}[1]{
%    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
%  }
%  \begin{textblock}{3.7}(1.5, 3.5)
%  \begin{flushright}
%  \obeycr
%}{%
%  \restorecr
%  \end{flushright}
%  \end{textblock}
%  \let\section\oldsection
%}


%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%
%
%\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}
%
%\DeclareFieldFormat[article]{title}{#1\par}
%\DeclareFieldFormat[book]{title}{#1\par}
%\DeclareFieldFormat[inproceedings]{title}{#1\par}
%\DeclareFieldFormat[misc]{title}{#1\par}
%\DeclareFieldFormat[report]{title}{#1\par}
%
%\DeclareBibliographyDriver{article}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \usebibmacro{journal+issuetitle}%
%    \setunit{\space}%
%    \printfield{pages}%
%    \newunit%
%    \printlist{publisher}%
%    \setunit*{\addcomma\space}%
%    \printfield{year}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{book}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \printlist{publisher}%
%    \setunit*{\addcomma\space}%
%    \printfield{note}%
%    \setunit*{\addcomma\space}%
%    \printfield{year}%
%    \setunit{\addcomma\space}%
%    \printlist{location}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%
%\DeclareBibliographyDriver{inproceedings}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}%
%    \printfield{booktitle}%
%    \setunit{\addcomma\space}%
%    \printfield{year}%
%    \setunit{\addcomma\space}%
%    \printlist{location}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{misc}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \printfield{booktitle}%
%    \setunit*{\addcomma\space}%
%    \printfield{note}%
%    \setunit*{\addcomma\space}%
%    \printfield{year}%
%    \setunit{\addcomma\space}%
%    \printlist{location}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareBibliographyDriver{report}{%
%  \printfield{title}%
%  \newblock%
%  \printnames{author}%
%  \par%
%  \newblock%
%  {%
%    \footnotesize\addfontfeature{Color=lightgray}\itshape%
%    \printfield{type}%
%    \setunit{\space}%
%    \printfield{number}%
%    \setunit{\addcomma\space}%
%    \printfield{year}%
%    \newunit%
%  }
%  \par\vspace{0.3\baselineskip}
%}
%
%\DeclareNameFormat{author}{%
%  \small\addfontfeature{Color=lightgray}%
%  \ifblank{#3}{}{#3\space}#1%
%  \ifthenelse{\value{listcount}<\value{liststop}}
%    {\addcomma\space}
%    {}%
%}
%
%\newcommand{\printbibsection}[2]{
%  \begin{refsection}
%    \nocite{*}
%    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
%  \end{refsection}
%}
%
%\DeclareSortingScheme{chronological}{
%  \sort[direction=descending]{\field{year}}
%  \sort[direction=descending]{\field{month}}
%}
%


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

