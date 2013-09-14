#!/bin/sh

#mount directory of USB stick
DIR="/run/media/bkoenig/Rotate"


rsync -av /home/bkoenig/Documents $DIR/bkoenig
rsync -av /home/bkoenig/Public $DIR/bkoenig

#rsync -av /home/bkoenig/.thunderbird $DIR/bkoenig
