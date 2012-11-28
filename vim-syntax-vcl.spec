%define		syntax vcl
Summary:	Vim syntax: Varnish configuation Language
Name:		vim-syntax-%{syntax}
Version:	1.8
Release:	1
License:	GPL v2
Group:		Applications/Editors/Vim
Source0:	vcl.vim
Source1:	ftdetect.vim
URL:		http://git.pld-linux.org/packages/vim-syntax-vcl/
Requires:	vim-rt >= 4:7.2.170
BuildArch:	noarch
BuildRoot:	%{tmpdir}/%{name}-%{version}-root-%(id -u -n)

%define		_vimdatadir	%{_datadir}/vim

%description
Vim syntax for Varnish configuation Language (VCL).

%prep
rev=$(awk '/^".*Revision:/{print $3}' %{SOURCE0})
if [ "$rev" != "%{version}" ]; then
	: Update version $rev, and retry
	exit 1
fi

%install
rm -rf $RPM_BUILD_ROOT
install -d $RPM_BUILD_ROOT%{_vimdatadir}/{syntax,ftdetect}
cp -p %{SOURCE0} $RPM_BUILD_ROOT%{_vimdatadir}/syntax/%{syntax}.vim
cp -p %{SOURCE1} $RPM_BUILD_ROOT%{_vimdatadir}/ftdetect/%{syntax}.vim

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%{_vimdatadir}/syntax/*.vim
%{_vimdatadir}/ftdetect/*.vim
