module autovcoder_102598 (
    zn,
    a1,
    a2,
    b1,
    b2,
    c1,
    c2
);
  output zn;
  input a1;
  input a2;
  input b1;
  input b2;
  input c1;
  input c2;
  `protect
  wire c2znstate0, a1znstate1, c2znstate1, b1znstate0, a2znstate0, b1znstate1, c1znstate0, a2znstate1, b2znstate0, c1znstate1;
  wire b2znstate1, a1znstate0;

  specify
    // Pin-to-pin timing.
    if (a1 & a2 & b1 & b2) (c1 => zn) = (0, 0);
    if (a1 & a2 & b1 & b2) (c2 => zn) = (0, 0);
    if (a1 & a2 & c1 & c2) (b1 => zn) = (0, 0);
    if (a1 & a2 & c1 & c2) (b2 => zn) = (0, 0);
    if (a1znstate0) (a1 => zn) = (0, 0);
    if (a1znstate1) (a1 => zn) = (0, 0);
    if (a2znstate0) (a2 => zn) = (0, 0);
    if (a2znstate1) (a2 => zn) = (0, 0);
    if (b1 & b2 & c1 & c2) (a1 => zn) = (0, 0);
    if (b1 & b2 & c1 & c2) (a2 => zn) = (0, 0);
    if (b1znstate0) (b1 => zn) = (0, 0);
    if (b1znstate1) (b1 => zn) = (0, 0);
    if (b2znstate0) (b2 => zn) = (0, 0);
    if (b2znstate1) (b2 => zn) = (0, 0);
    if (c1znstate0) (c1 => zn) = (0, 0);
    if (c1znstate1) (c1 => zn) = (0, 0);
    if (c2znstate0) (c2 => zn) = (0, 0);
    if (c2znstate1) (c2 => zn) = (0, 0);
    ifnone (a1 => zn) = (0, 0);
    ifnone (a2 => zn) = (0, 0);
    ifnone (b1 => zn) = (0, 0);
    ifnone (b2 => zn) = (0, 0);
    ifnone (c1 => zn) = (0, 0);
    ifnone (c2 => zn) = (0, 0);
  endspecify

  // Gate-level description.
  or _i0 (_n1, a1, a2);
  or _i1 (_n2, b1, b2);
  or _i2 (_n3, c1, c2);
  nand _i3 (zn, _n1, _n2, _n3);

  // Timing check and state logic.
  not _wi0 (_wn2, a1);
  not _wi1 (_wn5, b1);
  and _wi2 (_wn4, _wn5, b2);
  not _wi3 (_wn7, b2);
  and _wi4 (_wn6, b1, _wn7);
  or _wi5 (_wn3, _wn4, _wn6);
  and _wi6 (_wn1, _wn2, a2, _wn3);
  not _wi7 (_wn9, a2);
  and _wi13 (_wn8, a1, _wn9, _wn3);
  or _wi14 (c2znstate0, _wn1, _wn8);
  and _wi16 (_wn16, c2, c1, _wn5, b2);
  and _wi18 (_wn20, c2, _wn7, c1);
  not _wi19 (_wn25, c1);
  and _wi20 (_wn24, _wn25, c2);
  not _wi21 (_wn27, c2);
  and _wi22 (_wn26, c1, _wn27);
  or _wi23 (_wn23, _wn24, _wn26);
  and _wi24 (_wn22, b2, _wn23);
  or _wi25 (_wn19, _wn20, _wn22);
  and _wi26 (_wn18, b1, _wn19);
  or _wi27 (a1znstate1, _wn16, _wn18);
  and _wi29 (_wn29, b2, b1, _wn2, a2);
  and _wi31 (_wn33, b2, _wn9, b1);
  and _wi37 (_wn35, a2, _wn3);
  or _wi38 (_wn32, _wn33, _wn35);
  and _wi39 (_wn31, a1, _wn32);
  or _wi40 (c2znstate1, _wn29, _wn31);
  and _wi47 (_wn42, _wn2, a2, _wn23);
  and _wi54 (_wn49, a1, _wn9, _wn23);
  or _wi55 (b1znstate0, _wn42, _wn49);
  and _wi62 (_wn57, _wn5, b2, _wn23);
  and _wi69 (_wn64, b1, _wn7, _wn23);
  or _wi70 (a2znstate0, _wn57, _wn64);
  and _wi72 (_wn72, c2, c1, _wn2, a2);
  and _wi74 (_wn76, c2, _wn9, c1);
  and _wi80 (_wn78, a2, _wn23);
  or _wi81 (_wn75, _wn76, _wn78);
  and _wi82 (_wn74, a1, _wn75);
  or _wi83 (b1znstate1, _wn72, _wn74);
  or _wi98 (c1znstate0, _wn1, _wn8);
  or _wi111 (a2znstate1, _wn16, _wn18);
  or _wi126 (b2znstate0, _wn42, _wn49);
  or _wi139 (c1znstate1, _wn29, _wn31);
  or _wi152 (b2znstate1, _wn72, _wn74);
  or _wi167 (a1znstate0, _wn57, _wn64);
  `endprotect
endmodule

