# import::into

requires 'Import::Into';

# web request


# third part module I use
requires 'Moose';
requires 'Time::Moment';
requires 'Set::Scalar';
requires 'IO::Scalar';
requires 'Git::Raw';
requires 'Exporter::Auto';
requires 'JSON';
requires 'Text::Xslate';
requires 'LWP::Simple';
requires 'Email::Stuffer';
requires 'Log::Log4perl';
requires 'App::Git::Workflow';

# web framework
requires 'Dancer2'; 

requires 'IPC::System::Simple';


# debug
requires 'Data::Printer';
# tidy 
requires 'Code::TidyAll';

# RSS
requires 'XML::RSS::Parser';

# Chinese
requires 'Lingua::ZH::Jieba'; 


# You can install modules using cpanfile in current directory by --installdeps option of cpanm.
#
#  cpanm --installdeps .
#
# You can also install modules into specified directory by -L option.
#
# cpanm -L extlib --installdeps .
# 
# install to ~/perl5/lib/ 
#
# cpanm -L ~/perl5  Data::Printer
#
# add Std and perl5 to PERL5LIB
#
# export PERL5LIB=$PERL5LIB:~/Std/lib/:/home/hwu/perl5/lib/perl5
# README

# run  sudo apt-get install libxml2-dev first to install libxml
#
# cpanm -L ~/perl5 --installdeps .
