module start_stage(in, trim, reset, out);
    input in;
    input [1:0] trim;
    input reset;
    output out;

    wire d0, d1, d2, ctrl0, one;

    // Internal logic implementation of delaybuf0
    assign d0 = in;

    // Internal logic implementation of delayen1 and delayenb1
    assign d1 = trim[1] ? d0 : in;

    // Internal logic implementation of delayint0
    assign d2 = ~d1;

    // Internal logic implementation of delayen0 and delayenb0
    assign ctrl0 = reset | trim[0];
    assign out = reset ? one : (trim[0] ? d2 : in);

    // Internal logic implementation of reseten0 and const1
    assign one = 1;

endmodule