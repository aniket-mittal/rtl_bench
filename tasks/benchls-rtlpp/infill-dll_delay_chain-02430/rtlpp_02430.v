module rtlpp_02430 
    ( 
    dll_clk, 
    dll_delayctrlout 
    );
    input [0:0] dll_clk;
    output [5:0] dll_delayctrlout;

    reg [5:0] delay_ctrl_out;
    reg [3:0] delay_chain [0:11];

    [MASKED]

    assign dll_delayctrlout = delay_ctrl_out;
endmodule