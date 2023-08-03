## Note: This Dockerfile is a lightly modified version of the r2u Dockerfile
## maintained by Dirk Eddelbuettel here: https://github.com/rocker-org/r2u

FROM mcr.microsoft.com/devcontainers/base:jammy

## Set a default user. Available via runtime flag `--user docker` 
## Add user to 'staff' group, granting them write privileges to /usr/local/lib/R/site.library
## User should also have & own a home directory (for rstudio or linked volumes to work properly). 
RUN useradd -s /bin/bash -m docker \
	&& usermod -a -G staff docker \
## Refresh apt, install minimal tools
        && apt-get update \
	&& apt-get install -y --no-install-recommends \
		ca-certificates \
		locales \
		wget \
## Install key and setup R repo at CRAN
        && wget -q -O - https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc \
                | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc  \
        && echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/cran_ubuntu_key.asc] https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/" \
                > /etc/apt/sources.list.d/cran.list \
## Install key and setup r2u repo, also set 'pin preference'
        && wget -q -O - https://r2u.stat.illinois.edu/ubuntu/dirk_eddelbuettel_pubkey.asc \
                | tee -a /etc/apt/trusted.gpg.d/dirk_eddelbuettel_pubkey.asc \
        && echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/dirk_eddelbuettel_pubkey.asc] https://r2u.stat.illinois.edu/ubuntu jammy main" \
                > /etc/apt/sources.list.d/r2u.list \
        && echo "Package: *" > /etc/apt/preferences.d/99r2u \
        && echo "Pin: release o=CRAN-Apt Project" >> /etc/apt/preferences.d/99r2u \
        && echo "Pin: release l=CRAN-Apt Packages" >> /etc/apt/preferences.d/99r2u \
        && echo "Pin-Priority: 700"  >> /etc/apt/preferences.d/99r2u \
## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
        && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

## Set some variables
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV TZ UTC


# Now install R and littler, and create a link for littler in /usr/local/bin
# Default CRAN repo is now set by R itself, and littler knows about it too
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
 		 r-base \
 		 r-base-dev \
 		 r-recommended \
## Install bspm for r2u as well as remotes and docopt used in littler script
                 r-cran-bspm \
                 r-cran-docopt \
                 r-cran-littler \
                 r-cran-remotes \
## Install python support for bspm
                 python3-dbus \
                 python3-gi \
                 python3-apt \
## Support user-level installation of R packages
	&& chown root:staff "/usr/local/lib/R/site-library" \
	&& chmod g+ws "/usr/local/lib/R/site-library" \
## Install a number littler scripts
  	&& ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/installDeps.r /usr/local/bin/installDeps.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/installRub.r /usr/local/bin/installRub.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
  	&& ln -s /usr/lib/R/site-library/littler/examples/update.r /usr/local/bin/update.r \
## Configure bspm and set one helpful apt default
        && echo "suppressMessages(bspm::enable())" >> /etc/R/Rprofile.site \
        && echo "options(bspm.version.check=FALSE)" >> /etc/R/Rprofile.site \
        && echo "options(bspm.sudo=TRUE)" >> /etc/R/Rprofile.site \
        && echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/90local-no-recommends \
	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
 	&& rm -rf /var/lib/apt/lists/*