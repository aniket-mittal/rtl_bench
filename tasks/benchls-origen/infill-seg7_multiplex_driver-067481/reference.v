module origen_067481 (
    input wire CLK_clk_i,
    input wire RST_rst_i,
    input wire [6:0] in0_i,
    input wire [6:0] in3_i,
    output wire a_o,
    output wire b_o,
    output wire c_o,
    output wire d_o,
    output wire e_o,
    output wire f_o,
    output wire g_o,
    output wire dp_o,
    output wire [3:0] an_o
);

    localparam N = 18;
    
    reg [N-1:0] count;
    reg [3:0] an_temp;
    reg [6:0] sseg;
    
    always @(posedge CLK_clk_i or posedge RST_rst_i) begin
        if (RST_rst_i)
            count <= 0;
        else
            count <= count + 1;
    end
    
    always @(*) begin
        case (count[N-1:N-2])
            2'b00: begin
                sseg = in0_i;
                an_temp = 4'b1110;
            end
            2'b01: begin
                sseg = 7'b0111111;
                an_temp = 4'b1101;
            end
            2'b10: begin
                sseg = 7'b0111111;
                an_temp = 4'b1011;
            end
            2'b11: begin
                sseg = in3_i;
                an_temp = 4'b0111;
            end
        endcase
    end
    
    assign {a_o, b_o, c_o, d_o, e_o, f_o, g_o} = sseg;
    assign dp_o = 1'b1;
    assign an_o = an_temp;

endmodule