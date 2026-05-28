#!/usr/bin/env bash
# Copy the cups-filters pxlcolor PPD into /etc/cups/ppd/ as a real file
# owned root:lp (mode 0640). The queue defined in
# files/system/etc/cups/printers.conf references this PPD by name.
#
# A symlink under files/system/etc/cups/ppd/ would work for cupsd itself,
# but COSMIC settings (and likely other CUPS admin GUIs) refuse to open
# a queue whose PPD is a symlink — it errors with "there was a problem
# connecting to the CUPS server" when you double-click the queue.
# Hence the file copy at image build time.
set -euo pipefail

src=/usr/share/ppd/cupsfilters/pxlcolor.ppd
dst=/etc/cups/ppd/Brother-HL-3070CW-series.ppd

install -D -m 0640 -o root -g lp "$src" "$dst"
