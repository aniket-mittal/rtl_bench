module rtlpp_02437 (
    dll_clk,
    dll_delayctrlout
);

    input  [0:0]  dll_clk;
    output [5:0]  dll_delayctrlout;

    wire [5:0] sub_wire0;

    // Internal logic replacing the instantiated module stratixiii_dll
    reg [5:0] delay_ctrl_value;
    [MASKED]

    assign sub_wire0 = delay_ctrl_value;
    assign dll_delayctrlout = sub_wire0;

endmodule