module origen_051758(
    input x0, x1, x2, x3, x4, x5,
    output z0, z1, z2, z3, z4, z5, z6, z7
);
    wire new_n15_, new_n16_, new_n17_, new_n18_, new_n19_, new_n20_, new_n21_, new_n22_, new_n23_;
    wire new_n24_, new_n25_, new_n26_, new_n27_, new_n28_, new_n29_, new_n30_, new_n31_, new_n32_;
    wire new_n33_, new_n34_, new_n35_, new_n36_, new_n37_, new_n38_, new_n39_, new_n40_, new_n41_;
    wire new_n42_, new_n43_, new_n44_, new_n45_, new_n46_, new_n47_;

    assign new_n15_ = ~x4 & ~x5;
    assign new_n16_ = x0 & x1;
    assign new_n17_ = ~x0 & ~x1;
    assign new_n18_ = ~x2 & x3;
    assign new_n19_ = new_n15_ & new_n18_;
    assign new_n20_ = new_n16_ & new_n19_;
    assign new_n21_ = new_n17_ & new_n19_;
    assign new_n22_ = x2 & ~x3;
    assign new_n23_ = new_n15_ & new_n22_;
    assign new_n24_ = new_n16_ & new_n23_;
    assign new_n25_ = new_n17_ & new_n23_;
    assign new_n26_ = ~new_n20_ & ~new_n24_;
    assign new_n27_ = ~new_n21_ & ~new_n25_;
    assign new_n28_ = new_n26_ & new_n27_;
    assign new_n29_ = x0 & ~x1;
    assign new_n30_ = ~x0 & x1;
    assign new_n31_ = new_n19_ & new_n29_;
    assign new_n32_ = new_n23_ & new_n30_;
    assign new_n33_ = ~new_n31_ & ~new_n32_;
    assign new_n34_ = new_n19_ & new_n30_;
    assign new_n35_ = new_n23_ & new_n29_;
    assign new_n36_ = ~new_n34_ & ~new_n35_;
    assign new_n37_ = new_n33_ & new_n36_;
    assign new_n38_ = x2 & x3;
    assign new_n39_ = ~x2 & ~x3;
    assign new_n40_ = ~new_n38_ & ~new_n39_;
    assign new_n41_ = new_n15_ & new_n40_;
    assign new_n42_ = new_n16_ & new_n41_;
    assign new_n43_ = new_n17_ & new_n41_;
    assign new_n44_ = ~new_n42_ & ~new_n43_;
    assign new_n45_ = new_n37_ & new_n44_;
    assign new_n46_ = new_n28_ & new_n45_;
    assign new_n47_ = ~new_n15_ & new_n46_;

    assign z0 = ~new_n20_;
    assign z1 = ~new_n21_;
    assign z2 = ~new_n24_;
    assign z3 = ~new_n25_;
    assign z4 = ~new_n31_;
    assign z5 = ~new_n34_;
    assign z6 = ~new_n42_;
    assign z7 = ~new_n47_;
endmodule