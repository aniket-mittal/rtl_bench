module origen_071930(
    input x00, x01, x02, x03, x04, x05, x06, x07,
    input x08, x09, x10, x11, x12, x13, x14, x15, x16,
    output z00, z01, z02, z03, z04, z05, z06, z07,
    output z08, z09, z10, z11, z12, z13, z14, z15
);

    wire new_n34_, new_n35_, new_n36_, new_n37_, new_n38_, new_n39_, new_n40_;
    wire new_n41_, new_n42_, new_n43_, new_n44_, new_n45_, new_n46_, new_n47_;
    wire new_n48_, new_n49_, new_n50_, new_n51_, new_n52_, new_n53_, new_n54_;
    wire new_n55_, new_n56_, new_n57_, new_n58_, new_n59_, new_n60_, new_n61_;
    wire new_n62_, new_n63_, new_n64_, new_n65_, new_n66_, new_n67_, new_n68_;
    wire new_n69_, new_n70_, new_n71_, new_n72_, new_n73_, new_n74_, new_n75_;
    wire new_n76_;

    assign new_n34_ = ~x08 & x13;
    assign new_n35_ = x08 & ~x13;
    assign z00 = new_n35_ & x09;
    assign z01 = new_n35_ & x10;
    assign z02 = new_n35_ & x11;
    assign z03 = new_n35_ & x12;
    assign z04 = x13;
    assign z05 = new_n35_ & x14;
    assign new_n42_ = ~x08 & ~x13;
    assign z06 = x15 | new_n34_;
    assign z07 = new_n35_ & x16;
    assign new_n45_ = ~new_n34_ & ~new_n35_;
    assign new_n46_ = new_n45_ & ~x00;
    assign new_n47_ = new_n34_ & x09;
    assign z08 = new_n46_ | new_n47_ | (x08 & x00);
    assign new_n49_ = new_n45_ & ~x01;
    assign new_n50_ = new_n34_ & x10;
    assign z09 = new_n49_ | new_n50_ | (x08 & x01);
    assign new_n52_ = new_n45_ & ~x02;
    assign new_n53_ = new_n34_ & x11;
    assign z10 = new_n52_ | new_n53_ | (x08 & x02);
    assign new_n55_ = new_n45_ & ~x03;
    assign new_n56_ = new_n34_ & x12;
    assign z11 = new_n55_ | new_n56_ | (x08 & x03);
    assign new_n58_ = new_n45_ & ~x04;
    assign new_n59_ = new_n34_ & x14;
    assign z12 = new_n58_ | new_n59_ | (x08 & x04);
    assign new_n61_ = new_n45_ & ~x05;
    assign new_n62_ = new_n34_ & x15;
    assign z13 = new_n61_ | new_n62_ | (x08 & x05);
    assign new_n64_ = new_n45_ & ~x06;
    assign new_n65_ = new_n34_ & x16;
    assign z14 = new_n64_ | new_n65_ | (x08 & x06);
    assign new_n67_ = new_n45_ & ~x07;
    assign new_n68_ = ~x08 & x13;
    assign z15 = new_n67_ | (new_n68_ & x16) | (x08 & x07);

endmodule