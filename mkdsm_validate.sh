#!/bin/sh
#
# Validate that we have all the stuff we need...
#

# Say hi...
echo ""
echo "Validating the environment..."
if [ "$DSMBUILDER" != "good" ] ;then
        echo "  please run ./mkdsm.sh"
        exit 1
fi


#
# Stuff that everybody needs...
#

# cmake
echo "  ...checking for cmake"
if ! which cmake &> /dev/null; then
	echo "  Please install 'cmake'..."
	exit 1
fi

# dos2unix
echo "  ...checking for dos2unix"
if ! which dos2unix &> /dev/null; then
	echo "  Please install 'dos2unix'..."
	exit 1
fi

# g++
echo "  ...checking for g++"
if ! which g++ &> /dev/null; then
	echo "  Please install 'g++'..."
	exit 1
fi

# make
echo "  ...checking for make"
if ! which make &> /dev/null; then
	echo "  Please install 'build-essentials'..."
	exit 1
fi


#
# Stuff that Ubuntu needs...
#
if [ "$OSNAME" == "ubuntu" ] ;then

	# debuild
	echo "  ...checking for debuild"
	if ! which debuild &> /dev/null; then
		echo "  Please install 'debuild'..."
		exit 1
	fi

	# gpg
	echo "  ...checking for gpg"
	if ! which gpg &> /dev/null; then
		echo "  Please install 'gpg'..."
		exit 1
	fi


#
# Stuff that SuSE needs...
#
elif [ "$OSNAME" = "suse" ] ;then

	# rpmbuild
	echo "  ...checking for rpmbuild"
	if ! which rpmbuild &> /dev/null; then
		echo "  Please install 'rpmbuild'..."
		exit 1
	fi


#
# Ruh-roh...
#
else
	echo "  unsupported os..." $OSNAME
	exit 1
fi


# Bye-bye...
exit 0
