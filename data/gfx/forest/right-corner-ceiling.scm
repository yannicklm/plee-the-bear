;
;  Plee the Bear -- gfx script tools
;
;  Copyright (C) 2005-2010 Julien Jorge, Sebastien Angibaud
;
;  This program is free software; you can redistribute it and/or modify it
;  under the terms of the GNU General Public License as published by the
;  Free Software Foundation; either version 2 of the License, or (at your
;  option) any later version.
;
;  This program is distributed in the hope that it will be useful, but WITHOUT
;  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
;  more details.
;
;  You should have received a copy of the GNU General Public License along
;  with this program; if not, write to the Free Software Foundation, Inc.,
;  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;
;  contact: plee-the-bear@gamned.org
;
;  Please add the tag [PTB] in the subject of your mails.
;
; --
;
; This script is intended to be run in this directory and via gimp-console:
;
;   gimp-console -b - < this_script.scm
;
(load "../../common.scm")

(let ( (src_name "right-corner-ceiling.xcf.bz2")
       (plant_name "wall-plant.xcf.bz2")
       (dest_name "right-corner-ceiling.png") )
  (let ( (src_image (car (gimp-file-load 1 src_name src_name)))
         (plant_image (car (gimp-file-load 1 plant_name plant_name)))
         (dest (car (gimp-image-new 256 256 RGB)))
         )
    ( create-layer
      src_image '(0 1 2 3) 0  0 256 256 dest )
    ( create-layer-crop
      plant_image '(0 1 2 3 4 5 6 7 8 9 10 11)
      0 0 172 206 0 128 86 103 dest '() )

    (save-frames-and-exit dest_name dest)
    ) ; let
  ) ; let
