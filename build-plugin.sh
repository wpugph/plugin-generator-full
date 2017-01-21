#!/bin/bash

# Read separate config file
source build-plugin.cfg

cd $DEFAULT_DIR
printf "Plugin name: "
read NAME

printf "Destination folder: "
read FOLDER

printf "Include Grunt support? (y/n): "
read GRUNT

printf "Has git support configured? (y/n): "
read NEWREPO

DEFAULT_CLASS=${DEFAULT_NAME// /_}
DEFAULT_TOKEN=$( tr '[A-Z]' '[a-z]' <<< $DEFAULT_CLASS)
DEFAULT_SLUG=${DEFAULT_TOKEN//_/-}

CLASS=${NAME// /_}
TOKEN=$( tr '[A-Z]' '[a-z]' <<< $CLASS)
SLUG=${TOKEN//_/-}
SMALLCASE=TOKEN

if [ "$LOCALSETUP" == "y" ]; then
	# local source
	TEMPFOLDER=$FOLDER
	ORIGFOLDER=$FOLDER
	mkdir -p $TEMPFOLDER
	cd $TEMPFOLDER
	cp -r $LOCALSOURCE $TEMPFOLDER
	cd $SLUG
else
	# GitHub source pull
	git clone $GITSOURCE $FOLDER/$SLUG
	mkdir -p $FOLDER
	cd $FOLDER/$SLUG
fi

echo "Removing git files..."
#$FOLDER=$DEFAULT_DIR

rm -rf .git
rm README.md
rm build-plugin.sh
rm build-plugin.cfg
rm changelog.txt

if [ "$GRUNT" == "n" ]; then
	rm Gruntfile.js
	rm package.json
fi

echo "Updating plugin files..."

mv $DEFAULT_SLUG.php $SLUG.php

cp $SLUG.php $SLUG.tmp
sed "s/$DEFAULT_NAME/$NAME/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp

cp $SLUG.php $SLUG.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp

cp $SLUG.php $SLUG.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp

cp $SLUG.php $SLUG.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp

cp $SLUG.php $SLUG.tmp
sed "s/$DEFAULT_SMALLCASE/$SMALLCASE/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp

cp $SLUG.php $SLUG.tmp
sed "s/$DEFAULT_AUTHOR/$AUTHOR/g" $SLUG.tmp > $SLUG.php
rm $SLUG.tmp

cp readme.txt readme.tmp
sed "s/$DEFAULT_NAME/$NAME/g" readme.tmp > readme.txt
rm readme.tmp

cp uninstall.php uninstall.tmp
sed "s/$DEFAULT_NAME/$NAME/g" uninstall.tmp > uninstall.php
rm uninstall.tmp


cd languages
mv $DEFAULT_SLUG.pot $SLUG.pot

cp $SLUG.pot $SLUG.tmp
sed "s/$DEFAULT_NAME/$NAME/g" $SLUG.tmp > $SLUG.pot
rm $SLUG.tmp

cp $SLUG.pot $SLUG.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" $SLUG.tmp > $SLUG.pot
rm $SLUG.tmp

cp $SLUG.pot $SLUG.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" $SLUG.tmp > $SLUG.pot
rm $SLUG.tmp

cp $SLUG.pot $SLUG.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" $SLUG.tmp > $SLUG.pot
rm $SLUG.tmp

cp $SLUG.pot $SLUG.tmp
sed "s/$DEFAULT_AUTHOR/$AUTHOR/g" $SLUG.tmp > $SLUG.pot
rm $SLUG.tmp


cd ../includes
mv class-$DEFAULT_SLUG.php class-$SLUG.php

cp class-$SLUG.php class-$SLUG.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG.tmp > class-$SLUG.php
rm class-$SLUG.tmp

cp class-$SLUG.php class-$SLUG.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG.tmp > class-$SLUG.php
rm class-$SLUG.tmp

cp class-$SLUG.php class-$SLUG.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG.tmp > class-$SLUG.php
rm class-$SLUG.tmp

cp class-$SLUG.php class-$SLUG.tmp
sed "s/$DEFAULT_NAME/$NAME/g" class-$SLUG.tmp > class-$SLUG.php
rm class-$SLUG.tmp

cp class-$SLUG.php class-$SLUG.tmp
sed "s/$DEFAULT_AUTHOR/$AUTHOR/g" class-$SLUG.tmp > class-$SLUG.php
rm class-$SLUG.tmp

mv class-$DEFAULT_SLUG-settings.php class-$SLUG-settings.php


cp class-$SLUG-settings.php class-$SLUG-settings.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-settings.tmp > class-$SLUG-settings.php
rm class-$SLUG-settings.tmp

cp class-$SLUG-settings.php class-$SLUG-settings.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-settings.tmp > class-$SLUG-settings.php
rm class-$SLUG-settings.tmp

cp class-$SLUG-settings.php class-$SLUG-settings.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-settings.tmp > class-$SLUG-settings.php
rm class-$SLUG-settings.tmp

cp class-$SLUG-settings.php class-$SLUG-settings.tmp
sed "s/$DEFAULT_NAME/$NAME/g" class-$SLUG-settings.tmp > class-$SLUG-settings.php
rm class-$SLUG-settings.tmp

cp class-$SLUG-settings.php class-$SLUG-settings.tmp
sed "s/$DEFAULT_AUTHOR/$AUTHOR/g" class-$SLUG-settings.tmp > class-$SLUG-settings.php
rm class-$SLUG-settings.tmp


cd lib
mv class-$DEFAULT_SLUG-post-type.php class-$SLUG-post-type.php

cp class-$SLUG-post-type.php class-$SLUG-post-type.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-post-type.tmp > class-$SLUG-post-type.php
rm class-$SLUG-post-type.tmp

cp class-$SLUG-post-type.php class-$SLUG-post-type.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-post-type.tmp > class-$SLUG-post-type.php
rm class-$SLUG-post-type.tmp

cp class-$SLUG-post-type.php class-$SLUG-post-type.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-post-type.tmp > class-$SLUG-post-type.php
rm class-$SLUG-post-type.tmp

cp class-$SLUG-post-type.php class-$SLUG-post-type.tmp
sed "s/$DEFAULT_NAME/$NAME/g" class-$SLUG-post-type.tmp > class-$SLUG-post-type.php
rm class-$SLUG-post-type.tmp

cp class-$SLUG-post-type.php class-$SLUG-post-type.tmp
sed "s/$DEFAULT_AUTHOR/$AUTHOR/g" class-$SLUG-post-type.tmp > class-$SLUG-post-type.php
rm class-$SLUG-post-type.tmp


mv class-$DEFAULT_SLUG-taxonomy.php class-$SLUG-taxonomy.php

cp class-$SLUG-taxonomy.php class-$SLUG-taxonomy.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-taxonomy.tmp > class-$SLUG-taxonomy.php
rm class-$SLUG-taxonomy.tmp

cp class-$SLUG-taxonomy.php class-$SLUG-taxonomy.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-taxonomy.tmp > class-$SLUG-taxonomy.php
rm class-$SLUG-taxonomy.tmp

cp class-$SLUG-taxonomy.php class-$SLUG-taxonomy.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-taxonomy.tmp > class-$SLUG-taxonomy.php
rm class-$SLUG-taxonomy.tmp

cp class-$SLUG-taxonomy.php class-$SLUG-taxonomy.tmp
sed "s/$DEFAULT_NAME/$NAME/g" class-$SLUG-taxonomy.tmp > class-$SLUG-taxonomy.php
rm class-$SLUG-taxonomy.tmp

cp class-$SLUG-taxonomy.php class-$SLUG-taxonomy.tmp
sed "s/$DEFAULT_AUTHOR/$AUTHOR/g" class-$SLUG-taxonomy.tmp > class-$SLUG-taxonomy.php
rm class-$SLUG-taxonomy.tmp


mv class-$DEFAULT_SLUG-admin-api.php class-$SLUG-admin-api.php

cp class-$SLUG-admin-api.php class-$SLUG-admin-api.tmp
sed "s/$DEFAULT_CLASS/$CLASS/g" class-$SLUG-admin-api.tmp > class-$SLUG-admin-api.php
rm class-$SLUG-admin-api.tmp

cp class-$SLUG-admin-api.php class-$SLUG-admin-api.tmp
sed "s/$DEFAULT_TOKEN/$TOKEN/g" class-$SLUG-admin-api.tmp > class-$SLUG-admin-api.php
rm class-$SLUG-admin-api.tmp

cp class-$SLUG-admin-api.php class-$SLUG-admin-api.tmp
sed "s/$DEFAULT_SLUG/$SLUG/g" class-$SLUG-admin-api.tmp > class-$SLUG-admin-api.php
rm class-$SLUG-admin-api.tmp

cp class-$SLUG-admin-api.php class-$SLUG-admin-api.tmp
sed "s/$DEFAULT_NAME/$NAME/g" class-$SLUG-admin-api.tmp > class-$SLUG-admin-api.php
rm class-$SLUG-admin-api.tmp

cp class-$SLUG-admin-api.php class-$SLUG-admin-api.tmp
sed "s/$DEFAULT_AUTHOR/$AUTHOR/g" class-$SLUG-admin-api.tmp > class-$SLUG-admin-api.php
rm class-$SLUG-admin-api.tmp


if [ "$NEWREPO" == "y" ]; then
	echo "Initialising assigned git repo..."
	cd ../..
	git init
	git remote add origin $REMOTEREPO
fi

#if [ "$LOCALSETUP" == "y" ]; then
	cd $DEFAULT_DIR
	mv $FOLDER $FOLDER-tmp
	mv $FOLDER-tmp/$SLUG $FOLDER
	rmdir $FOLDER-tmp
#else

#fi

if [ "$NEWREPO" == "y" ]; then
	cd $FOLDER
	git add *
	git commit -m "Initialize starting files for $NAME"
	git push origin master
fi

echo "Complete!"
