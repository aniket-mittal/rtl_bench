module origen_075911(
    input a, b, c, d, e, f, g, h, i, j, k, l, m, n,
    output o, p, q, r, s
);
    wire new_n20_, new_n21_, new_n22_, new_n23_, new_n24_, new_n25_, new_n26_,
         new_n27_, new_n28_, new_n29_, new_n30_, new_n31_, new_n32_, new_n34_,
         new_n35_, new_n36_, new_n37_, new_n38_, new_n39_, new_n41_, new_n42_,
         new_n43_, new_n44_, new_n45_, new_n46_, new_n48_, new_n49_, new_n50_,
         new_n51_, new_n52_, new_n53_, new_n54_, new_n55_;

    assign new_n20_ = ~d & ~f;
    assign new_n21_ = j & n;
    assign new_n22_ = ~new_n20_ & ~new_n21_;
    assign new_n23_ = c & e;
    assign new_n24_ = ~new_n22_ & new_n23_;
    assign new_n25_ = ~d & ~f & ~new_n21_ & new_n23_;
    assign new_n26_ = ~a & ~new_n25_;
    assign new_n27_ = ~i & ~new_n26_;
    assign new_n28_ = ~new_n24_ & ~new_n27_;
    assign new_n29_ = ~a & ~new_n24_;
    assign new_n30_ = ~i & ~new_n29_;
    assign new_n31_ = ~new_n28_ & ~new_n30_;
    assign new_n32_ = ~new_n25_ & ~new_n31_;
    assign o = ~new_n32_;

    assign new_n34_ = ~b & ~new_n25_;
    assign new_n35_ = ~i & ~new_n34_;
    assign new_n36_ = ~new_n24_ & ~new_n35_;
    assign new_n37_ = ~k & ~new_n36_;
    assign new_n38_ = ~new_n24_ & ~new_n37_;
    assign new_n39_ = ~new_n25_ & ~new_n38_;
    assign p = ~new_n39_;

    assign new_n41_ = ~g & ~new_n25_;
    assign new_n42_ = ~i & ~new_n41_;
    assign new_n43_ = ~new_n24_ & ~new_n42_;
    assign new_n44_ = ~l & ~new_n43_;
    assign new_n45_ = ~new_n24_ & ~new_n44_;
    assign new_n46_ = ~new_n25_ & ~new_n45_;
    assign q = ~new_n46_;

    assign new_n48_ = ~h & ~new_n25_;
    assign new_n49_ = ~i & ~new_n48_;
    assign new_n50_ = ~new_n24_ & ~new_n49_;
    assign new_n51_ = ~m & ~new_n50_;
    assign new_n52_ = ~new_n24_ & ~new_n51_;
    assign new_n53_ = ~new_n25_ & ~new_n52_;
    assign new_n54_ = ~new_n24_ & ~new_n53_;
    assign new_n55_ = ~new_n25_ & ~new_n54_;
    assign r = ~new_n55_;

    assign s = e & new_n21_;
endmodule