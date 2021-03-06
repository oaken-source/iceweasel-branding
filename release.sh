#!/bin/bash

set -eu

pkgname=iceweasel
pkgver=54.0
pkgrel=1

srcdir=src
distdir=${pkgname}-${pkgver}
tarball=${pkgname}_${pkgver}-${pkgrel}.branding.tar.xz

rm -rf $distdir/
mkdir -pv $distdir

cp -rv $srcdir/* $distdir/

rm -f ${tarball}{,.sig}
tar -cJf $tarball $distdir
gpg --output ${tarball}.sig --detach-sig $tarball
rm -rf $distdir

echo "dist tarball:   $tarball"
echo "dist signature: $tarball.sig"
