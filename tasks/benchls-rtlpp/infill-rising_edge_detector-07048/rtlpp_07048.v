module rtlpp_07048(
    input wire clk,
    input wire signal,
    output reg outedge
    );

    reg [1:0] c_state ;
    reg [1:0] r_state ;

    // State encoding
    localparam ZERO = 2'd0;
    localparam CHANGE = 2'd1;
    localparam ONE = 2'd2;

    [MASKED]

    always @( posedge clk ) begin
        r_state <= c_state ;
    end

endmodule