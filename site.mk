##	gluon site.mk makefile example

##	GLUON_FEATURES
#		Specify Gluon features/packages to enable;
#		Gluon will automatically enable a set of packages
#		depending on the combination of features listed

GLUON_FEATURES := \
	autoupdater \
	ebtables-filter-multicast \
	ebtables-filter-ra-dhcp \
	ebtables-limit-arp \
	mesh-batman-adv-14 \
	mesh-vpn-fastd \
	radvd \
	respondd \
	status-page \
	web-advanced \
	web-wizard

##	GLUON_MULTIDOMAIN
#		Build gluon with multidomain support.

GLUON_MULTIDOMAIN=1

##	GLUON_SITE_PACKAGES
#		specify gluon/openwrt packages to include here
#		The gluon-mesh-batman-adv-* package must come first because of the dependency resolution


GLUON_SITE_PACKAGES := \
    
GLUON_SITE_PACKAGES := \
    gluon-config-mode-geo-location \
    gluon-ebtables-filter-multicast \
    gluon-ebtables-filter-ra-dhcp \
    -gluon-web-autoupdater \
    gluon-web-private-wifi \
    gluon-setup-mode \
    ffue-banner \
    haveged \
    iptables \
    iwinfo \
   	respondd-module-airtime \
    tecff-autoupdater-wifi-fallback \
    ffgt-speedtest \
    ffue-migrate-to-multidomain \
    ffgt-gluon-respondd

# Wenn FFHO-web-autoupdater weg ist, dann web-autoupdater einschalten!
#

#	some models and targets have to be excluded:
ifeq ($(GLUON_TARGET),ar71xx-tiny)
	GLUON_tp-link-tl-wr841n-nd-v7_SITE_PACKAGES = -ffffm-button-bind
else
    GLUON_SITE_PACKAGES += tcpdump mtr ip-full
endif

##	DEFAULT_GLUON_RELEASE
#		version string to use for images
#		gluon relies on
#			opkg compare-versions "$1" '>>' "$2"
#		to decide if a version is newer or not.

DEFAULT_GLUON_RELEASE := 1.10


##	GLUON_RELEASE
#		call make with custom GLUON_RELEASE flag, to use your own release version scheme.
#		e.g.:
#			$ make images GLUON_RELEASE=23.42+5
#		would generate images named like this:
#			gluon-ff%site_code%-23.42+5-%router_model%.bin

# Allow overriding the release number from the command line
GLUON_RELEASE ?= $(DEFAULT_GLUON_RELEASE)

GLUON_PRIORITY ?= 0

# Region code required for some images; supported values: us eu
GLUON_REGION ?= eu

# Languages to include
GLUON_LANGS ?= de en

GLUON_DEPRECATED = upgrade
