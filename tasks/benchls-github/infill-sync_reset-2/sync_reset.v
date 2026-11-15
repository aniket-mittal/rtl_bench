module sync_reset #
(
    // depth of synchronizer
    parameter N = 2
)
(
    input  wire clk,
    input  wire rst,
    output wire out
);

(* srl_style = "register" *)
reg [N-1:0] sync_reg = {N{1'b1}};

assign out = sync_reg[N-1];

[MASKED]

endmodule