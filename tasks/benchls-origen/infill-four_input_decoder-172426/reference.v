module origen_172426(
    input x0, x1, x2, x3,
    output z0, z1, z2, z3, z4, z5, z6, z7, z8, z9
);

    wire new_n15_, new_n16_, new_n17_, new_n18_, new_n20_, new_n21_, new_n23_, new_n24_, new_n25_, new_n26_, new_n27_, new_n28_, new_n30_, new_n31_, new_n32_, new_n33_, new_n34_, new_n36_, new_n37_, new_n38_, new_n39_, new_n41_, new_n42_, new_n44_, new_n45_, new_n46_, new_n48_, new_n49_, new_n50_, new_n52_, new_n53_, new_n54_;

    assign new_n15_ = ~x1;
    assign new_n16_ = ~x3;
    assign new_n17_ = x0 & ~x3;
    assign new_n18_ = ~new_n17_;
    assign new_n20_ = x1 & x2;
    assign new_n21_ = ~new_n20_;
    assign z0 = new_n15_ & new_n16_ & new_n18_ & new_n21_;

    assign new_n23_ = x0 & ~x2;
    assign new_n24_ = ~new_n23_;
    assign new_n25_ = ~x0;
    assign new_n26_ = new_n15_ & new_n25_;
    assign new_n27_ = ~new_n26_;
    assign z1 = new_n15_ & new_n24_ & new_n27_;

    assign new_n28_ = x1 & x3;
    assign new_n30_ = x0 & ~new_n28_;
    assign new_n31_ = ~new_n30_;
    assign new_n32_ = ~x1;
    assign new_n33_ = ~x0;
    assign new_n34_ = new_n32_ & new_n33_;
    assign z2 = new_n31_ & new_n34_ & (x1 & ~x3);

    assign new_n36_ = x1 & x2 & ~x3;
    assign new_n37_ = x0 & ~x1;
    assign new_n38_ = ~new_n37_;
    assign new_n39_ = ~x3;
    assign z3 = new_n36_ & new_n38_ & new_n39_;

    assign new_n41_ = ~x0;
    assign new_n42_ = x2 & ~x3;
    assign new_n44_ = new_n41_ & new_n42_;
    assign new_n45_ = x1 & x3;
    assign z4 = new_n44_ & new_n45_;

    assign new_n46_ = ~x1;
    assign new_n48_ = x0 & ~x3;
    assign new_n49_ = ~new_n48_;
    assign new_n50_ = x2 & ~x3;
    assign z5 = new_n46_ & new_n49_ & new_n50_;

    assign new_n52_ = ~new_n33_;
    assign new_n53_ = new_n41_ & new_n42_;
    assign z6 = new_n53_ & new_n52_;

    assign new_n54_ = x1 & x3;
    assign z7 = new_n41_ & ~new_n54_ & ~(new_n41_ & new_n33_ & new_n39_);

    assign z8 = new_n41_ & new_n46_ & new_n33_ & ~(new_n46_ & ~(x0 & new_n33_));

    assign z9 = ~(new_n46_ & new_n16_) & (new_n41_ & ~new_n54_);

endmodule