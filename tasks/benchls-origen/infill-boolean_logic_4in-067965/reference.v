module origen_067965(
    input x0, x1, x2, x3,
    output z0, z1, z2, z3, z4, z5, z6, z7, z8, z9
);

    wire new_n15_, new_n16_, new_n17_, new_n18_, new_n19_, new_n20_, new_n21_;
    wire new_n22_, new_n23_, new_n24_, new_n25_, new_n26_, new_n27_, new_n28_;
    wire new_n29_, new_n30_, new_n31_, new_n32_, new_n33_, new_n34_, new_n35_;
    wire new_n36_, new_n37_, new_n38_, new_n39_, new_n40_, new_n41_, new_n42_;
    wire new_n43_, new_n44_;

    assign new_n15_ = x1 & x2;
    assign new_n16_ = ~x1 & ~x2;
    assign new_n17_ = ~x0 & new_n16_;
    assign new_n18_ = x0 & new_n15_;
    assign new_n19_ = ~new_n17_ & ~new_n18_;
    assign new_n20_ = x3 & ~new_n19_;
    assign new_n21_ = ~x3 & new_n19_;
    assign new_n22_ = ~new_n20_ & ~new_n21_;
    assign new_n23_ = ~x1 & x2;
    assign new_n24_ = x1 & ~x2;
    assign new_n25_ = ~new_n23_ & ~new_n24_;
    assign new_n26_ = x0 & ~new_n25_;
    assign new_n27_ = ~x0 & ~new_n15_;
    assign new_n28_ = ~new_n26_ & ~new_n27_;
    assign new_n29_ = x1 | x2;
    assign new_n30_ = ~x0 & ~new_n29_;
    assign new_n31_ = x3 & ~new_n30_;
    assign new_n32_ = ~x3 & new_n30_;
    assign new_n33_ = ~new_n31_ & ~new_n32_;
    assign new_n34_ = ~new_n28_ & new_n33_;
    assign new_n35_ = ~x1 | ~x2;
    assign new_n36_ = ~x0 & ~new_n35_;
    assign new_n37_ = x3 & new_n36_;
    assign new_n38_ = ~x3 & ~new_n36_;
    assign new_n39_ = ~new_n37_ & ~new_n38_;
    assign new_n40_ = new_n28_ & ~new_n39_;
    assign new_n41_ = ~new_n34_ & ~new_n40_;
    assign new_n42_ = ~x0 & ~x3;
    assign new_n43_ = x0 | new_n42_;
    assign new_n44_ = ~x0 & x1;

    assign z0 = ~new_n22_;
    assign z1 = new_n22_;
    assign z2 = ~new_n41_;
    assign z3 = new_n41_;
    assign z4 = new_n28_;
    assign z5 = ~new_n28_;
    assign z6 = new_n19_;
    assign z7 = ~new_n19_;
    assign z8 = new_n43_;
    assign z9 = x3 ? ~new_n44_ : x0;

endmodule