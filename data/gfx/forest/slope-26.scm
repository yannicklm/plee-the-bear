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

(let ( (src_name "slope-26.xcf.bz2")
       (dest_26_left_name "slope-26-left.png")
       (dest_26_right_name "slope-26-right.png")
       (dest_26_s_left_name "slope-26s-left.png")
       (dest_26_s_right_name "slope-26s-right.png") )
  (let ( (src_image (car (gimp-file-load 1 src_name src_name)))
         (dest_26_left (car (gimp-image-new 256 256 RGB)))
         (dest_26_right (car (gimp-image-new 256 256 RGB)))
         (dest_26_s_left (car (gimp-image-new 256 256 RGB)))
         (dest_26_s_right (car (gimp-image-new 256 256 RGB)))
         )
    ( create-layer-crop
      src_image '(2 5 7 9 11 13 14) 0 256 512 512
      0  0 256 256 dest_26_left '(3) )
    ( create-layer-crop
      src_image '(2 5 7 9 11 13 14) 512 0 512 512
      0  0 256 256 dest_26_right '(3) )

; S
    ( create-layer-crop
      src_image '(2 6 8 10 12 13 14) 0 256 512 512
      0  0 256 256 dest_26_s_left '(4) )
    ( create-layer-crop
      src_image '(2 6 8 10 12 13 14) 512 0 512 512
      0  0 256 256 dest_26_s_right '(4) )

    (save-frames dest_26_left_name dest_26_left)
    (save-frames dest_26_right_name dest_26_right)
    (save-frames dest_26_s_left_name dest_26_s_left)
    (save-frames-and-exit dest_26_s_right_name dest_26_s_right)
    ) ; let
  ) ; let
