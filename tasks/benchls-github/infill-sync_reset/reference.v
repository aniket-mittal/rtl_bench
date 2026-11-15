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

always @(posedge clk or posedge rst) begin
    if (rst) begin
        sync_reg <= {N{1'b1}};
    end else begin
        sync_reg <= {sync_reg[N-2:0], 1'b0};
    end
end

endmodule