module origen_091939 (
    input x00, x01, x02, x03, x04, x05, x06, x07, x08, x09,
    input x10, x11, x12, x13, x14, x15, x16, x17, x18, x19,
    input x20, x21, x22, x23, x24,
    output z00, z01, z02, z03, z04, z05, z06, z07,
    output z08, z09, z10, z11, z12, z13, z14, z15
);

    wire new_n50_, new_n51_, new_n52_, new_n53_, new_n54_, new_n55_, new_n56_;
    wire new_n57_, new_n58_, new_n59_, new_n60_, new_n61_, new_n62_, new_n63_;
    wire new_n64_, new_n65_, new_n66_, new_n67_, new_n68_, new_n69_, new_n70_;

    assign z00 = x00;
    assign z06 = x19;

    assign new_n50_ = x01 & x02 & x03 & x04 & x05 & x06 & x07 & x08 & x09;
    assign new_n51_ = ~x00 & ~x19;
    assign new_n52_ = ~x00 & x19;
    assign new_n53_ = x00 & x19;
    assign new_n54_ = x00 & ~x19;
    assign new_n55_ = new_n50_ & new_n51_;
    assign new_n56_ = new_n50_ & new_n52_;
    assign new_n57_ = new_n50_ & new_n53_;
    assign new_n58_ = new_n50_ & new_n54_;
    assign new_n59_ = x10 & x11 & x12 & x13 & x14 & x15 & x16 & x17 & x18;
    assign new_n60_ = new_n59_ & new_n51_;
    assign new_n61_ = new_n59_ & new_n52_;
    assign new_n62_ = new_n59_ & new_n53_;
    assign new_n63_ = new_n59_ & new_n54_;
    assign new_n64_ = x20 & x21;
    assign new_n65_ = new_n64_ & new_n51_;
    assign new_n66_ = new_n64_ & new_n52_;
    assign new_n67_ = new_n64_ & new_n53_;
    assign new_n68_ = new_n64_ & new_n54_;
    assign new_n69_ = x24 & new_n53_;
    assign new_n70_ = ~x24 & new_n53_;

    assign z01 = new_n55_ | new_n60_ | new_n65_;
    assign z02 = new_n56_ | new_n61_ | new_n66_;
    assign z03 = new_n57_ | new_n62_ | new_n67_;
    assign z04 = new_n58_ | new_n63_ | new_n68_;
    assign z05 = new_n69_;
    assign z07 = new_n70_;
    assign z08 = x20 & new_n53_;
    assign z09 = x21 & new_n53_;
    assign z10 = x22 & new_n69_;
    assign z11 = x22 & new_n70_;
    assign z12 = x23 & new_n69_;
    assign z13 = x23 & new_n70_;
    assign z14 = x22 & new_n53_;
    assign z15 = x23 & new_n53_;

endmodule