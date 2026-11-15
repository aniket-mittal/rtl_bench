module origen_034215(
    input x0, x1, x2, x3, x4, x5,
    output z0, z1, z2, z3, z4, z5, z6, z7
);

    wire new_n16_, new_n17_, new_n18_, new_n19_, new_n20_, new_n21_;
    wire new_n22_, new_n23_, new_n24_, new_n25_, new_n26_, new_n27_;
    wire new_n28_, new_n29_, new_n30_, new_n31_, new_n32_, new_n33_;
    wire new_n34_, new_n35_, new_n36_, new_n37_, new_n38_, new_n39_;
    wire new_n40_, new_n41_, new_n42_, new_n43_, new_n44_, new_n45_;
    wire new_n46_, new_n47_;

    assign new_n16_ = ~x1 & x2;
    assign new_n17_ = ~x0 & new_n16_;
    assign new_n18_ = x1 & ~x2;
    assign new_n19_ = x0 & new_n18_;
    assign new_n20_ = ~new_n17_ & ~new_n19_;
    assign new_n21_ = x3 & ~new_n20_;
    assign new_n22_ = ~x3 & new_n20_;
    assign new_n23_ = ~new_n21_ & ~new_n22_;
    assign new_n24_ = x4 & ~new_n23_;
    assign new_n25_ = ~x4 & new_n23_;
    assign new_n26_ = ~new_n24_ & ~new_n25_;
    assign z0 = x5 ^ new_n26_;

    assign new_n28_ = x3 ^ new_n20_;
    assign new_n29_ = x4 & ~new_n28_;
    assign new_n30_ = ~x4 & new_n28_;
    assign new_n31_ = ~new_n29_ & ~new_n30_;
    assign z1 = x5 ^ new_n31_;

    assign new_n33_ = ~x3 & ~new_n20_;
    assign new_n34_ = x3 & new_n20_;
    assign new_n35_ = ~new_n33_ & ~new_n34_;
    assign z2 = x4 ^ new_n35_;

    assign z3 = x3 ^ new_n20_;

    assign new_n38_ = ~x1 & ~x2;
    assign new_n39_ = x1 & x2;
    assign new_n40_ = ~new_n38_ & ~new_n39_;
    assign new_n41_ = x0 & ~new_n40_;
    assign new_n42_ = ~x0 & new_n40_;
    assign new_n43_ = ~new_n41_ & ~new_n42_;
    assign new_n44_ = ~x3 & ~new_n43_;
    assign new_n45_ = x3 & new_n43_;
    assign new_n46_ = ~new_n44_ & ~new_n45_;
    assign new_n47_ = x5 & ~x4;
    assign z4 = new_n46_ ^ new_n47_;

    assign z5 = 1'b1;

    assign z6 = new_n46_ ^ x4;

    assign z7 = x0 ^ x2;

endmodule