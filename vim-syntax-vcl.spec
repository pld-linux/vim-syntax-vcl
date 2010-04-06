%define		syntax vcl
Summary:	Vim syntax: Varnish configuation Language
Name:		vim-syntax-%{syntax}
Version:	1.7
Release:	1
License:	GPL v2
Group:		Applications/Editors/Vim
Source0:	vcl.vim
URL:		http://cvs.pld-linux.org/cgi-bin/cvsweb.cgi/packages/vim-syntax-vcl/
Requires:	vim-rt >= 4:7.2.170
BuildArch:	noarch
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%define		_vimdatadir	%{_datadir}/vim

%description
Vim syntax for Varnish configuation Language (VCL).

%prep
rev=$(awk '/^".*Revision:/{print $5}' %{SOURCE0})
if [ "$rev" != "%{version}" ]; then
	: Update version $rev, and retry
	exit 1
fi

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{_vimdatadir}/{syntax,ftdetect}
cp -a %{SOURCE0} $RPM_BUILD_ROOT%{_vimdatadir}/syntax

cat > $RPM_BUILD_ROOT%{_vimdatadir}/ftdetect/%{syntax}.vim <<-EOF
au BufNewFile,BufRead *.vcl	setf %{syntax}
EOF

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%{_vimdatadir}/syntax/*.vim
%{_vimdatadir}/ftdetect/*.vim
